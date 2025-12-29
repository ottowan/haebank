-- ตรวจสอบข้อมูลจริงในฐานข้อมูล
-- เพื่อหาสาเหตุที่ดอกเบี้ยสะสมเป็น 0

-- 1. ตรวจสอบข้อมูลสัญญาตัวอย่าง
SELECT 
  contract_no,
  start_date,
  CURRENT_DATE AS today,
  CURRENT_DATE - start_date AS days_diff,
  -- คำนวณจำนวนเดือนที่ผ่านไป
  EXTRACT(YEAR FROM AGE(CURRENT_DATE, start_date))::INTEGER * 12 + 
  EXTRACT(MONTH FROM AGE(CURRENT_DATE, start_date))::INTEGER AS months_elapsed,
  principal_amount,
  interest_rate,
  -- คำนวณดอกเบี้ยสะสม
  ROUND(
    principal_amount * (interest_rate / 100) * 
    (EXTRACT(YEAR FROM AGE(CURRENT_DATE, start_date))::INTEGER * 12 + 
     EXTRACT(MONTH FROM AGE(CURRENT_DATE, start_date))::INTEGER)
  , 2) AS calculated_interest
FROM loan_contracts
ORDER BY start_date DESC
LIMIT 10;

-- 2. ตรวจสอบว่า View คำนวณถูกต้องหรือไม่
SELECT 
  contract_no,
  start_date,
  months_elapsed,
  monthly_interest,
  accumulated_interest,
  total_amount
FROM v_contract_balances
ORDER BY contract_no
LIMIT 10;

-- 3. ตรวจสอบสถิติวันที่
SELECT 
  MIN(start_date) AS earliest_contract,
  MAX(start_date) AS latest_contract,
  CURRENT_DATE AS today,
  COUNT(*) AS total_contracts,
  COUNT(CASE WHEN start_date > CURRENT_DATE THEN 1 END) AS future_contracts,
  COUNT(CASE WHEN start_date <= CURRENT_DATE THEN 1 END) AS past_contracts
FROM loan_contracts;
