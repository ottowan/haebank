-- ========================================
-- สร้าง Views ทั้งหมดใหม่
-- ========================================

-- 1. View: v_contract_balances (คำนวณดอกเบี้ยไม่จำกัด)
DROP VIEW IF EXISTS v_contract_balances CASCADE;

CREATE VIEW v_contract_balances AS
SELECT 
  c.id AS contract_id,
  c.contract_no,
  c.member_id,
  m.member_code,
  COALESCE(m.title_prefix, '') AS title_prefix,
  m.first_name,
  m.last_name,
  m.phone,
  c.principal_amount,
  c.interest_rate,
  c.start_date,
  c.loan_period_months,
  (c.start_date + (c.loan_period_months || ' months')::INTERVAL)::DATE AS end_date,
  c.status,
  GREATEST(0, 
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, c.start_date))::INTEGER * 12 + 
    EXTRACT(MONTH FROM AGE(CURRENT_DATE, c.start_date))::INTEGER
  ) AS months_elapsed,
  ROUND(c.principal_amount * (c.interest_rate / 100), 2) AS monthly_interest,
  ROUND(
    c.principal_amount * (c.interest_rate / 100) * 
    GREATEST(0, 
      EXTRACT(YEAR FROM AGE(CURRENT_DATE, c.start_date))::INTEGER * 12 + 
      EXTRACT(MONTH FROM AGE(CURRENT_DATE, c.start_date))::INTEGER
    ), 2
  ) AS accumulated_interest,
  COALESCE(SUM(p.amount), 0) AS total_paid,
  c.principal_amount + 
  ROUND(
    c.principal_amount * (c.interest_rate / 100) * 
    GREATEST(0, 
      EXTRACT(YEAR FROM AGE(CURRENT_DATE, c.start_date))::INTEGER * 12 + 
      EXTRACT(MONTH FROM AGE(CURRENT_DATE, c.start_date))::INTEGER
    ), 2
  ) AS total_amount,
  c.principal_amount + 
  ROUND(
    c.principal_amount * (c.interest_rate / 100) * 
    GREATEST(0, 
      EXTRACT(YEAR FROM AGE(CURRENT_DATE, c.start_date))::INTEGER * 12 + 
      EXTRACT(MONTH FROM AGE(CURRENT_DATE, c.start_date))::INTEGER
    ), 2
  ) - COALESCE(SUM(p.amount), 0) AS balance,
  c.created_at,
  c.updated_at
FROM loan_contracts c
INNER JOIN members m ON c.member_id = m.id
LEFT JOIN loan_payments p ON c.id = p.contract_id
GROUP BY c.id, m.id;

-- 2. View: v_dashboard_summary (แก้ไข Cross Join)
DROP VIEW IF EXISTS v_dashboard_summary CASCADE;

CREATE VIEW v_dashboard_summary AS
SELECT 
  m.total_members,
  -- Active: สถานะ Active และยังไม่เลยกำหนดชำระ
  COUNT(DISTINCT CASE WHEN status = 'active' AND end_date >= CURRENT_DATE THEN c.contract_id END) AS active_contracts,
  -- Overdue: สถานะ Overdue หรือ (สถานะ Active แต่เลยกำหนดชำระแล้ว)
  COUNT(DISTINCT CASE WHEN status = 'overdue' OR (status = 'active' AND end_date < CURRENT_DATE) THEN c.contract_id END) AS overdue_contracts,
  COUNT(DISTINCT CASE WHEN status = 'closed' THEN c.contract_id END) AS closed_contracts,
  
  -- ยอดเงินต้นคงเหลือ (แยกตามสถานะจริง)
  COALESCE(SUM(CASE 
    WHEN (status = 'active' AND end_date >= CURRENT_DATE) OR (status = 'overdue' OR (status = 'active' AND end_date < CURRENT_DATE)) 
    THEN c.principal_amount 
    ELSE 0 
  END), 0) AS total_active_principal,
  
  -- ยอดหนี้คงเหลือรวม (Active + Overdue)
  COALESCE(SUM(CASE 
    WHEN (status = 'active' AND end_date >= CURRENT_DATE) OR (status = 'overdue' OR (status = 'active' AND end_date < CURRENT_DATE)) 
    THEN c.balance 
    ELSE 0 
  END), 0) AS total_outstanding,
  
  COALESCE(SUM(CASE 
    WHEN (status = 'active' AND end_date >= CURRENT_DATE) OR (status = 'overdue' OR (status = 'active' AND end_date < CURRENT_DATE)) 
    THEN c.accumulated_interest 
    ELSE 0 
  END), 0) AS total_interest_earned,
  
  COALESCE(SUM(c.total_paid), 0) AS total_payments_received
FROM v_contract_balances c
CROSS JOIN (SELECT COUNT(*) AS total_members FROM members) m
GROUP BY m.total_members;

-- 3. View: v_contracts_near_due (สัญญาใกล้ครบกำหนด 30 วัน)
DROP VIEW IF EXISTS v_contracts_near_due CASCADE;

CREATE VIEW v_contracts_near_due AS
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

-- ตรวจสอบผลลัพธ์
SELECT * FROM v_dashboard_summary;
