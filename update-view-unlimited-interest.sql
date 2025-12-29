-- ========================================
-- อัปเดต View ให้คำนวณดอกเบี้ยสะสมตามจำนวนเดือนจริง
-- (ไม่จำกัดตามระยะเวลาสัญญา)
-- ========================================

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
  -- วันที่สิ้นสุดสัญญา
  (c.start_date + (c.loan_period_months || ' months')::INTERVAL)::DATE AS end_date,
  c.status,
  -- จำนวนเดือนที่ผ่านไป (ไม่จำกัด)
  GREATEST(0, 
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, c.start_date))::INTEGER * 12 + 
    EXTRACT(MONTH FROM AGE(CURRENT_DATE, c.start_date))::INTEGER
  ) AS months_elapsed,
  -- ดอกเบี้ยต่อเดือน
  ROUND(c.principal_amount * (c.interest_rate / 100), 2) AS monthly_interest,
  -- ดอกเบี้ยสะสม (คำนวณตามจำนวนเดือนจริง ไม่จำกัด)
  ROUND(
    c.principal_amount * (c.interest_rate / 100) * 
    GREATEST(0, 
      EXTRACT(YEAR FROM AGE(CURRENT_DATE, c.start_date))::INTEGER * 12 + 
      EXTRACT(MONTH FROM AGE(CURRENT_DATE, c.start_date))::INTEGER
    ), 2
  ) AS accumulated_interest,
  -- ยอดที่ชำระแล้ว
  COALESCE(SUM(p.amount), 0) AS total_paid,
  -- ยอดรวมที่ต้องชำระ (เงินต้น + ดอกเบี้ยสะสม)
  c.principal_amount + 
  ROUND(
    c.principal_amount * (c.interest_rate / 100) * 
    GREATEST(0, 
      EXTRACT(YEAR FROM AGE(CURRENT_DATE, c.start_date))::INTEGER * 12 + 
      EXTRACT(MONTH FROM AGE(CURRENT_DATE, c.start_date))::INTEGER
    ), 2
  ) AS total_amount,
  -- ยอดคงเหลือ
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

-- ตรวจสอบผลลัพธ์
SELECT 
  contract_no,
  CONCAT(COALESCE(title_prefix || ' ', ''), first_name, ' ', last_name) AS member_name,
  principal_amount,
  interest_rate || '%' AS rate,
  start_date,
  months_elapsed || ' เดือน' AS elapsed,
  monthly_interest,
  accumulated_interest,
  total_amount,
  balance
FROM v_contract_balances
ORDER BY months_elapsed DESC
LIMIT 10;

-- สรุปสถิติ
SELECT 
  COUNT(*) AS total_contracts,
  ROUND(AVG(months_elapsed), 1) AS avg_months_elapsed,
  MAX(months_elapsed) AS max_months_elapsed,
  ROUND(SUM(accumulated_interest), 2) AS total_accumulated_interest,
  ROUND(AVG(accumulated_interest), 2) AS avg_accumulated_interest
FROM v_contract_balances;
