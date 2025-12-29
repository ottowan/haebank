-- ========================================
-- แก้ไขวันที่จาก พ.ศ. เป็น ค.ศ.
-- ========================================

-- ขั้นตอนที่ 1: ตรวจสอบวันที่ปัจจุบัน
SELECT 
  contract_no,
  start_date AS current_date_buddhist,
  start_date - INTERVAL '543 years' AS converted_date_christian,
  EXTRACT(YEAR FROM start_date) AS year_buddhist,
  EXTRACT(YEAR FROM start_date - INTERVAL '543 years') AS year_christian
FROM loan_contracts
ORDER BY contract_no
LIMIT 10;

-- ขั้นตอนที่ 2: อัปเดตวันที่ทั้งหมดจาก พ.ศ. เป็น ค.ศ.
-- (ลบ 543 ปี)
UPDATE loan_contracts
SET start_date = start_date - INTERVAL '543 years'
WHERE EXTRACT(YEAR FROM start_date) > 2100;  -- เฉพาะวันที่ที่เป็น พ.ศ. (มากกว่า 2100)

-- ขั้นตอนที่ 3: ตรวจสอบผลลัพธ์หลังอัปเดต
SELECT 
  contract_no,
  start_date,
  CURRENT_DATE AS today,
  CURRENT_DATE - start_date AS days_passed,
  EXTRACT(YEAR FROM AGE(CURRENT_DATE, start_date))::INTEGER * 12 + 
  EXTRACT(MONTH FROM AGE(CURRENT_DATE, start_date))::INTEGER AS months_elapsed
FROM loan_contracts
ORDER BY contract_no
LIMIT 10;

-- ขั้นตอนที่ 4: ตรวจสอบดอกเบี้ยสะสมจาก View
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

-- ขั้นตอนที่ 5: สรุปสถิติ
SELECT 
  COUNT(*) AS total_contracts,
  MIN(start_date) AS earliest_date,
  MAX(start_date) AS latest_date,
  SUM(CASE WHEN accumulated_interest > 0 THEN 1 ELSE 0 END) AS contracts_with_interest,
  ROUND(SUM(accumulated_interest), 2) AS total_accumulated_interest
FROM v_contract_balances;
