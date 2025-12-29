-- ========================================
-- สร้าง/อัปเดต View สำหรับคำนวณยอดคงเหลือและดอกเบี้ยสะสม
-- ========================================

DROP VIEW IF EXISTS v_contract_balances CASCADE;

CREATE OR REPLACE VIEW v_contract_balances AS
SELECT 
  c.id AS contract_id,
  c.contract_no,
  c.member_id,
  m.member_code,
  m.title_prefix,
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

-- ตรวจสอบผลลัพธ์
SELECT 
  contract_no,
  CONCAT(title_prefix, ' ', first_name, ' ', last_name) AS member_name,
  principal_amount,
  interest_rate,
  start_date,
  months_elapsed,
  accumulated_interest,
  total_amount,
  total_paid,
  balance
FROM v_contract_balances
ORDER BY contract_no
LIMIT 10;
