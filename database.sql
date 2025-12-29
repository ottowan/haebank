-- ========================================
-- ระบบลูกหนี้เงินกู้ (Loan Debtor System)
-- Database Schema for Supabase
-- ========================================

-- ========================================
-- 1. ตาราง members (สมาชิก)
-- ========================================
CREATE TABLE IF NOT EXISTS members (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  member_code VARCHAR(20) UNIQUE NOT NULL,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  phone VARCHAR(20),
  address TEXT,
  status VARCHAR(20) DEFAULT 'active' CHECK (status IN ('active', 'inactive')),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Index สำหรับการค้นหา
CREATE INDEX IF NOT EXISTS idx_members_code ON members(member_code);
CREATE INDEX IF NOT EXISTS idx_members_status ON members(status);
CREATE INDEX IF NOT EXISTS idx_members_name ON members(first_name, last_name);

-- Trigger สำหรับอัปเดต updated_at
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_members_updated_at
BEFORE UPDATE ON members
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();

-- ========================================
-- 2. ตาราง loan_contracts (สัญญาเงินกู้)
-- ========================================
CREATE TABLE IF NOT EXISTS loan_contracts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  contract_no VARCHAR(50) UNIQUE NOT NULL,
  member_id UUID NOT NULL REFERENCES members(id) ON DELETE RESTRICT,
  principal_amount DECIMAL(15,2) NOT NULL CHECK (principal_amount > 0),
  interest_rate DECIMAL(5,2) DEFAULT 1.00 CHECK (interest_rate >= 0),
  start_date DATE NOT NULL,
  loan_period_months INTEGER NOT NULL CHECK (loan_period_months > 0),
  status VARCHAR(20) DEFAULT 'active' CHECK (status IN ('active', 'closed', 'overdue')),
  note TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  created_by UUID REFERENCES auth.users(id)
);

-- Index สำหรับการค้นหาและ JOIN
CREATE INDEX IF NOT EXISTS idx_contracts_member ON loan_contracts(member_id);
CREATE INDEX IF NOT EXISTS idx_contracts_status ON loan_contracts(status);
CREATE INDEX IF NOT EXISTS idx_contracts_start_date ON loan_contracts(start_date);
CREATE INDEX IF NOT EXISTS idx_contracts_contract_no ON loan_contracts(contract_no);

-- Trigger สำหรับอัปเดต updated_at
CREATE TRIGGER trg_contracts_updated_at
BEFORE UPDATE ON loan_contracts
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();

-- ========================================
-- 3. ตาราง loan_payments (การชำระเงิน)
-- ========================================
CREATE TABLE IF NOT EXISTS loan_payments (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  contract_id UUID NOT NULL REFERENCES loan_contracts(id) ON DELETE RESTRICT,
  payment_date DATE NOT NULL DEFAULT CURRENT_DATE,
  amount DECIMAL(15,2) NOT NULL CHECK (amount > 0),
  payment_type VARCHAR(20) NOT NULL CHECK (payment_type IN ('installment', 'partial', 'close')),
  note TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  created_by UUID REFERENCES auth.users(id)
);

-- Index สำหรับการค้นหา
CREATE INDEX IF NOT EXISTS idx_payments_contract ON loan_payments(contract_id);
CREATE INDEX IF NOT EXISTS idx_payments_date ON loan_payments(payment_date);
CREATE INDEX IF NOT EXISTS idx_payments_type ON loan_payments(payment_type);

