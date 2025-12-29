-- ========================================
-- แก้ไขปัญหาดอกเบี้ยสะสมไม่แสดง
-- ========================================

-- ขั้นตอนที่ 1: ตรวจสอบข้อมูลตัวอย่าง
SELECT 
  contract_no,
  principal_amount,
  interest_rate,
  start_date,
  loan_period_months,
  CURRENT_DATE AS today,
  -- คำนวณจำนวนเดือนที่ผ่านไป
  EXTRACT(YEAR FROM AGE(CURRENT_DATE, start_date))::INTEGER * 12 + 
  EXTRACT(MONTH FROM AGE(CURRENT_DATE, start_date))::INTEGER AS months_passed,
  -- คำนวณดอกเบี้ยสะสม
  ROUND(
    principal_amount * (interest_rate / 100) * 
    (EXTRACT(YEAR FROM AGE(CURRENT_DATE, start_date))::INTEGER * 12 + 
     EXTRACT(MONTH FROM AGE(CURRENT_DATE, start_date))::INTEGER)
  , 2) AS calculated_interest
FROM loan_contracts
LIMIT 5;

-- ขั้นตอนที่ 2: ลบและสร้าง View ใหม่
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
  -- จำนวนเดือนที่ผ่านไป
  GREATEST(0, 
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, c.start_date))::INTEGER * 12 + 
    EXTRACT(MONTH FROM AGE(CURRENT_DATE, c.start_date))::INTEGER
  ) AS months_elapsed,
  -- ดอกเบี้ยต่อเดือน
  ROUND(c.principal_amount * (c.interest_rate / 100), 2) AS monthly_interest,
  -- ดอกเบี้ยสะสม (ไม่เกินระยะเวลาสัญญา)
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
  -- ยอดรวมที่ต้องชำระ
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

-- ขั้นตอนที่ 3: ตรวจสอบผลลัพธ์
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
  total_paid,
  balance
FROM v_contract_balances
ORDER BY contract_no
LIMIT 10;

-- ขั้นตอนที่ 4: สรุปสถิติ
SELECT 
  COUNT(*) AS total_contracts,
  SUM(CASE WHEN accumulated_interest > 0 THEN 1 ELSE 0 END) AS contracts_with_interest,
  SUM(CASE WHEN accumulated_interest = 0 THEN 1 ELSE 0 END) AS contracts_without_interest,
  ROUND(AVG(accumulated_interest), 2) AS avg_interest,
  ROUND(SUM(accumulated_interest), 2) AS total_interest
FROM v_contract_balances;