-- ========================================
-- 4. View สำหรับคำนวณยอดคงเหลือ
-- ========================================
CREATE OR REPLACE VIEW v_contract_balances AS
SELECT 
  c.id AS contract_id,
  c.contract_no,
  c.member_id,
  m.member_code,
  m.first_name,
  m.last_name,
  m.phone,
  c.principal_amount,
  c.interest_rate,
  c.start_date,
  c.loan_period_months,
  -- คำนวณวันที่สิ้นสุดสัญญา
  (c.start_date + (c.loan_period_months || ' months')::INTERVAL)::DATE AS end_date,
  c.status,
  -- คำนวณจำนวนเดือนที่ผ่านไป
  GREATEST(0, 
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, c.start_date))::INTEGER * 12 + 
    EXTRACT(MONTH FROM AGE(CURRENT_DATE, c.start_date))::INTEGER
  ) AS months_elapsed,
  -- คำนวณดอกเบี้ยต่อเดือน
  ROUND(c.principal_amount * (c.interest_rate / 100), 2) AS monthly_interest,
  -- คำนวณดอกเบี้ยสะสม (ไม่เกินระยะเวลาสัญญา)
  ROUND(
    c.principal_amount * (c.interest_rate / 100) * 
    LEAST(
      c.loan_period_months,
      GREATEST(0, 
        EXTRACT(YEAR FROM AGE(CURRENT_DATE, c.start_date))::INTEGER * 12 + 
        EXTRACT(MONTH FROM AGE(CURRENT_DATE, c.start_date))::INTEGER
      )
    ), 2
  ) AS accumulated_interest,
  -- ยอดที่ชำระแล้ว
  COALESCE(SUM(p.amount), 0) AS total_paid,
  -- ยอดรวมที่ต้องชำระ (เงินต้น + ดอกเบี้ยสะสม)
  c.principal_amount + 
  ROUND(
    c.principal_amount * (c.interest_rate / 100) * 
    LEAST(
      c.loan_period_months,
      GREATEST(0, 
        EXTRACT(YEAR FROM AGE(CURRENT_DATE, c.start_date))::INTEGER * 12 + 
        EXTRACT(MONTH FROM AGE(CURRENT_DATE, c.start_date))::INTEGER
      )
    ), 2
  ) AS total_amount,
  -- ยอดคงเหลือ
  c.principal_amount + 
  ROUND(
    c.principal_amount * (c.interest_rate / 100) * 
    LEAST(
      c.loan_period_months,
      GREATEST(0, 
        EXTRACT(YEAR FROM AGE(CURRENT_DATE, c.start_date))::INTEGER * 12 + 
        EXTRACT(MONTH FROM AGE(CURRENT_DATE, c.start_date))::INTEGER
      )
    ), 2
  ) - COALESCE(SUM(p.amount), 0) AS balance,
  c.created_at,
  c.updated_at
FROM loan_contracts c
INNER JOIN members m ON c.member_id = m.id
LEFT JOIN loan_payments p ON c.id = p.contract_id
GROUP BY c.id, m.id;

-- ========================================
-- 5. Function อัปเดตสถานะสัญญาอัตโนมัติ
-- ========================================
CREATE OR REPLACE FUNCTION update_contract_status()
RETURNS TRIGGER AS $$
DECLARE
  v_balance DECIMAL(15,2);
BEGIN
  -- คำนวณยอดคงเหลือ
  SELECT balance INTO v_balance
  FROM v_contract_balances 
  WHERE contract_id = NEW.contract_id;
  
  -- ถ้าชำระครบแล้ว ให้เปลี่ยนสถานะเป็น closed
  IF v_balance <= 0 THEN
    UPDATE loan_contracts 
    SET status = 'closed', updated_at = NOW()
    WHERE id = NEW.contract_id;
  END IF;
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger เมื่อมีการบันทึกการชำระเงิน
DROP TRIGGER IF EXISTS trg_update_contract_status ON loan_payments;
CREATE TRIGGER trg_update_contract_status
AFTER INSERT ON loan_payments
FOR EACH ROW
EXECUTE FUNCTION update_contract_status();

-- ========================================
-- 6. Function ตรวจสอบสัญญาค้างชำระ
-- ========================================
CREATE OR REPLACE FUNCTION check_overdue_contracts()
RETURNS INTEGER AS $$
DECLARE
  v_updated_count INTEGER;
BEGIN
  -- อัปเดตสถานะเป็น overdue สำหรับสัญญาที่เลยกำหนดและยังมียอดคงเหลือ
  WITH updated AS (
    UPDATE loan_contracts c
    SET status = 'overdue', updated_at = NOW()
    WHERE c.status = 'active'
      AND (c.start_date + (c.loan_period_months || ' months')::INTERVAL)::DATE < CURRENT_DATE
      AND c.id IN (
        SELECT contract_id 
        FROM v_contract_balances 
        WHERE balance > 0
      )
    RETURNING c.id
  )
  SELECT COUNT(*) INTO v_updated_count FROM updated;
  
  RETURN v_updated_count;
END;
$$ LANGUAGE plpgsql;

-- ========================================
-- 7. View สำหรับ Dashboard
-- ========================================

-- View: สรุปยอดรวมทั้งหมด
CREATE OR REPLACE VIEW v_dashboard_summary AS
SELECT 
  COUNT(DISTINCT CASE WHEN status = 'active' THEN contract_id END) AS active_contracts,
  COUNT(DISTINCT CASE WHEN status = 'overdue' THEN contract_id END) AS overdue_contracts,
  COUNT(DISTINCT CASE WHEN status = 'closed' THEN contract_id END) AS closed_contracts,
  COALESCE(SUM(CASE WHEN status IN ('active', 'overdue') THEN balance ELSE 0 END), 0) AS total_outstanding,
  COALESCE(SUM(CASE WHEN status IN ('active', 'overdue') THEN accumulated_interest ELSE 0 END), 0) AS total_interest_earned,
  COALESCE(SUM(total_paid), 0) AS total_payments_received
FROM v_contract_balances;

-- View: สัญญาใกล้ครบกำหนด (30 วัน)
CREATE OR REPLACE VIEW v_contracts_near_due AS
SELECT 
  contract_id,
  contract_no,
  member_code,
  first_name,
  last_name,
  phone,
  principal_amount,
  balance,
  end_date,
  end_date - CURRENT_DATE AS days_until_due
FROM v_contract_balances
WHERE status = 'active'
  AND end_date BETWEEN CURRENT_DATE AND CURRENT_DATE + INTERVAL '30 days'
ORDER BY end_date ASC;

-- ========================================
-- 8. Row Level Security (RLS)
-- ========================================

-- เปิดใช้งาน RLS
ALTER TABLE members ENABLE ROW LEVEL SECURITY;
ALTER TABLE loan_contracts ENABLE ROW LEVEL SECURITY;
ALTER TABLE loan_payments ENABLE ROW LEVEL SECURITY;

-- ลบ Policy เก่า (ถ้ามี)
DROP POLICY IF EXISTS admin_all_members ON members;
DROP POLICY IF EXISTS admin_all_contracts ON loan_contracts;
DROP POLICY IF EXISTS admin_all_payments ON loan_payments;
DROP POLICY IF EXISTS staff_read_members ON members;
DROP POLICY IF EXISTS staff_read_contracts ON loan_contracts;
DROP POLICY IF EXISTS staff_read_payments ON loan_payments;
DROP POLICY IF EXISTS staff_insert_contracts ON loan_contracts;
DROP POLICY IF EXISTS staff_insert_payments ON loan_payments;

-- Policy สำหรับ Admin (เข้าถึงได้ทั้งหมด)
CREATE POLICY admin_all_members ON members
  FOR ALL
  TO authenticated
  USING (
    (auth.jwt()->>'role')::TEXT = 'admin'
    OR
    (auth.jwt()->'user_metadata'->>'role')::TEXT = 'admin'
  );

CREATE POLICY admin_all_contracts ON loan_contracts
  FOR ALL
  TO authenticated
  USING (
    (auth.jwt()->>'role')::TEXT = 'admin'
    OR
    (auth.jwt()->'user_metadata'->>'role')::TEXT = 'admin'
  );

CREATE POLICY admin_all_payments ON loan_payments
  FOR ALL
  TO authenticated
  USING (
    (auth.jwt()->>'role')::TEXT = 'admin'
    OR
    (auth.jwt()->'user_metadata'->>'role')::TEXT = 'admin'
  );

-- Policy สำหรับ Staff (อ่านได้ทั้งหมด)
CREATE POLICY staff_read_members ON members
  FOR SELECT
  TO authenticated
  USING (
    (auth.jwt()->>'role')::TEXT IN ('admin', 'staff')
    OR
    (auth.jwt()->'user_metadata'->>'role')::TEXT IN ('admin', 'staff')
  );

CREATE POLICY staff_read_contracts ON loan_contracts
  FOR SELECT
  TO authenticated
  USING (
    (auth.jwt()->>'role')::TEXT IN ('admin', 'staff')
    OR
    (auth.jwt()->'user_metadata'->>'role')::TEXT IN ('admin', 'staff')
  );

CREATE POLICY staff_read_payments ON loan_payments
  FOR SELECT
  TO authenticated
  USING (
    (auth.jwt()->>'role')::TEXT IN ('admin', 'staff')
    OR
    (auth.jwt()->'user_metadata'->>'role')::TEXT IN ('admin', 'staff')
  );

-- Policy สำหรับ Staff (สร้างสัญญาและบันทึกการชำระเงินได้)
CREATE POLICY staff_insert_contracts ON loan_contracts
  FOR INSERT
  TO authenticated
  WITH CHECK (
    (auth.jwt()->>'role')::TEXT IN ('admin', 'staff')
    OR
    (auth.jwt()->'user_metadata'->>'role')::TEXT IN ('admin', 'staff')
  );

CREATE POLICY staff_insert_payments ON loan_payments
  FOR INSERT
  TO authenticated
  WITH CHECK (
    (auth.jwt()->>'role')::TEXT IN ('admin', 'staff')
    OR
    (auth.jwt()->'user_metadata'->>'role')::TEXT IN ('admin', 'staff')
  );

-- ========================================
-- 9. ข้อมูลตัวอย่าง (Sample Data)
-- ========================================

-- เพิ่มสมาชิกตัวอย่าง
INSERT INTO members (member_code, first_name, last_name, phone, address, status) VALUES
  ('M001', 'สมชาย', 'ใจดี', '081-234-5678', '123 ถ.สุขุมวิท แขวงคลองเตย เขตคลองเตย กรุงเทพฯ 10110', 'active'),
  ('M002', 'สมหญิง', 'รักสงบ', '082-345-6789', '456 ถ.พระราม 4 แขวงคลองตัน เขตคลองเตย กรุงเทพฯ 10110', 'active'),
  ('M003', 'สมศักดิ์', 'มั่งมี', '083-456-7890', '789 ถ.สาทร แขวงยานนาวา เขตสาทร กรุงเทพฯ 10120', 'active'),
  ('M004', 'สมหมาย', 'เจริญสุข', '084-567-8901', '321 ถ.ศรีนครินทร์ แขวงหนองบอน เขตประเวศ กรุงเทพฯ 10250', 'active'),
  ('M005', 'สมพร', 'สุขสันต์', '085-678-9012', '654 ถ.พัฒนาการ แขวงสวนหลวง เขตสวนหลวง กรุงเทพฯ 10250', 'active')
ON CONFLICT (member_code) DO NOTHING;

-- เพิ่มสัญญาเงินกู้ตัวอย่าง
INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024001',
  id,
  100000.00,
  1.00,
  '2024-01-01',
  12,
  'active',
  'สัญญาเงินกู้ปกติ'
FROM members WHERE member_code = 'M001'
ON CONFLICT (contract_no) DO NOTHING;

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024002',
  id,
  50000.00,
  1.00,
  '2024-03-15',
  6,
  'active',
  'สัญญาเงินกู้ระยะสั้น'
FROM members WHERE member_code = 'M002'
ON CONFLICT (contract_no) DO NOTHING;

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024003',
  id,
  200000.00,
  1.00,
  '2024-06-01',
  24,
  'active',
  'สัญญาเงินกู้ระยะยาว'
FROM members WHERE member_code = 'M003'
ON CONFLICT (contract_no) DO NOTHING;

-- เพิ่มการชำระเงินตัวอย่าง
INSERT INTO loan_payments (contract_id, payment_date, amount, payment_type, note)
SELECT 
  id,
  '2024-02-01',
  10000.00,
  'installment',
  'ชำระงวดที่ 1'
FROM loan_contracts WHERE contract_no = 'LC2024001'
ON CONFLICT DO NOTHING;

INSERT INTO loan_payments (contract_id, payment_date, amount, payment_type, note)
SELECT 
  id,
  '2024-03-01',
  10000.00,
  'installment',
  'ชำระงวดที่ 2'
FROM loan_contracts WHERE contract_no = 'LC2024001'
ON CONFLICT DO NOTHING;

-- ========================================
-- 10. คำสั่งที่เป็นประโยชน์
-- ========================================

-- ตรวจสอบสัญญาค้างชำระ
-- SELECT check_overdue_contracts();

-- ดูสรุปยอดรวม
-- SELECT * FROM v_dashboard_summary;

-- ดูสัญญาใกล้ครบกำหนด
-- SELECT * FROM v_contracts_near_due;

-- ดูยอดคงเหลือทั้งหมด
-- SELECT * FROM v_contract_balances ORDER BY balance DESC;
