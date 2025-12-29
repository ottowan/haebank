-- ========================================
-- Import ข้อมูลจาก source.xlsx
-- สร้างเมื่อ: 29/12/2568 18:41:18
-- จำนวนรายการ: 260
-- ========================================

-- ลบข้อมูลตัวอย่างเดิม (ถ้ามี)
DELETE FROM loan_payments WHERE contract_id IN (
  SELECT id FROM loan_contracts WHERE contract_no LIKE 'LC%'
);
DELETE FROM loan_contracts WHERE contract_no LIKE 'LC%';
DELETE FROM members WHERE member_code LIKE 'M%';

-- Insert ข้อมูลสมาชิกและสัญญา

-- 1. นาง สมรักษ์ กันทะสอน (M320)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M320',
  'นาง',
  'สมรักษ์', 
  'กันทะสอน', 
  NULL,
  '12',
  '1',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 12 หมู่ 1 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M320',
  id,
  50000,
  1.00,
  '2558-05-07',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 320 | ต้นเงิน: 50,000 | ดอกเบี้ย: 49,500 | รวม: 99,500'
FROM members WHERE member_code = 'M320'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 2. นาง พัชรินทร์ สุไว (M321)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M321',
  'นาง',
  'พัชรินทร์', 
  'สุไว', 
  NULL,
  '68',
  '1',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 68 หมู่ 1 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M321',
  id,
  51565,
  1.00,
  '2558-05-08',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 321 | ต้นเงิน: 51,565 | ดอกเบี้ย: 51,049.35 | รวม: 102,614.35'
FROM members WHERE member_code = 'M321'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 3. นาง คำแปง สมบุญนาค (M333)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M333',
  'นาง',
  'คำแปง', 
  'สมบุญนาค', 
  NULL,
  '217',
  '1',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 217 หมู่ 1 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M333',
  id,
  50071,
  1.00,
  '2558-05-13',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 333 | ต้นเงิน: 50,071 | ดอกเบี้ย: 49,570.29 | รวม: 99,641.29'
FROM members WHERE member_code = 'M333'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 4. นาง วิมล ดีรพัฒน์ (M340) - อายุ 66 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M340',
  'นาง',
  'วิมล', 
  'ดีรพัฒน์', 
  66,
  '7',
  '1',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 7 หมู่ 1 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M340',
  id,
  30000,
  1.00,
  '2558-05-19',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 340 | ต้นเงิน: 30,000 | ดอกเบี้ย: 29,700 | รวม: 59,700'
FROM members WHERE member_code = 'M340'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 5. นาย อธิศ บัวเย็น (M357)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M357',
  'นาย',
  'อธิศ', 
  'บัวเย็น', 
  NULL,
  '50',
  '1',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 50 หมู่ 1 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M357',
  id,
  20000,
  1.00,
  '2558-05-24',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 357 | ต้นเงิน: 20,000 | ดอกเบี้ย: 19,600 | รวม: 39,600'
FROM members WHERE member_code = 'M357'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 6. น.ส. วรรณลักษณ์ สิทธิมงคล (M370)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M370',
  'น.ส.',
  'วรรณลักษณ์', 
  'สิทธิมงคล', 
  NULL,
  '204',
  '1',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 204 หมู่ 1 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M370',
  id,
  20000,
  1.00,
  '2558-05-28',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 370 | ต้นเงิน: 20,000 | ดอกเบี้ย: 19,600 | รวม: 39,600'
FROM members WHERE member_code = 'M370'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 7. นาย พจน์ กันทะสอน (M411)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M411',
  'นาย',
  'พจน์', 
  'กันทะสอน', 
  NULL,
  '12',
  '1',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 12 หมู่ 1 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M411',
  id,
  40000,
  1.00,
  '2558-05-30',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 411 | ต้นเงิน: 40,000 | ดอกเบี้ย: 39,200 | รวม: 79,200'
FROM members WHERE member_code = 'M411'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 8. นาง จันทร์เพ็ญ สุไว (M412)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M412',
  'นาง',
  'จันทร์เพ็ญ', 
  'สุไว', 
  NULL,
  '21',
  '1',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 21 หมู่ 1 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M412',
  id,
  47014,
  1.00,
  '2558-05-31',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 412 | ต้นเงิน: 47,014 | ดอกเบี้ย: 46,073.72 | รวม: 93,087.72'
FROM members WHERE member_code = 'M412'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 9. นาย วีระยุทธ หอมนาน (M422)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M422',
  'นาย',
  'วีระยุทธ', 
  'หอมนาน', 
  NULL,
  '85',
  '1',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 85 หมู่ 1 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M422',
  id,
  50000,
  1.00,
  '2558-05-10',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 422 | ต้นเงิน: 50,000 | ดอกเบี้ย: 49,500 | รวม: 99,500'
FROM members WHERE member_code = 'M422'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 10. นาง สี หอมนาน (M423) - อายุ 55 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M423',
  'นาง',
  'สี', 
  'หอมนาน', 
  55,
  '85',
  '1',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 85 หมู่ 1 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M423',
  id,
  48394,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 423 | ต้นเงิน: 48,394 | ดอกเบี้ย: 37,263.38 | รวม: 85,657.38'
FROM members WHERE member_code = 'M423'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 11. นาย สถิต กาติ๊บ (M472) - อายุ 48 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M472',
  'นาย',
  'สถิต', 
  'กาติ๊บ', 
  48,
  '209',
  '1',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 209 หมู่ 1 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M472',
  id,
  20000,
  1.00,
  '2558-05-15',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 472 | ต้นเงิน: 20,000 | ดอกเบี้ย: 19,800 | รวม: 39,800'
FROM members WHERE member_code = 'M472'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 12. น.ส. กรรณิการ์ กันทะสอน (M628)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M628',
  'น.ส.',
  'กรรณิการ์', 
  'กันทะสอน', 
  NULL,
  '188',
  '1',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 188 หมู่ 1 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M628',
  id,
  45000,
  1.00,
  '2558-05-20',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 628 | ต้นเงิน: 45,000 | ดอกเบี้ย: 44,550 | รวม: 89,550'
FROM members WHERE member_code = 'M628'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 13. นาย ทวี เผ่าทะไชย (M645) - อายุ 50 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M645',
  'นาย',
  'ทวี', 
  'เผ่าทะไชย', 
  50,
  '214',
  '1',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 214 หมู่ 1 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M645',
  id,
  20000,
  1.00,
  '2558-05-21',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 645 | ต้นเงิน: 20,000 | ดอกเบี้ย: 19,800 | รวม: 39,800'
FROM members WHERE member_code = 'M645'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 14. นาย ชาติสยาม กันทะสอน (M647)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M647',
  'นาย',
  'ชาติสยาม', 
  'กันทะสอน', 
  NULL,
  '12',
  '1',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 12 หมู่ 1 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M647',
  id,
  25000,
  1.00,
  '2558-05-22',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 647 | ต้นเงิน: 25,000 | ดอกเบี้ย: 24,750 | รวม: 49,750'
FROM members WHERE member_code = 'M647'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 15. นาย เล็ก จักคำเต็ม (M697)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M697',
  'นาย',
  'เล็ก', 
  'จักคำเต็ม', 
  NULL,
  '172',
  '1',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 172 หมู่ 1 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M697',
  id,
  19977,
  1.00,
  '2558-05-26',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 697 | ต้นเงิน: 19,977 | ดอกเบี้ย: 19,577.46 | รวม: 39,554.46'
FROM members WHERE member_code = 'M697'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 16. นาย จารุเดช สมบุญนาค (M698)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M698',
  'นาย',
  'จารุเดช', 
  'สมบุญนาค', 
  NULL,
  '217',
  '1',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 217 หมู่ 1 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M698',
  id,
  25000,
  1.00,
  '2558-05-27',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 698 | ต้นเงิน: 25,000 | ดอกเบี้ย: 24,500 | รวม: 49,500'
FROM members WHERE member_code = 'M698'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 17. นาย เอกราช มัจฉาน้อย (M469)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M469',
  'นาย',
  'เอกราช', 
  'มัจฉาน้อย', 
  NULL,
  '27',
  '1',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 27 หมู่ 1 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M469',
  id,
  30000,
  1.00,
  '2558-05-29',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 469 | ต้นเงิน: 30,000 | ดอกเบี้ย: 29,400 | รวม: 59,400'
FROM members WHERE member_code = 'M469'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 18. นาย อินเขียน สุไว (M507)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M507',
  'นาย',
  'อินเขียน', 
  'สุไว', 
  NULL,
  '54',
  '1',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 54 หมู่ 1 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M507',
  id,
  30000,
  1.00,
  '2558-05-30',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 507 | ต้นเงิน: 30,000 | ดอกเบี้ย: 29,400 | รวม: 59,400'
FROM members WHERE member_code = 'M507'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 19. นาย ธีระพันธ์ เถาวัลยา (M646)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M646',
  'นาย',
  'ธีระพันธ์', 
  'เถาวัลยา', 
  NULL,
  '26',
  '1',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 26 หมู่ 1 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M646',
  id,
  20000,
  1.00,
  '2558-05-31',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 646 | ต้นเงิน: 20,000 | ดอกเบี้ย: 19,600 | รวม: 39,600'
FROM members WHERE member_code = 'M646'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 20. น.ส. จรัส คำมาตย์ (M649)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M649',
  'น.ส.',
  'จรัส', 
  'คำมาตย์', 
  NULL,
  '182',
  '1',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 182 หมู่ 1 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M649',
  id,
  20000,
  1.00,
  '2558-05-31',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 649 | ต้นเงิน: 20,000 | ดอกเบี้ย: 19,600 | รวม: 39,600'
FROM members WHERE member_code = 'M649'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 21. นาง ลำยอง ปราณีทอง (M350) - อายุ 65 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M350',
  'นาง',
  'ลำยอง', 
  'ปราณีทอง', 
  65,
  '3',
  '2',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 3 หมู่ 2 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M350',
  id,
  38000,
  1.00,
  '2561-09-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 350 | ต้นเงิน: 38,000 | ดอกเบี้ย: 22,420 | รวม: 60,420'
FROM members WHERE member_code = 'M350'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 22. นาง ฟอง เรือนแก้ว (M351)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M351',
  'นาง',
  'ฟอง', 
  'เรือนแก้ว', 
  NULL,
  '93',
  '2',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 93 หมู่ 2 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M351',
  id,
  41000,
  1.00,
  '2556-09-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 351 | ต้นเงิน: 41,000 | ดอกเบี้ย: 48,790 | รวม: 89,790'
FROM members WHERE member_code = 'M351'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 23. นาง สุภานัน ทุ่งเย็น (M364) - อายุ 54 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M364',
  'นาง',
  'สุภานัน', 
  'ทุ่งเย็น', 
  54,
  '24',
  '2',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 24 หมู่ 2 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M364',
  id,
  31700,
  1.00,
  '2561-05-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 364 | ต้นเงิน: 31,700 | ดอกเบี้ย: 19,971 | รวม: 51,671'
FROM members WHERE member_code = 'M364'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 24. นาง พัชรินทร์ แก้วเรียง (M380)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M380',
  'นาง',
  'พัชรินทร์', 
  'แก้วเรียง', 
  NULL,
  '56',
  '2',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 56 หมู่ 2 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M380',
  id,
  30000,
  1.00,
  '2555-08-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 380 | ต้นเงิน: 30,000 | ดอกเบี้ย: 39,600 | รวม: 69,600'
FROM members WHERE member_code = 'M380'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 25. นาง ศิริพร ทัพธานี (M399) - อายุ 45 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M399',
  'นาง',
  'ศิริพร', 
  'ทัพธานี', 
  45,
  '79',
  '2',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 79 หมู่ 2 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M399',
  id,
  30000,
  1.00,
  '2560-08-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 399 | ต้นเงิน: 30,000 | ดอกเบี้ย: 21,600 | รวม: 51,600'
FROM members WHERE member_code = 'M399'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 26. นาง คำ โถ (M400) - อายุ 50 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M400',
  'นาง',
  'คำ', 
  'โถ', 
  50,
  '69',
  '2',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 69 หมู่ 2 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M400',
  id,
  4304,
  1.00,
  '2556-12-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 400 | ต้นเงิน: 4,304 | ดอกเบี้ย: 4,992.64 | รวม: 9,296.64'
FROM members WHERE member_code = 'M400'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 27. นาง หมั้ว เมืองมิ่ง (M401) - อายุ 55 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M401',
  'นาง',
  'หมั้ว', 
  'เมืองมิ่ง', 
  55,
  '92',
  '2',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 92 หมู่ 2 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M401',
  id,
  25000,
  1.00,
  '2555-08-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 401 | ต้นเงิน: 25,000 | ดอกเบี้ย: 33,000 | รวม: 58,000'
FROM members WHERE member_code = 'M401'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 28. นาย อนุมาศ เจริญบุญ (M627)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M627',
  'นาย',
  'อนุมาศ', 
  'เจริญบุญ', 
  NULL,
  '29',
  '2',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 29 หมู่ 2 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M627',
  id,
  45000,
  1.00,
  '2558-05-12',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 627 | ต้นเงิน: 45,000 | ดอกเบี้ย: 44,550 | รวม: 89,550'
FROM members WHERE member_code = 'M627'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 29. นาง อรวรรณ กวนสีลา (M253) - อายุ 46 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M253',
  'นาง',
  'อรวรรณ', 
  'กวนสีลา', 
  46,
  '31',
  '4',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 31 หมู่ 4 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M253',
  id,
  29260,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 253 | ต้นเงิน: 29,260 | ดอกเบี้ย: 22,530.2 | รวม: 51,790.2'
FROM members WHERE member_code = 'M253'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 30. นาง ปั๊ด ก้อนสีลา (M438) - อายุ 50 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M438',
  'นาง',
  'ปั๊ด', 
  'ก้อนสีลา', 
  50,
  '59',
  '4',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 59 หมู่ 4 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M438',
  id,
  34679,
  1.00,
  '2561-05-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 438 | ต้นเงิน: 34,679 | ดอกเบี้ย: 21,847.77 | รวม: 56,526.77'
FROM members WHERE member_code = 'M438'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 31. นาย วิทยา พรมเกษา (M548) - อายุ 37 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M548',
  'นาย',
  'วิทยา', 
  'พรมเกษา', 
  37,
  '62',
  '4',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 62 หมู่ 4 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M548',
  id,
  30000,
  1.00,
  '2558-05-14',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 548 | ต้นเงิน: 30,000 | ดอกเบี้ย: 29,700 | รวม: 59,700'
FROM members WHERE member_code = 'M548'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 32. นาง ขันคำ ก้อนสีลา (M556)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M556',
  'นาง',
  'ขันคำ', 
  'ก้อนสีลา', 
  NULL,
  '88',
  '4',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 88 หมู่ 4 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M556',
  id,
  21864,
  1.00,
  '2559-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 556 | ต้นเงิน: 21,864 | ดอกเบี้ย: 19,458.96 | รวม: 41,322.96'
FROM members WHERE member_code = 'M556'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 33. นาง วร ก้อนสีลา (M577) - อายุ 63 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M577',
  'นาง',
  'วร', 
  'ก้อนสีลา', 
  63,
  '97',
  '4',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 97 หมู่ 4 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M577',
  id,
  1980,
  1.00,
  '2561-06-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 577 | ต้นเงิน: 1,980 | ดอกเบี้ย: 1,227.6 | รวม: 3,207.6'
FROM members WHERE member_code = 'M577'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 34. นาย พุฒิพงษ์ ก้อนสีลา (M580) - อายุ 28 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M580',
  'นาย',
  'พุฒิพงษ์', 
  'ก้อนสีลา', 
  28,
  '75',
  '4',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 75 หมู่ 4 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M580',
  id,
  34391,
  1.00,
  '2561-05-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 580 | ต้นเงิน: 34,391 | ดอกเบี้ย: 21,666.33 | รวม: 56,057.33'
FROM members WHERE member_code = 'M580'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 35. นาง จำปี ก้อนสีลา (M439)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M439',
  'นาง',
  'จำปี', 
  'ก้อนสีลา', 
  NULL,
  '',
  '4',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่  หมู่ 4 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M439',
  id,
  30000,
  1.00,
  '2558-05-28',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 439 | ต้นเงิน: 30,000 | ดอกเบี้ย: 29,400 | รวม: 59,400'
FROM members WHERE member_code = 'M439'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 36. นาง ธิติกานต์ ใจมูล (M303)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M303',
  'นาง',
  'ธิติกานต์', 
  'ใจมูล', 
  NULL,
  '159',
  '6',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 159 หมู่ 6 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M303',
  id,
  40000,
  1.00,
  '2556-09-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 303 | ต้นเงิน: 40,000 | ดอกเบี้ย: 47,600 | รวม: 87,600'
FROM members WHERE member_code = 'M303'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 37. นาง รัชนก ใจมูล (M304)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M304',
  'นาง',
  'รัชนก', 
  'ใจมูล', 
  NULL,
  '7',
  '6',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 7 หมู่ 6 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M304',
  id,
  45000,
  1.00,
  '2556-09-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 304 | ต้นเงิน: 45,000 | ดอกเบี้ย: 53,550 | รวม: 98,550'
FROM members WHERE member_code = 'M304'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 38. นาย ลิตร ชาวเวียง (M305)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M305',
  'นาย',
  'ลิตร', 
  'ชาวเวียง', 
  NULL,
  '17',
  '6',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 17 หมู่ 6 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M305',
  id,
  35000,
  1.00,
  '2556-09-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 305 | ต้นเงิน: 35,000 | ดอกเบี้ย: 41,650 | รวม: 76,650'
FROM members WHERE member_code = 'M305'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 39. นาง แสงคำ นิทะโน (M307) - อายุ 55 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M307',
  'นาง',
  'แสงคำ', 
  'นิทะโน', 
  55,
  '6',
  '6',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 6 หมู่ 6 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M307',
  id,
  40000,
  1.00,
  '2558-05-10',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 307 | ต้นเงิน: 40,000 | ดอกเบี้ย: 39,600 | รวม: 79,600'
FROM members WHERE member_code = 'M307'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 40. น.ส. รุ่งนภา วิชัยมูล (M308) - อายุ 44 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M308',
  'น.ส.',
  'รุ่งนภา', 
  'วิชัยมูล', 
  44,
  '123',
  '6',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 123 หมู่ 6 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M308',
  id,
  40000,
  1.00,
  '2556-09-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 308 | ต้นเงิน: 40,000 | ดอกเบี้ย: 47,600 | รวม: 87,600'
FROM members WHERE member_code = 'M308'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 41. น.ส. อัญชลี หายโศรก (M309) - อายุ 35 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M309',
  'น.ส.',
  'อัญชลี', 
  'หายโศรก', 
  35,
  '83',
  '6',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 83 หมู่ 6 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M309',
  id,
  35000,
  1.00,
  '2556-09-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 309 | ต้นเงิน: 35,000 | ดอกเบี้ย: 41,650 | รวม: 76,650'
FROM members WHERE member_code = 'M309'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 42. นาย อานุภาพ สมซื่อ (M392) - อายุ 45 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M392',
  'นาย',
  'อานุภาพ', 
  'สมซื่อ', 
  45,
  '79',
  '6',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 79 หมู่ 6 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M392',
  id,
  23245,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 392 | ต้นเงิน: 23,245 | ดอกเบี้ย: 17,898.65 | รวม: 41,143.65'
FROM members WHERE member_code = 'M392'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 43. นาย อภิเชษฐ์ แก้วเกิด (M395)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M395',
  'นาย',
  'อภิเชษฐ์', 
  'แก้วเกิด', 
  NULL,
  '69',
  '6',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 69 หมู่ 6 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M395',
  id,
  50000,
  1.00,
  '2558-05-14',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 395 | ต้นเงิน: 50,000 | ดอกเบี้ย: 49,500 | รวม: 99,500'
FROM members WHERE member_code = 'M395'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 44. นาง คำมี ธรรมชัย (คำสี) (M451) - อายุ 49 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M451',
  'นาง',
  'คำมี', 
  'ธรรมชัย (คำสี)', 
  49,
  '101',
  '6',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 101 หมู่ 6 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M451',
  id,
  10562,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 451 | ต้นเงิน: 10,562 | ดอกเบี้ย: 8,132.74 | รวม: 18,694.74'
FROM members WHERE member_code = 'M451'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 45. นาย จำรอง หายโศก (M459)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M459',
  'นาย',
  'จำรอง', 
  'หายโศก', 
  NULL,
  '103',
  '6',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 103 หมู่ 6 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M459',
  id,
  25000,
  1.00,
  '2558-05-16',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 459 | ต้นเงิน: 25,000 | ดอกเบี้ย: 24,750 | รวม: 49,750'
FROM members WHERE member_code = 'M459'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 46. นาง จันทร์ดี นิทโน (M463) - อายุ 64 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M463',
  'นาง',
  'จันทร์ดี', 
  'นิทโน', 
  64,
  '113',
  '6',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 113 หมู่ 6 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M463',
  id,
  19703,
  1.00,
  '2558-05-17',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 463 | ต้นเงิน: 19,703 | ดอกเบี้ย: 19,505.97 | รวม: 39,208.97'
FROM members WHERE member_code = 'M463'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 47. นาง สุปราณี บุญสิน (M578) - อายุ 48 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M578',
  'นาง',
  'สุปราณี', 
  'บุญสิน', 
  48,
  '275',
  '6',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 275 หมู่ 6 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M578',
  id,
  21724,
  1.00,
  '2557-04-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 578 | ต้นเงิน: 21,724 | ดอกเบี้ย: 24,330.88 | รวม: 46,054.88'
FROM members WHERE member_code = 'M578'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 48. นาง สุนี ชาวเวียง (M579)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M579',
  'นาง',
  'สุนี', 
  'ชาวเวียง', 
  NULL,
  '62',
  '6',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 62 หมู่ 6 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M579',
  id,
  4881,
  1.00,
  '2557-11-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 579 | ต้นเงิน: 4,881 | ดอกเบี้ย: 5,125.05 | รวม: 10,006.05'
FROM members WHERE member_code = 'M579'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 49. นาย ธนาทิพย์ ลภัสจิรัชยาพร (M581)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M581',
  'นาย',
  'ธนาทิพย์', 
  'ลภัสจิรัชยาพร', 
  NULL,
  '62',
  '6',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 62 หมู่ 6 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M581',
  id,
  21740,
  1.00,
  '2557-05-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 581 | ต้นเงิน: 21,740 | ดอกเบี้ย: 24,131.4 | รวม: 45,871.4'
FROM members WHERE member_code = 'M581'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 50. นาง คำ ธรรมชัย (M582) - อายุ 55 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M582',
  'นาง',
  'คำ', 
  'ธรรมชัย', 
  55,
  '76',
  '6',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 76 หมู่ 6 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M582',
  id,
  25000,
  1.00,
  '2557-05-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 582 | ต้นเงิน: 25,000 | ดอกเบี้ย: 27,750 | รวม: 52,750'
FROM members WHERE member_code = 'M582'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 51. นาย เสถียน หายโศรก (M588) - อายุ 43 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M588',
  'นาย',
  'เสถียน', 
  'หายโศรก', 
  43,
  '20',
  '6',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 20 หมู่ 6 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M588',
  id,
  35000,
  1.00,
  '2556-09-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 588 | ต้นเงิน: 35,000 | ดอกเบี้ย: 41,650 | รวม: 76,650'
FROM members WHERE member_code = 'M588'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 52. นาง คำปัน หายโศรก (M612) - อายุ 62 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M612',
  'นาง',
  'คำปัน', 
  'หายโศรก', 
  62,
  '83',
  '6',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 83 หมู่ 6 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M612',
  id,
  30000,
  1.00,
  '2558-05-23',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 612 | ต้นเงิน: 30,000 | ดอกเบี้ย: 29,700 | รวม: 59,700'
FROM members WHERE member_code = 'M612'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 53. นาง สุพรรณ วิชัยมูล (M613)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M613',
  'นาง',
  'สุพรรณ', 
  'วิชัยมูล', 
  NULL,
  '123',
  '6',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 123 หมู่ 6 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M613',
  id,
  30000,
  1.00,
  '2558-05-24',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 613 | ต้นเงิน: 30,000 | ดอกเบี้ย: 29,700 | รวม: 59,700'
FROM members WHERE member_code = 'M613'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 54. น.ส. ละอองรัตน์ ชาวเวียง (M623)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M623',
  'น.ส.',
  'ละอองรัตน์', 
  'ชาวเวียง', 
  NULL,
  '165',
  '6',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 165 หมู่ 6 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M623',
  id,
  9137,
  1.00,
  '2558-05-25',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 623 | ต้นเงิน: 9,137 | ดอกเบี้ย: 9,045.63 | รวม: 18,182.63'
FROM members WHERE member_code = 'M623'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 55. นาง ต๋า เขียวสด (M659) - อายุ 65 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M659',
  'นาง',
  'ต๋า', 
  'เขียวสด', 
  65,
  '',
  '6',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่  หมู่ 6 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M659',
  id,
  15000,
  1.00,
  '2556-09-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 659 | ต้นเงิน: 15,000 | ดอกเบี้ย: 17,850 | รวม: 32,850'
FROM members WHERE member_code = 'M659'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 56. นาย อัครชา อ้อนเรือน (M668)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M668',
  'นาย',
  'อัครชา', 
  'อ้อนเรือน', 
  NULL,
  '',
  '6',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่  หมู่ 6 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M668',
  id,
  15000,
  1.00,
  '2556-09-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 668 | ต้นเงิน: 15,000 | ดอกเบี้ย: 17,850 | รวม: 32,850'
FROM members WHERE member_code = 'M668'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 57. นาง เจริญ ใจมูล (M669)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M669',
  'นาง',
  'เจริญ', 
  'ใจมูล', 
  NULL,
  '',
  '6',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่  หมู่ 6 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M669',
  id,
  15000,
  1.00,
  '2556-09-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 669 | ต้นเงิน: 15,000 | ดอกเบี้ย: 17,850 | รวม: 32,850'
FROM members WHERE member_code = 'M669'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 58. นาง เตี่ยม วิชัยมูล (M670) - อายุ 73 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M670',
  'นาง',
  'เตี่ยม', 
  'วิชัยมูล', 
  73,
  '',
  '6',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่  หมู่ 6 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M670',
  id,
  15000,
  1.00,
  '2556-09-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 670 | ต้นเงิน: 15,000 | ดอกเบี้ย: 17,850 | รวม: 32,850'
FROM members WHERE member_code = 'M670'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 59. นาย มูล ศรีสด (M674) - อายุ 72 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M674',
  'นาย',
  'มูล', 
  'ศรีสด', 
  72,
  '',
  '6',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่  หมู่ 6 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M674',
  id,
  15000,
  1.00,
  '2556-09-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 674 | ต้นเงิน: 15,000 | ดอกเบี้ย: 17,850 | รวม: 32,850'
FROM members WHERE member_code = 'M674'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 60. นาย ทวนใจ หว่อง (M673) - อายุ 52 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M673',
  'นาย',
  'ทวนใจ', 
  'หว่อง', 
  52,
  '178',
  '6',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 178 หมู่ 6 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M673',
  id,
  15000,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 673 | ต้นเงิน: 15,000 | ดอกเบี้ย: 11,550 | รวม: 26,550'
FROM members WHERE member_code = 'M673'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 61. นาย นราธิป บุญสิน (M581) - อายุ 52 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M581',
  'นาย',
  'นราธิป', 
  'บุญสิน', 
  52,
  '74',
  '6',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 74 หมู่ 6 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M581',
  id,
  21740,
  1.00,
  '2557-04-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 581 | ต้นเงิน: 21,740 | ดอกเบี้ย: 24,348.8 | รวม: 46,088.8'
FROM members WHERE member_code = 'M581'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 62. นาย สนธยา หว่อง (M672)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M672',
  'นาย',
  'สนธยา', 
  'หว่อง', 
  NULL,
  '',
  '6',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่  หมู่ 6 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M672',
  id,
  20000,
  1.00,
  '2558-05-28',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 672 | ต้นเงิน: 20,000 | ดอกเบี้ย: 19,600 | รวม: 39,600'
FROM members WHERE member_code = 'M672'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 63. นาง บุญเหนียม วงศ์ป้อ (M394)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M394',
  'นาง',
  'บุญเหนียม', 
  'วงศ์ป้อ', 
  NULL,
  '',
  '6',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่  หมู่ 6 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M394',
  id,
  30000,
  1.00,
  '2558-05-28',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 394 | ต้นเงิน: 30,000 | ดอกเบี้ย: 29,400 | รวม: 59,400'
FROM members WHERE member_code = 'M394'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 64. นาง จันทร์สม สีสด (M456)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M456',
  'นาง',
  'จันทร์สม', 
  'สีสด', 
  NULL,
  '',
  '6',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่  หมู่ 6 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M456',
  id,
  50000,
  1.00,
  '2558-05-28',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 456 | ต้นเงิน: 50,000 | ดอกเบี้ย: 49,000 | รวม: 99,000'
FROM members WHERE member_code = 'M456'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 65. นาง บัวบาล ใจมูล (M458)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M458',
  'นาง',
  'บัวบาล', 
  'ใจมูล', 
  NULL,
  '',
  '6',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่  หมู่ 6 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M458',
  id,
  20000,
  1.00,
  '2558-05-28',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 458 | ต้นเงิน: 20,000 | ดอกเบี้ย: 19,600 | รวม: 39,600'
FROM members WHERE member_code = 'M458'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 66. นาง นงเยาว์ ไชยสาร (M616)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M616',
  'นาง',
  'นงเยาว์', 
  'ไชยสาร', 
  NULL,
  '',
  '6',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่  หมู่ 6 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M616',
  id,
  15000,
  1.00,
  '2558-05-28',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 616 | ต้นเงิน: 15,000 | ดอกเบี้ย: 14,700 | รวม: 29,700'
FROM members WHERE member_code = 'M616'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 67. นาง ละมัย บุญใหญ่ (M665)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M665',
  'นาง',
  'ละมัย', 
  'บุญใหญ่', 
  NULL,
  '',
  '6',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่  หมู่ 6 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M665',
  id,
  20000,
  1.00,
  '2558-05-28',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 665 | ต้นเงิน: 20,000 | ดอกเบี้ย: 19,600 | รวม: 39,600'
FROM members WHERE member_code = 'M665'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 68. นาย คทาวุธ หายโศรก (M279) - อายุ 38 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M279',
  'นาย',
  'คทาวุธ', 
  'หายโศรก', 
  38,
  '63',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 63 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M279',
  id,
  20000,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 279 | ต้นเงิน: 20,000 | ดอกเบี้ย: 15,400 | รวม: 35,400'
FROM members WHERE member_code = 'M279'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 69. นาง พัชรา ชาวเวียง (M280) - อายุ 52 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M280',
  'นาง',
  'พัชรา', 
  'ชาวเวียง', 
  52,
  '88',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 88 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M280',
  id,
  20000,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 280 | ต้นเงิน: 20,000 | ดอกเบี้ย: 15,400 | รวม: 35,400'
FROM members WHERE member_code = 'M280'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 70. นาง ปั๋น มะโนดี (M281) - อายุ 70 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M281',
  'นาง',
  'ปั๋น', 
  'มะโนดี', 
  70,
  '45',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 45 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M281',
  id,
  25382,
  1.00,
  '2561-10-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 281 | ต้นเงิน: 25,382 | ดอกเบี้ย: 14,721.56 | รวม: 40,103.56'
FROM members WHERE member_code = 'M281'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 71. นาง จำปาอ่อน นิทะโน (M283) - อายุ 45 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M283',
  'นาง',
  'จำปาอ่อน', 
  'นิทะโน', 
  45,
  '98',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 98 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M283',
  id,
  40675,
  1.00,
  '2558-05-09',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 283 | ต้นเงิน: 40,675 | ดอกเบี้ย: 40,268.25 | รวม: 80,943.25'
FROM members WHERE member_code = 'M283'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 72. นาง แทน นิทะโน (M285)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M285',
  'นาง',
  'แทน', 
  'นิทะโน', 
  NULL,
  '24',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 24 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M285',
  id,
  34000,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 285 | ต้นเงิน: 34,000 | ดอกเบี้ย: 26,180 | รวม: 60,180'
FROM members WHERE member_code = 'M285'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 73. นาย มอย ไชยวารินทร์ (M286)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M286',
  'นาย',
  'มอย', 
  'ไชยวารินทร์', 
  NULL,
  '18',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 18 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M286',
  id,
  35675,
  1.00,
  '2556-09-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 286 | ต้นเงิน: 35,675 | ดอกเบี้ย: 42,453.25 | รวม: 78,128.25'
FROM members WHERE member_code = 'M286'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 74. นาง คำปัน ขุนมิน (M287) - อายุ 56 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M287',
  'นาง',
  'คำปัน', 
  'ขุนมิน', 
  56,
  '42',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 42 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M287',
  id,
  40000,
  1.00,
  '2560-04-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 287 | ต้นเงิน: 40,000 | ดอกเบี้ย: 30,400 | รวม: 70,400'
FROM members WHERE member_code = 'M287'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 75. นาง บุญเจือ มะโนดี (M288)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M288',
  'นาง',
  'บุญเจือ', 
  'มะโนดี', 
  NULL,
  '80',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 80 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M288',
  id,
  46815,
  1.00,
  '2556-12-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 288 | ต้นเงิน: 46,815 | ดอกเบี้ย: 54,305.4 | รวม: 101,120.4'
FROM members WHERE member_code = 'M288'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 76. นาง สุนิสา แต้มงาม (M289)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M289',
  'นาง',
  'สุนิสา', 
  'แต้มงาม', 
  NULL,
  '97',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 97 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M289',
  id,
  38000,
  1.00,
  '2556-09-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 289 | ต้นเงิน: 38,000 | ดอกเบี้ย: 45,220 | รวม: 83,220'
FROM members WHERE member_code = 'M289'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 77. นาง สุพรรณ์ มะโนดี (M290) - อายุ 60 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M290',
  'นาง',
  'สุพรรณ์', 
  'มะโนดี', 
  60,
  '58',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 58 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M290',
  id,
  10000,
  1.00,
  '2562-04-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 290 | ต้นเงิน: 10,000 | ดอกเบี้ย: 5,200 | รวม: 15,200'
FROM members WHERE member_code = 'M290'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 78. นาง อำพร พากเพียร (M293)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M293',
  'นาง',
  'อำพร', 
  'พากเพียร', 
  NULL,
  '104',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 104 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M293',
  id,
  4602,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 293 | ต้นเงิน: 4,602 | ดอกเบี้ย: 3,543.54 | รวม: 8,145.54'
FROM members WHERE member_code = 'M293'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 79. นาย ชำนาญ แต้มงาม (M295)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M295',
  'นาย',
  'ชำนาญ', 
  'แต้มงาม', 
  NULL,
  '32',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 32 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M295',
  id,
  23947,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 295 | ต้นเงิน: 23,947 | ดอกเบี้ย: 18,439.19 | รวม: 42,386.19'
FROM members WHERE member_code = 'M295'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 80. นาย เสน่ห์ นิทะโน (M311)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M311',
  'นาย',
  'เสน่ห์', 
  'นิทะโน', 
  NULL,
  '78',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 78 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M311',
  id,
  20000,
  1.00,
  '2558-05-18',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 311 | ต้นเงิน: 20,000 | ดอกเบี้ย: 19,800 | รวม: 39,800'
FROM members WHERE member_code = 'M311'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 81. นาง ปราณี นิทโน (M312)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M312',
  'นาง',
  'ปราณี', 
  'นิทโน', 
  NULL,
  '35',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 35 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M312',
  id,
  44000,
  1.00,
  '2557-01-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 312 | ต้นเงิน: 44,000 | ดอกเบี้ย: 50,600 | รวม: 94,600'
FROM members WHERE member_code = 'M312'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 82. นาง กรรณิการ์ แก้วลองบน (M313)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M313',
  'นาง',
  'กรรณิการ์', 
  'แก้วลองบน', 
  NULL,
  '95',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 95 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M313',
  id,
  35000,
  1.00,
  '2556-09-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 313 | ต้นเงิน: 35,000 | ดอกเบี้ย: 41,650 | รวม: 76,650'
FROM members WHERE member_code = 'M313'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 83. นาง จันสวย นิทะโน (M314)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M314',
  'นาง',
  'จันสวย', 
  'นิทะโน', 
  NULL,
  '77',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 77 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M314',
  id,
  40000,
  1.00,
  '2561-04-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 314 | ต้นเงิน: 40,000 | ดอกเบี้ย: 25,600 | รวม: 65,600'
FROM members WHERE member_code = 'M314'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 84. นาง อำพา นิทะโน (M316) - อายุ 62 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M316',
  'นาง',
  'อำพา', 
  'นิทะโน', 
  62,
  '55',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 55 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M316',
  id,
  2626,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 316 | ต้นเงิน: 2,626 | ดอกเบี้ย: 2,022.02 | รวม: 4,648.02'
FROM members WHERE member_code = 'M316'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 85. นาย จิรพันธ์ มะโนดี (M317) - อายุ 45 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M317',
  'นาย',
  'จิรพันธ์', 
  'มะโนดี', 
  45,
  '71',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 71 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M317',
  id,
  56763,
  1.00,
  '2557-12-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 317 | ต้นเงิน: 56,763 | ดอกเบี้ย: 59,033.52 | รวม: 115,796.52'
FROM members WHERE member_code = 'M317'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 86. นาง จำปี มะโนดี (M318)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M318',
  'นาง',
  'จำปี', 
  'มะโนดี', 
  NULL,
  '89',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 89 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M318',
  id,
  20000,
  1.00,
  '2558-05-24',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 318 | ต้นเงิน: 20,000 | ดอกเบี้ย: 19,800 | รวม: 39,800'
FROM members WHERE member_code = 'M318'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 87. นาง ชญาดา นิทะโน (M385)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M385',
  'นาง',
  'ชญาดา', 
  'นิทะโน', 
  NULL,
  '78',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 78 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M385',
  id,
  25000,
  1.00,
  '2558-05-25',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 385 | ต้นเงิน: 25,000 | ดอกเบี้ย: 24,750 | รวม: 49,750'
FROM members WHERE member_code = 'M385'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 88. นาง สุดาลักษณ์ หมื่นขัติย์ (M387)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M387',
  'นาง',
  'สุดาลักษณ์', 
  'หมื่นขัติย์', 
  NULL,
  '46',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 46 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M387',
  id,
  22911,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 387 | ต้นเงิน: 22,911 | ดอกเบี้ย: 17,641.47 | รวม: 40,552.47'
FROM members WHERE member_code = 'M387'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 89. นาย บุญเตี่ยม นาภู (M402)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M402',
  'นาย',
  'บุญเตี่ยม', 
  'นาภู', 
  NULL,
  '77',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 77 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M402',
  id,
  40000,
  1.00,
  '2558-05-27',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 402 | ต้นเงิน: 40,000 | ดอกเบี้ย: 39,200 | รวม: 79,200'
FROM members WHERE member_code = 'M402'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 90. นาง ก่ำ พากเพียร (M426)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M426',
  'นาง',
  'ก่ำ', 
  'พากเพียร', 
  NULL,
  '34',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 34 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M426',
  id,
  25157,
  1.00,
  '2561-05-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 426 | ต้นเงิน: 25,157 | ดอกเบี้ย: 15,848.91 | รวม: 41,005.91'
FROM members WHERE member_code = 'M426'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 91. นาง ประนอม ไชยวารินทร์ (M428)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M428',
  'นาง',
  'ประนอม', 
  'ไชยวารินทร์', 
  NULL,
  '105',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 105 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M428',
  id,
  28000,
  1.00,
  '2555-10-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 428 | ต้นเงิน: 28,000 | ดอกเบี้ย: 36,400 | รวม: 64,400'
FROM members WHERE member_code = 'M428'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 92. นาง เครือวัลย์ นิทะโน (M429)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M429',
  'นาง',
  'เครือวัลย์', 
  'นิทะโน', 
  NULL,
  '59',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 59 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M429',
  id,
  40000,
  1.00,
  '2555-10-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 429 | ต้นเงิน: 40,000 | ดอกเบี้ย: 52,000 | รวม: 92,000'
FROM members WHERE member_code = 'M429'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 93. น.ส. นลณีย์ หายโศก (M430)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M430',
  'น.ส.',
  'นลณีย์', 
  'หายโศก', 
  NULL,
  '59',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 59 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M430',
  id,
  28000,
  1.00,
  '2555-10-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 430 | ต้นเงิน: 28,000 | ดอกเบี้ย: 36,400 | รวม: 64,400'
FROM members WHERE member_code = 'M430'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 94. น.ส. อรทัย คงมาตย์ (M431)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M431',
  'น.ส.',
  'อรทัย', 
  'คงมาตย์', 
  NULL,
  '71',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 71 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M431',
  id,
  47518,
  1.00,
  '2557-12-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 431 | ต้นเงิน: 47,518 | ดอกเบี้ย: 49,418.72 | รวม: 96,936.72'
FROM members WHERE member_code = 'M431'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 95. นาง ลักษณารีย์ นิทะโน (M432)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M432',
  'นาง',
  'ลักษณารีย์', 
  'นิทะโน', 
  NULL,
  '102',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 102 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M432',
  id,
  15959,
  1.00,
  '2559-04-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 432 | ต้นเงิน: 15,959 | ดอกเบี้ย: 14,043.92 | รวม: 30,002.92'
FROM members WHERE member_code = 'M432'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 96. นาย ศรียนต์ มะโนดี (M433)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M433',
  'นาย',
  'ศรียนต์', 
  'มะโนดี', 
  NULL,
  '109',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 109 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M433',
  id,
  40000,
  1.00,
  '2556-05-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 433 | ต้นเงิน: 40,000 | ดอกเบี้ย: 49,200 | รวม: 89,200'
FROM members WHERE member_code = 'M433'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 97. นาง เลี่ยน มะโนดี (M434)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M434',
  'นาง',
  'เลี่ยน', 
  'มะโนดี', 
  NULL,
  '17',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 17 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M434',
  id,
  37311,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 434 | ต้นเงิน: 37,311 | ดอกเบี้ย: 28,729.47 | รวม: 66,040.47'
FROM members WHERE member_code = 'M434'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 98. นาง แสงเทียน อ่อนนวล (M435)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M435',
  'นาง',
  'แสงเทียน', 
  'อ่อนนวล', 
  NULL,
  '9',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 9 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M435',
  id,
  26319,
  1.00,
  '2558-06-05',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 435 | ต้นเงิน: 26,319 | ดอกเบี้ย: 25,792.62 | รวม: 52,111.62'
FROM members WHERE member_code = 'M435'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 99. นาง บัวไหล หมื่นขัติย์ (M437)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M437',
  'นาง',
  'บัวไหล', 
  'หมื่นขัติย์', 
  NULL,
  '72',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 72 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M437',
  id,
  26000,
  1.00,
  '2560-04-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 437 | ต้นเงิน: 26,000 | ดอกเบี้ย: 19,760 | รวม: 45,760'
FROM members WHERE member_code = 'M437'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 100. นาย พีรวิชญ์ แก้วลองบน (M442)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M442',
  'นาย',
  'พีรวิชญ์', 
  'แก้วลองบน', 
  NULL,
  '95',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 95 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M442',
  id,
  26500,
  1.00,
  '2559-09-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 442 | ต้นเงิน: 26,500 | ดอกเบี้ย: 21,995 | รวม: 48,495'
FROM members WHERE member_code = 'M442'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 101. นาง จำลอง นิทะโน (M443)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M443',
  'นาง',
  'จำลอง', 
  'นิทะโน', 
  NULL,
  '75',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 75 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M443',
  id,
  31500,
  1.00,
  '2556-09-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 443 | ต้นเงิน: 31,500 | ดอกเบี้ย: 37,485 | รวม: 68,985'
FROM members WHERE member_code = 'M443'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 102. นาง สุดารัตน์ นิทะโน (M445)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M445',
  'นาง',
  'สุดารัตน์', 
  'นิทะโน', 
  NULL,
  '19',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 19 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M445',
  id,
  36500,
  1.00,
  '2556-09-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 445 | ต้นเงิน: 36,500 | ดอกเบี้ย: 43,435 | รวม: 79,935'
FROM members WHERE member_code = 'M445'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 103. นาง ทา พากเพียร (M446)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M446',
  'นาง',
  'ทา', 
  'พากเพียร', 
  NULL,
  '60',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 60 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M446',
  id,
  23696,
  1.00,
  '2558-05-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 446 | ต้นเงิน: 23,696 | ดอกเบี้ย: 23,459.04 | รวม: 47,155.04'
FROM members WHERE member_code = 'M446'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 104. นาง ดาว แซ่ย่าง (M466)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M466',
  'นาง',
  'ดาว', 
  'แซ่ย่าง', 
  NULL,
  '109',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 109 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M466',
  id,
  30000,
  1.00,
  '2558-06-11',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 466 | ต้นเงิน: 30,000 | ดอกเบี้ย: 29,400 | รวม: 59,400'
FROM members WHERE member_code = 'M466'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 105. นาย อำนวย ขุนมิน (M499) - อายุ 56 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M499',
  'นาย',
  'อำนวย', 
  'ขุนมิน', 
  56,
  '42',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 42 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M499',
  id,
  22000,
  1.00,
  '2560-04-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 499 | ต้นเงิน: 22,000 | ดอกเบี้ย: 16,720 | รวม: 38,720'
FROM members WHERE member_code = 'M499'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 106. นาย จรัส นิทะโน (M501) - อายุ 50 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M501',
  'นาย',
  'จรัส', 
  'นิทะโน', 
  50,
  '24',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 24 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M501',
  id,
  35000,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 501 | ต้นเงิน: 35,000 | ดอกเบี้ย: 26,950 | รวม: 61,950'
FROM members WHERE member_code = 'M501'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 107. นาง เพชรา แต้มงาม (M503)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M503',
  'นาง',
  'เพชรา', 
  'แต้มงาม', 
  NULL,
  '32',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 32 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M503',
  id,
  23642,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 503 | ต้นเงิน: 23,642 | ดอกเบี้ย: 18,204.34 | รวม: 41,846.34'
FROM members WHERE member_code = 'M503'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 108. นาย จรัส ชาวเวียง (M504) - อายุ 52 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M504',
  'นาย',
  'จรัส', 
  'ชาวเวียง', 
  52,
  '88',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 88 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M504',
  id,
  25000,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 504 | ต้นเงิน: 25,000 | ดอกเบี้ย: 19,250 | รวม: 44,250'
FROM members WHERE member_code = 'M504'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 109. นาง ก๋อง พากเพียร (M505) - อายุ 67 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M505',
  'นาง',
  'ก๋อง', 
  'พากเพียร', 
  67,
  '34',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 34 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M505',
  id,
  26294,
  1.00,
  '2561-05-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 505 | ต้นเงิน: 26,294 | ดอกเบี้ย: 16,565.22 | รวม: 42,859.22'
FROM members WHERE member_code = 'M505'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 110. นาย สุวิทย์ นิทะโน (M587) - อายุ 62 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M587',
  'นาย',
  'สุวิทย์', 
  'นิทะโน', 
  62,
  '59',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 59 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M587',
  id,
  35000,
  1.00,
  '2556-09-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 587 | ต้นเงิน: 35,000 | ดอกเบี้ย: 41,650 | รวม: 76,650'
FROM members WHERE member_code = 'M587'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 111. นาง นวล ไชยวารินทร์ (M589)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M589',
  'นาง',
  'นวล', 
  'ไชยวารินทร์', 
  NULL,
  '18',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 18 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M589',
  id,
  30000,
  1.00,
  '2556-09-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 589 | ต้นเงิน: 30,000 | ดอกเบี้ย: 35,700 | รวม: 65,700'
FROM members WHERE member_code = 'M589'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 112. นาย ฝาก มะโนดี (M591) - อายุ 67 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M591',
  'นาย',
  'ฝาก', 
  'มะโนดี', 
  67,
  '17',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 17 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M591',
  id,
  22000,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 591 | ต้นเงิน: 22,000 | ดอกเบี้ย: 16,940 | รวม: 38,940'
FROM members WHERE member_code = 'M591'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 113. นาย ประทีป หมื่นขัติย์ (M592) - อายุ 58 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M592',
  'นาย',
  'ประทีป', 
  'หมื่นขัติย์', 
  58,
  '46',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 46 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M592',
  id,
  34615,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 592 | ต้นเงิน: 34,615 | ดอกเบี้ย: 26,653.55 | รวม: 61,268.55'
FROM members WHERE member_code = 'M592'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 114. น.ส. ลออรัตน์ ปันแต๋ (M594)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M594',
  'น.ส.',
  'ลออรัตน์', 
  'ปันแต๋', 
  NULL,
  '107',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 107 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M594',
  id,
  27000,
  1.00,
  '2556-10-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 594 | ต้นเงิน: 27,000 | ดอกเบี้ย: 31,860 | รวม: 58,860'
FROM members WHERE member_code = 'M594'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 115. นาย ยุทธนันท์ สีสด (M624)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M624',
  'นาย',
  'ยุทธนันท์', 
  'สีสด', 
  NULL,
  '107',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 107 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M624',
  id,
  35000,
  1.00,
  '2558-06-22',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 624 | ต้นเงิน: 35,000 | ดอกเบี้ย: 34,300 | รวม: 69,300'
FROM members WHERE member_code = 'M624'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 116. นาย ยศ มะโนดี (M166)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M166',
  'นาย',
  'ยศ', 
  'มะโนดี', 
  NULL,
  '',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่  หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M166',
  id,
  20000,
  1.00,
  '2558-05-28',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 166 | ต้นเงิน: 20,000 | ดอกเบี้ย: 19,600 | รวม: 39,600'
FROM members WHERE member_code = 'M166'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 117. นาง แก้ว ไชยวารินทร์ (M436)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M436',
  'นาง',
  'แก้ว', 
  'ไชยวารินทร์', 
  NULL,
  '',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่  หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M436',
  id,
  20000,
  1.00,
  '2558-05-28',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 436 | ต้นเงิน: 20,000 | ดอกเบี้ย: 19,600 | รวม: 39,600'
FROM members WHERE member_code = 'M436'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 118. นาง น้ำฝน พากเพียร (M500)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M500',
  'นาง',
  'น้ำฝน', 
  'พากเพียร', 
  NULL,
  '',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่  หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M500',
  id,
  20000,
  1.00,
  '2558-05-28',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 500 | ต้นเงิน: 20,000 | ดอกเบี้ย: 19,600 | รวม: 39,600'
FROM members WHERE member_code = 'M500'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 119. นาย คทาวุธ หายโศรก (M279) - อายุ 38 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M279',
  'นาย',
  'คทาวุธ', 
  'หายโศรก', 
  38,
  '63',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 63 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M279',
  id,
  20000,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 279 | ต้นเงิน: 20,000 | ดอกเบี้ย: 15,400 | รวม: 35,400'
FROM members WHERE member_code = 'M279'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 120. นาง พัชรา ชาวเวียง (M280) - อายุ 52 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M280',
  'นาง',
  'พัชรา', 
  'ชาวเวียง', 
  52,
  '88',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 88 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M280',
  id,
  20000,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 280 | ต้นเงิน: 20,000 | ดอกเบี้ย: 15,400 | รวม: 35,400'
FROM members WHERE member_code = 'M280'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 121. นาง ปั๋น มะโนดี (M281) - อายุ 70 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M281',
  'นาง',
  'ปั๋น', 
  'มะโนดี', 
  70,
  '45',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 45 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M281',
  id,
  25382,
  1.00,
  '2561-10-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 281 | ต้นเงิน: 25,382 | ดอกเบี้ย: 14,721.56 | รวม: 40,103.56'
FROM members WHERE member_code = 'M281'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 122. นาง จำปาอ่อน นิทะโน (M283) - อายุ 45 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M283',
  'นาง',
  'จำปาอ่อน', 
  'นิทะโน', 
  45,
  '98',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 98 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M283',
  id,
  40675,
  1.00,
  '2558-05-09',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 283 | ต้นเงิน: 40,675 | ดอกเบี้ย: 40,268.25 | รวม: 80,943.25'
FROM members WHERE member_code = 'M283'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 123. นาง แทน นิทะโน (M285)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M285',
  'นาง',
  'แทน', 
  'นิทะโน', 
  NULL,
  '24',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 24 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M285',
  id,
  34000,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 285 | ต้นเงิน: 34,000 | ดอกเบี้ย: 26,180 | รวม: 60,180'
FROM members WHERE member_code = 'M285'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 124. นาย มอย ไชยวารินทร์ (M286)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M286',
  'นาย',
  'มอย', 
  'ไชยวารินทร์', 
  NULL,
  '18',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 18 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M286',
  id,
  35675,
  1.00,
  '2556-09-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 286 | ต้นเงิน: 35,675 | ดอกเบี้ย: 42,453.25 | รวม: 78,128.25'
FROM members WHERE member_code = 'M286'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 125. นาง คำปัน ขุนมิน (M287) - อายุ 56 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M287',
  'นาง',
  'คำปัน', 
  'ขุนมิน', 
  56,
  '42',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 42 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M287',
  id,
  40000,
  1.00,
  '2560-04-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 287 | ต้นเงิน: 40,000 | ดอกเบี้ย: 30,400 | รวม: 70,400'
FROM members WHERE member_code = 'M287'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 126. นาง บุญเจือ มะโนดี (M288)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M288',
  'นาง',
  'บุญเจือ', 
  'มะโนดี', 
  NULL,
  '80',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 80 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M288',
  id,
  46815,
  1.00,
  '2556-12-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 288 | ต้นเงิน: 46,815 | ดอกเบี้ย: 54,305.4 | รวม: 101,120.4'
FROM members WHERE member_code = 'M288'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 127. นาง สุนิสา แต้มงาม (M289)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M289',
  'นาง',
  'สุนิสา', 
  'แต้มงาม', 
  NULL,
  '97',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 97 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M289',
  id,
  38000,
  1.00,
  '2556-09-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 289 | ต้นเงิน: 38,000 | ดอกเบี้ย: 45,220 | รวม: 83,220'
FROM members WHERE member_code = 'M289'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 128. นาง สุพรรณ์ มะโนดี (M290) - อายุ 60 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M290',
  'นาง',
  'สุพรรณ์', 
  'มะโนดี', 
  60,
  '58',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 58 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M290',
  id,
  10000,
  1.00,
  '2562-04-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 290 | ต้นเงิน: 10,000 | ดอกเบี้ย: 5,200 | รวม: 15,200'
FROM members WHERE member_code = 'M290'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 129. นาง อำพร พากเพียร (M293)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M293',
  'นาง',
  'อำพร', 
  'พากเพียร', 
  NULL,
  '104',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 104 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M293',
  id,
  4602,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 293 | ต้นเงิน: 4,602 | ดอกเบี้ย: 3,543.54 | รวม: 8,145.54'
FROM members WHERE member_code = 'M293'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 130. นาย ชำนาญ แต้มงาม (M295)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M295',
  'นาย',
  'ชำนาญ', 
  'แต้มงาม', 
  NULL,
  '32',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 32 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M295',
  id,
  23947,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 295 | ต้นเงิน: 23,947 | ดอกเบี้ย: 18,439.19 | รวม: 42,386.19'
FROM members WHERE member_code = 'M295'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 131. นาย เสน่ห์ นิทะโน (M311)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M311',
  'นาย',
  'เสน่ห์', 
  'นิทะโน', 
  NULL,
  '78',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 78 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M311',
  id,
  20000,
  1.00,
  '2558-05-18',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 311 | ต้นเงิน: 20,000 | ดอกเบี้ย: 19,800 | รวม: 39,800'
FROM members WHERE member_code = 'M311'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 132. นาง ปราณี นิทโน (M312)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M312',
  'นาง',
  'ปราณี', 
  'นิทโน', 
  NULL,
  '35',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 35 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M312',
  id,
  44000,
  1.00,
  '2557-01-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 312 | ต้นเงิน: 44,000 | ดอกเบี้ย: 50,600 | รวม: 94,600'
FROM members WHERE member_code = 'M312'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 133. นาง กรรณิการ์ แก้วลองบน (M313)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M313',
  'นาง',
  'กรรณิการ์', 
  'แก้วลองบน', 
  NULL,
  '95',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 95 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M313',
  id,
  35000,
  1.00,
  '2556-09-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 313 | ต้นเงิน: 35,000 | ดอกเบี้ย: 41,650 | รวม: 76,650'
FROM members WHERE member_code = 'M313'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 134. นาง จันสวย นิทะโน (M314)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M314',
  'นาง',
  'จันสวย', 
  'นิทะโน', 
  NULL,
  '77',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 77 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M314',
  id,
  40000,
  1.00,
  '2561-04-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 314 | ต้นเงิน: 40,000 | ดอกเบี้ย: 25,600 | รวม: 65,600'
FROM members WHERE member_code = 'M314'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 135. นาง อำพา นิทะโน (M316) - อายุ 62 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M316',
  'นาง',
  'อำพา', 
  'นิทะโน', 
  62,
  '55',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 55 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M316',
  id,
  2626,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 316 | ต้นเงิน: 2,626 | ดอกเบี้ย: 2,022.02 | รวม: 4,648.02'
FROM members WHERE member_code = 'M316'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 136. นาย จิรพันธ์ มะโนดี (M317) - อายุ 45 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M317',
  'นาย',
  'จิรพันธ์', 
  'มะโนดี', 
  45,
  '71',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 71 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M317',
  id,
  56763,
  1.00,
  '2557-12-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 317 | ต้นเงิน: 56,763 | ดอกเบี้ย: 59,033.52 | รวม: 115,796.52'
FROM members WHERE member_code = 'M317'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 137. นาง จำปี มะโนดี (M318)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M318',
  'นาง',
  'จำปี', 
  'มะโนดี', 
  NULL,
  '89',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 89 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M318',
  id,
  20000,
  1.00,
  '2558-05-24',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 318 | ต้นเงิน: 20,000 | ดอกเบี้ย: 19,800 | รวม: 39,800'
FROM members WHERE member_code = 'M318'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 138. นาง ชญาดา นิทะโน (M385)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M385',
  'นาง',
  'ชญาดา', 
  'นิทะโน', 
  NULL,
  '78',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 78 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M385',
  id,
  25000,
  1.00,
  '2558-05-25',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 385 | ต้นเงิน: 25,000 | ดอกเบี้ย: 24,750 | รวม: 49,750'
FROM members WHERE member_code = 'M385'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 139. นาง สุดาลักษณ์ หมื่นขัติย์ (M387)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M387',
  'นาง',
  'สุดาลักษณ์', 
  'หมื่นขัติย์', 
  NULL,
  '46',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 46 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M387',
  id,
  22911,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 387 | ต้นเงิน: 22,911 | ดอกเบี้ย: 17,641.47 | รวม: 40,552.47'
FROM members WHERE member_code = 'M387'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 140. นาย บุญเตี่ยม นาภู (M402)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M402',
  'นาย',
  'บุญเตี่ยม', 
  'นาภู', 
  NULL,
  '77',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 77 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M402',
  id,
  40000,
  1.00,
  '2558-05-27',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 402 | ต้นเงิน: 40,000 | ดอกเบี้ย: 39,200 | รวม: 79,200'
FROM members WHERE member_code = 'M402'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 141. นาง ก่ำ พากเพียร (M426)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M426',
  'นาง',
  'ก่ำ', 
  'พากเพียร', 
  NULL,
  '34',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 34 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M426',
  id,
  25157,
  1.00,
  '2561-05-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 426 | ต้นเงิน: 25,157 | ดอกเบี้ย: 15,848.91 | รวม: 41,005.91'
FROM members WHERE member_code = 'M426'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 142. นาง ประนอม ไชยวารินทร์ (M428)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M428',
  'นาง',
  'ประนอม', 
  'ไชยวารินทร์', 
  NULL,
  '105',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 105 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M428',
  id,
  28000,
  1.00,
  '2555-10-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 428 | ต้นเงิน: 28,000 | ดอกเบี้ย: 36,400 | รวม: 64,400'
FROM members WHERE member_code = 'M428'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 143. นาง เครือวัลย์ นิทะโน (M429)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M429',
  'นาง',
  'เครือวัลย์', 
  'นิทะโน', 
  NULL,
  '59',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 59 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M429',
  id,
  40000,
  1.00,
  '2555-10-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 429 | ต้นเงิน: 40,000 | ดอกเบี้ย: 52,000 | รวม: 92,000'
FROM members WHERE member_code = 'M429'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 144. น.ส. นลณีย์ หายโศก (M430)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M430',
  'น.ส.',
  'นลณีย์', 
  'หายโศก', 
  NULL,
  '59',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 59 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M430',
  id,
  28000,
  1.00,
  '2555-10-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 430 | ต้นเงิน: 28,000 | ดอกเบี้ย: 36,400 | รวม: 64,400'
FROM members WHERE member_code = 'M430'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 145. น.ส. อรทัย คงมาตย์ (M431)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M431',
  'น.ส.',
  'อรทัย', 
  'คงมาตย์', 
  NULL,
  '71',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 71 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M431',
  id,
  47518,
  1.00,
  '2557-12-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 431 | ต้นเงิน: 47,518 | ดอกเบี้ย: 49,418.72 | รวม: 96,936.72'
FROM members WHERE member_code = 'M431'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 146. นาง ลักษณารีย์ นิทะโน (M432)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M432',
  'นาง',
  'ลักษณารีย์', 
  'นิทะโน', 
  NULL,
  '102',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 102 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M432',
  id,
  15959,
  1.00,
  '2559-04-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 432 | ต้นเงิน: 15,959 | ดอกเบี้ย: 14,043.92 | รวม: 30,002.92'
FROM members WHERE member_code = 'M432'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 147. นาย ศรียนต์ มะโนดี (M433)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M433',
  'นาย',
  'ศรียนต์', 
  'มะโนดี', 
  NULL,
  '109',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 109 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M433',
  id,
  40000,
  1.00,
  '2556-05-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 433 | ต้นเงิน: 40,000 | ดอกเบี้ย: 49,200 | รวม: 89,200'
FROM members WHERE member_code = 'M433'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 148. นาง เลี่ยน มะโนดี (M434)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M434',
  'นาง',
  'เลี่ยน', 
  'มะโนดี', 
  NULL,
  '17',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 17 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M434',
  id,
  37311,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 434 | ต้นเงิน: 37,311 | ดอกเบี้ย: 28,729.47 | รวม: 66,040.47'
FROM members WHERE member_code = 'M434'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 149. นาง แสงเทียน อ่อนนวล (M435)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M435',
  'นาง',
  'แสงเทียน', 
  'อ่อนนวล', 
  NULL,
  '9',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 9 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M435',
  id,
  26319,
  1.00,
  '2558-06-05',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 435 | ต้นเงิน: 26,319 | ดอกเบี้ย: 25,792.62 | รวม: 52,111.62'
FROM members WHERE member_code = 'M435'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 150. นาง บัวไหล หมื่นขัติย์ (M437)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M437',
  'นาง',
  'บัวไหล', 
  'หมื่นขัติย์', 
  NULL,
  '72',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 72 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M437',
  id,
  26000,
  1.00,
  '2560-04-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 437 | ต้นเงิน: 26,000 | ดอกเบี้ย: 19,760 | รวม: 45,760'
FROM members WHERE member_code = 'M437'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 151. นาย พีรวิชญ์ แก้วลองบน (M442)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M442',
  'นาย',
  'พีรวิชญ์', 
  'แก้วลองบน', 
  NULL,
  '95',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 95 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M442',
  id,
  26500,
  1.00,
  '2559-09-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 442 | ต้นเงิน: 26,500 | ดอกเบี้ย: 21,995 | รวม: 48,495'
FROM members WHERE member_code = 'M442'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 152. นาง จำลอง นิทะโน (M443)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M443',
  'นาง',
  'จำลอง', 
  'นิทะโน', 
  NULL,
  '75',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 75 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M443',
  id,
  31500,
  1.00,
  '2556-09-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 443 | ต้นเงิน: 31,500 | ดอกเบี้ย: 37,485 | รวม: 68,985'
FROM members WHERE member_code = 'M443'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 153. นาง สุดารัตน์ นิทะโน (M445)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M445',
  'นาง',
  'สุดารัตน์', 
  'นิทะโน', 
  NULL,
  '19',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 19 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M445',
  id,
  36500,
  1.00,
  '2556-09-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 445 | ต้นเงิน: 36,500 | ดอกเบี้ย: 43,435 | รวม: 79,935'
FROM members WHERE member_code = 'M445'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 154. นาง ทา พากเพียร (M446)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M446',
  'นาง',
  'ทา', 
  'พากเพียร', 
  NULL,
  '60',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 60 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M446',
  id,
  23696,
  1.00,
  '2558-05-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 446 | ต้นเงิน: 23,696 | ดอกเบี้ย: 23,459.04 | รวม: 47,155.04'
FROM members WHERE member_code = 'M446'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 155. นาง ดาว แซ่ย่าง (M466)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M466',
  'นาง',
  'ดาว', 
  'แซ่ย่าง', 
  NULL,
  '109',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 109 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M466',
  id,
  30000,
  1.00,
  '2558-06-11',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 466 | ต้นเงิน: 30,000 | ดอกเบี้ย: 29,400 | รวม: 59,400'
FROM members WHERE member_code = 'M466'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 156. นาย อำนวย ขุนมิน (M499) - อายุ 56 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M499',
  'นาย',
  'อำนวย', 
  'ขุนมิน', 
  56,
  '42',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 42 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M499',
  id,
  22000,
  1.00,
  '2560-04-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 499 | ต้นเงิน: 22,000 | ดอกเบี้ย: 16,720 | รวม: 38,720'
FROM members WHERE member_code = 'M499'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 157. นาย จรัส นิทะโน (M501) - อายุ 50 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M501',
  'นาย',
  'จรัส', 
  'นิทะโน', 
  50,
  '24',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 24 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M501',
  id,
  35000,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 501 | ต้นเงิน: 35,000 | ดอกเบี้ย: 26,950 | รวม: 61,950'
FROM members WHERE member_code = 'M501'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 158. นาง เพชรา แต้มงาม (M503)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M503',
  'นาง',
  'เพชรา', 
  'แต้มงาม', 
  NULL,
  '32',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 32 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M503',
  id,
  23642,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 503 | ต้นเงิน: 23,642 | ดอกเบี้ย: 18,204.34 | รวม: 41,846.34'
FROM members WHERE member_code = 'M503'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 159. นาย จรัส ชาวเวียง (M504) - อายุ 52 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M504',
  'นาย',
  'จรัส', 
  'ชาวเวียง', 
  52,
  '88',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 88 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M504',
  id,
  25000,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 504 | ต้นเงิน: 25,000 | ดอกเบี้ย: 19,250 | รวม: 44,250'
FROM members WHERE member_code = 'M504'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 160. นาง ก๋อง พากเพียร (M505) - อายุ 67 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M505',
  'นาง',
  'ก๋อง', 
  'พากเพียร', 
  67,
  '34',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 34 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M505',
  id,
  26294,
  1.00,
  '2561-05-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 505 | ต้นเงิน: 26,294 | ดอกเบี้ย: 16,565.22 | รวม: 42,859.22'
FROM members WHERE member_code = 'M505'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 161. นาย สุวิทย์ นิทะโน (M587) - อายุ 62 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M587',
  'นาย',
  'สุวิทย์', 
  'นิทะโน', 
  62,
  '59',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 59 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M587',
  id,
  35000,
  1.00,
  '2556-09-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 587 | ต้นเงิน: 35,000 | ดอกเบี้ย: 41,650 | รวม: 76,650'
FROM members WHERE member_code = 'M587'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 162. นาง นวล ไชยวารินทร์ (M589)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M589',
  'นาง',
  'นวล', 
  'ไชยวารินทร์', 
  NULL,
  '18',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 18 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M589',
  id,
  30000,
  1.00,
  '2556-09-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 589 | ต้นเงิน: 30,000 | ดอกเบี้ย: 35,700 | รวม: 65,700'
FROM members WHERE member_code = 'M589'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 163. นาย ฝาก มะโนดี (M591) - อายุ 67 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M591',
  'นาย',
  'ฝาก', 
  'มะโนดี', 
  67,
  '17',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 17 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M591',
  id,
  22000,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 591 | ต้นเงิน: 22,000 | ดอกเบี้ย: 16,940 | รวม: 38,940'
FROM members WHERE member_code = 'M591'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 164. นาย ประทีป หมื่นขัติย์ (M592) - อายุ 58 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M592',
  'นาย',
  'ประทีป', 
  'หมื่นขัติย์', 
  58,
  '46',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 46 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M592',
  id,
  34615,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 592 | ต้นเงิน: 34,615 | ดอกเบี้ย: 26,653.55 | รวม: 61,268.55'
FROM members WHERE member_code = 'M592'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 165. น.ส. ลออรัตน์ ปันแต๋ (M594)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M594',
  'น.ส.',
  'ลออรัตน์', 
  'ปันแต๋', 
  NULL,
  '107',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 107 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M594',
  id,
  27000,
  1.00,
  '2556-10-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 594 | ต้นเงิน: 27,000 | ดอกเบี้ย: 31,860 | รวม: 58,860'
FROM members WHERE member_code = 'M594'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 166. นาย ยุทธนันท์ สีสด (M624)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M624',
  'นาย',
  'ยุทธนันท์', 
  'สีสด', 
  NULL,
  '107',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 107 หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M624',
  id,
  35000,
  1.00,
  '2558-06-22',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 624 | ต้นเงิน: 35,000 | ดอกเบี้ย: 34,300 | รวม: 69,300'
FROM members WHERE member_code = 'M624'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 167. นาย ยศ มะโนดี (M166)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M166',
  'นาย',
  'ยศ', 
  'มะโนดี', 
  NULL,
  '',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่  หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M166',
  id,
  20000,
  1.00,
  '2558-05-28',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 166 | ต้นเงิน: 20,000 | ดอกเบี้ย: 19,600 | รวม: 39,600'
FROM members WHERE member_code = 'M166'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 168. นาง แก้ว ไชยวารินทร์ (M436)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M436',
  'นาง',
  'แก้ว', 
  'ไชยวารินทร์', 
  NULL,
  '',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่  หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M436',
  id,
  20000,
  1.00,
  '2558-05-28',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 436 | ต้นเงิน: 20,000 | ดอกเบี้ย: 19,600 | รวม: 39,600'
FROM members WHERE member_code = 'M436'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 169. นาง น้ำฝน พากเพียร (M500)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M500',
  'นาง',
  'น้ำฝน', 
  'พากเพียร', 
  NULL,
  '',
  '7',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่  หมู่ 7 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M500',
  id,
  20000,
  1.00,
  '2558-05-28',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 500 | ต้นเงิน: 20,000 | ดอกเบี้ย: 19,600 | รวม: 39,600'
FROM members WHERE member_code = 'M500'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 170. นาง สุพรรณ์ ก้อนสีลา (M354) - อายุ 54 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M354',
  'นาง',
  'สุพรรณ์', 
  'ก้อนสีลา', 
  54,
  '70',
  '8',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 70 หมู่ 8 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M354',
  id,
  41131,
  1.00,
  '2557-08-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 354 | ต้นเงิน: 41,131 | ดอกเบี้ย: 44,421.48 | รวม: 85,552.48'
FROM members WHERE member_code = 'M354'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 171. นาง จันทนา ไชยบุญเรือง (M552) - อายุ 52 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M552',
  'นาง',
  'จันทนา', 
  'ไชยบุญเรือง', 
  52,
  '139',
  '8',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 139 หมู่ 8 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M552',
  id,
  25036,
  1.00,
  '2561-08-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 552 | ต้นเงิน: 25,036 | ดอกเบี้ย: 15,021.6 | รวม: 40,057.6'
FROM members WHERE member_code = 'M552'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 172. นาง จันทร์สม โครงกาบ (M557) - อายุ 52 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M557',
  'นาง',
  'จันทร์สม', 
  'โครงกาบ', 
  52,
  '170',
  '8',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 170 หมู่ 8 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M557',
  id,
  29948,
  1.00,
  '2561-06-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 557 | ต้นเงิน: 29,948 | ดอกเบี้ย: 18,567.76 | รวม: 48,515.76'
FROM members WHERE member_code = 'M557'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 173. นาย ภาคภูมิ แซ่เติ๋น (M191) - อายุ 43 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M191',
  'นาย',
  'ภาคภูมิ', 
  'แซ่เติ๋น', 
  43,
  '31',
  '9',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 31 หมู่ 9 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M191',
  id,
  17081,
  1.00,
  '2555-08-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 191 | ต้นเงิน: 17,081 | ดอกเบี้ย: 22,546.92 | รวม: 39,627.92'
FROM members WHERE member_code = 'M191'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 174. นาง สุพัตรา ตรีรักษ์พิทักษ์กุล (M388) - อายุ 50 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M388',
  'นาง',
  'สุพัตรา', 
  'ตรีรักษ์พิทักษ์กุล', 
  50,
  '19',
  '9',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 19 หมู่ 9 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M388',
  id,
  25000,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 388 | ต้นเงิน: 25,000 | ดอกเบี้ย: 19,250 | รวม: 44,250'
FROM members WHERE member_code = 'M388'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 175. น.ส. สุธิดา กีรติวิทยางกูล (M389) - อายุ 43 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M389',
  'น.ส.',
  'สุธิดา', 
  'กีรติวิทยางกูล', 
  43,
  '22',
  '9',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 22 หมู่ 9 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M389',
  id,
  24000,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 389 | ต้นเงิน: 24,000 | ดอกเบี้ย: 18,480 | รวม: 42,480'
FROM members WHERE member_code = 'M389'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 176. นาง กัญญาวีร์ แซ่พ่าน (M390)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M390',
  'นาง',
  'กัญญาวีร์', 
  'แซ่พ่าน', 
  NULL,
  '102',
  '9',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 102 หมู่ 9 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M390',
  id,
  25000,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 390 | ต้นเงิน: 25,000 | ดอกเบี้ย: 19,250 | รวม: 44,250'
FROM members WHERE member_code = 'M390'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 177. นาย สมนึก สังข์โบสถ์ (M396)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M396',
  'นาย',
  'สมนึก', 
  'สังข์โบสถ์', 
  NULL,
  '21',
  '9',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 21 หมู่ 9 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M396',
  id,
  25000,
  1.00,
  '2558-05-10',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 396 | ต้นเงิน: 25,000 | ดอกเบี้ย: 24,750 | รวม: 49,750'
FROM members WHERE member_code = 'M396'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 178. น.ส. สาวิณี มะโนดี (M272) - อายุ 53 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M272',
  'น.ส.',
  'สาวิณี', 
  'มะโนดี', 
  53,
  '7',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 7 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M272',
  id,
  35000,
  1.00,
  '2556-09-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 272 | ต้นเงิน: 35,000 | ดอกเบี้ย: 41,650 | รวม: 76,650'
FROM members WHERE member_code = 'M272'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 179. นาย สาย เขียวสด (M274) - อายุ 60 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M274',
  'นาย',
  'สาย', 
  'เขียวสด', 
  60,
  '51',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 51 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M274',
  id,
  15000,
  1.00,
  '2556-09-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 274 | ต้นเงิน: 15,000 | ดอกเบี้ย: 17,850 | รวม: 32,850'
FROM members WHERE member_code = 'M274'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 180. นาย สมิง ชาวเวียง (M447) - อายุ 45 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M447',
  'นาย',
  'สมิง', 
  'ชาวเวียง', 
  45,
  '88',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 88 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M447',
  id,
  20000,
  1.00,
  '2558-05-08',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 447 | ต้นเงิน: 20,000 | ดอกเบี้ย: 19,800 | รวม: 39,800'
FROM members WHERE member_code = 'M447'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 181. นาง รำยอง ไชยวารินทร์ (M448) - อายุ 33 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M448',
  'นาง',
  'รำยอง', 
  'ไชยวารินทร์', 
  33,
  '92',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 92 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M448',
  id,
  25000,
  1.00,
  '2558-05-09',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 448 | ต้นเงิน: 25,000 | ดอกเบี้ย: 24,750 | รวม: 49,750'
FROM members WHERE member_code = 'M448'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 182. น.ส. ทัศนีย์ หมื่นขัติย์ (M449) - อายุ 28 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M449',
  'น.ส.',
  'ทัศนีย์', 
  'หมื่นขัติย์', 
  28,
  '97',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 97 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M449',
  id,
  25000,
  1.00,
  '2558-05-10',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 449 | ต้นเงิน: 25,000 | ดอกเบี้ย: 24,750 | รวม: 49,750'
FROM members WHERE member_code = 'M449'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 183. นาง สุรัตน์ ศรีสด (M450)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M450',
  'นาง',
  'สุรัตน์', 
  'ศรีสด', 
  NULL,
  '51',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 51 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M450',
  id,
  20000,
  1.00,
  '2558-05-11',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 450 | ต้นเงิน: 20,000 | ดอกเบี้ย: 19,800 | รวม: 39,800'
FROM members WHERE member_code = 'M450'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 184. นาง มาลี หายโศรก (M452) - อายุ 40 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M452',
  'นาง',
  'มาลี', 
  'หายโศรก', 
  40,
  '90',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 90 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M452',
  id,
  25000,
  1.00,
  '2558-05-12',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 452 | ต้นเงิน: 25,000 | ดอกเบี้ย: 24,750 | รวม: 49,750'
FROM members WHERE member_code = 'M452'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 185. นาง นา ชาวเวียง (M461) - อายุ 59 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M461',
  'นาง',
  'นา', 
  'ชาวเวียง', 
  59,
  '71',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 71 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M461',
  id,
  30000,
  1.00,
  '2556-11-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 461 | ต้นเงิน: 30,000 | ดอกเบี้ย: 35,100 | รวม: 65,100'
FROM members WHERE member_code = 'M461'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 186. นาง จิดาภา หว่อง (M465)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M465',
  'นาง',
  'จิดาภา', 
  'หว่อง', 
  NULL,
  '34',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 34 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M465',
  id,
  35000,
  1.00,
  '2558-05-14',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 465 | ต้นเงิน: 35,000 | ดอกเบี้ย: 34,650 | รวม: 69,650'
FROM members WHERE member_code = 'M465'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 187. นาย มานิตย์ หายโศรก (M475) - อายุ 45 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M475',
  'นาย',
  'มานิตย์', 
  'หายโศรก', 
  45,
  '90',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 90 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M475',
  id,
  25000,
  1.00,
  '2556-04-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 475 | ต้นเงิน: 25,000 | ดอกเบี้ย: 31,000 | รวม: 56,000'
FROM members WHERE member_code = 'M475'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 188. นาย ชลิต ธิต๊ะยา (M476)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M476',
  'นาย',
  'ชลิต', 
  'ธิต๊ะยา', 
  NULL,
  '97',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 97 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M476',
  id,
  30000,
  1.00,
  '2555-11-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 476 | ต้นเงิน: 30,000 | ดอกเบี้ย: 38,700 | รวม: 68,700'
FROM members WHERE member_code = 'M476'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 189. นาย สงบ ไกลถิ่น (M477)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M477',
  'นาย',
  'สงบ', 
  'ไกลถิ่น', 
  NULL,
  '34',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 34 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M477',
  id,
  30000,
  1.00,
  '2555-11-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 477 | ต้นเงิน: 30,000 | ดอกเบี้ย: 38,700 | รวม: 68,700'
FROM members WHERE member_code = 'M477'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 190. นาง อรัญญา นิทะโน (M478) - อายุ 49 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M478',
  'นาง',
  'อรัญญา', 
  'นิทะโน', 
  49,
  '10',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 10 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M478',
  id,
  25000,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 478 | ต้นเงิน: 25,000 | ดอกเบี้ย: 19,250 | รวม: 44,250'
FROM members WHERE member_code = 'M478'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 191. นาย คำ ปิ่นแก้ว (M479) - อายุ 64 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M479',
  'นาย',
  'คำ', 
  'ปิ่นแก้ว', 
  64,
  '54',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 54 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M479',
  id,
  16900,
  1.00,
  '2556-04-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 479 | ต้นเงิน: 16,900 | ดอกเบี้ย: 20,956 | รวม: 37,856'
FROM members WHERE member_code = 'M479'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 192. นาย เชิด พากเพียร (M484) - อายุ 60 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M484',
  'นาย',
  'เชิด', 
  'พากเพียร', 
  60,
  '40',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 40 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M484',
  id,
  20000,
  1.00,
  '2562-05-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 484 | ต้นเงิน: 20,000 | ดอกเบี้ย: 10,200 | รวม: 30,200'
FROM members WHERE member_code = 'M484'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 193. นาย สม โปร่งคำ (M485) - อายุ 66 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M485',
  'นาย',
  'สม', 
  'โปร่งคำ', 
  66,
  '26',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 26 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M485',
  id,
  30000,
  1.00,
  '2555-11-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 485 | ต้นเงิน: 30,000 | ดอกเบี้ย: 38,700 | รวม: 68,700'
FROM members WHERE member_code = 'M485'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 194. นาย ทรงชัย ชาวเวียง (M486) - อายุ 53 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M486',
  'นาย',
  'ทรงชัย', 
  'ชาวเวียง', 
  53,
  '70',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 70 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M486',
  id,
  30000,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 486 | ต้นเงิน: 30,000 | ดอกเบี้ย: 23,100 | รวม: 53,100'
FROM members WHERE member_code = 'M486'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 195. นาย ประนอม ทายะ (M487) - อายุ 45 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M487',
  'นาย',
  'ประนอม', 
  'ทายะ', 
  45,
  '27',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 27 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M487',
  id,
  35000,
  1.00,
  '2561-05-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 487 | ต้นเงิน: 35,000 | ดอกเบี้ย: 22,050 | รวม: 57,050'
FROM members WHERE member_code = 'M487'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 196. นาย ชาน บุญใหญ่ (M488) - อายุ 42 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M488',
  'นาย',
  'ชาน', 
  'บุญใหญ่', 
  42,
  '36',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 36 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M488',
  id,
  30000,
  1.00,
  '2555-11-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 488 | ต้นเงิน: 30,000 | ดอกเบี้ย: 38,700 | รวม: 68,700'
FROM members WHERE member_code = 'M488'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 197. นาง ยอด ชาวเวียง (M490) - อายุ 43 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M490',
  'นาง',
  'ยอด', 
  'ชาวเวียง', 
  43,
  '20',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 20 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M490',
  id,
  30000,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 490 | ต้นเงิน: 30,000 | ดอกเบี้ย: 23,100 | รวม: 53,100'
FROM members WHERE member_code = 'M490'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 198. นาง เครือวัลย์ ชาวเวียง (M491) - อายุ 50 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M491',
  'นาง',
  'เครือวัลย์', 
  'ชาวเวียง', 
  50,
  '70',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 70 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M491',
  id,
  30000,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 491 | ต้นเงิน: 30,000 | ดอกเบี้ย: 23,100 | รวม: 53,100'
FROM members WHERE member_code = 'M491'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 199. นาง จำลอง ไชยวารินทร์ (M493) - อายุ 53 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M493',
  'นาง',
  'จำลอง', 
  'ไชยวารินทร์', 
  53,
  '58',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 58 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M493',
  id,
  35000,
  1.00,
  '2556-09-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 493 | ต้นเงิน: 35,000 | ดอกเบี้ย: 41,650 | รวม: 76,650'
FROM members WHERE member_code = 'M493'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 200. นาง ย้าย ชาวเวียง (M494)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M494',
  'นาง',
  'ย้าย', 
  'ชาวเวียง', 
  NULL,
  '57',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 57 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M494',
  id,
  35000,
  1.00,
  '2556-11-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 494 | ต้นเงิน: 35,000 | ดอกเบี้ย: 40,950 | รวม: 75,950'
FROM members WHERE member_code = 'M494'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 201. นาง บัวโยม ธรรมชัย (M495) - อายุ 39 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M495',
  'นาง',
  'บัวโยม', 
  'ธรรมชัย', 
  39,
  '77',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 77 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M495',
  id,
  25000,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 495 | ต้นเงิน: 25,000 | ดอกเบี้ย: 19,250 | รวม: 44,250'
FROM members WHERE member_code = 'M495'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 202. นาย สารคาม ไชยวารินทร์ (M497)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M497',
  'นาย',
  'สารคาม', 
  'ไชยวารินทร์', 
  NULL,
  '32',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 32 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M497',
  id,
  25000,
  1.00,
  '2558-05-30',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 497 | ต้นเงิน: 25,000 | ดอกเบี้ย: 24,500 | รวม: 49,500'
FROM members WHERE member_code = 'M497'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 203. นาง กุลธิดา ชาวเวียง (M502)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M502',
  'นาง',
  'กุลธิดา', 
  'ชาวเวียง', 
  NULL,
  '28',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 28 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M502',
  id,
  35000,
  1.00,
  '2558-05-31',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 502 | ต้นเงิน: 35,000 | ดอกเบี้ย: 34,300 | รวม: 69,300'
FROM members WHERE member_code = 'M502'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 204. นาย อิ่นคำ ไชยวารินทร์ (M508) - อายุ 61 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M508',
  'นาย',
  'อิ่นคำ', 
  'ไชยวารินทร์', 
  61,
  '32',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 32 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M508',
  id,
  23000,
  1.00,
  '2558-06-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 508 | ต้นเงิน: 23,000 | ดอกเบี้ย: 22,540 | รวม: 45,540'
FROM members WHERE member_code = 'M508'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 205. นาย อนุชิต ไชยวารินทร์ (M510) - อายุ 53 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M510',
  'นาย',
  'อนุชิต', 
  'ไชยวารินทร์', 
  53,
  '58',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 58 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M510',
  id,
  34500,
  1.00,
  '2556-09-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 510 | ต้นเงิน: 34,500 | ดอกเบี้ย: 41,055 | รวม: 75,555'
FROM members WHERE member_code = 'M510'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 206. นาง พร จักร์แก้ว (M512) - อายุ 65 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M512',
  'นาง',
  'พร', 
  'จักร์แก้ว', 
  65,
  '12',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 12 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M512',
  id,
  24713,
  1.00,
  '2562-04-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 512 | ต้นเงิน: 24,713 | ดอกเบี้ย: 12,850.76 | รวม: 37,563.76'
FROM members WHERE member_code = 'M512'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 207. นาย นิคม ไชยวารินทร์ (M513) - อายุ 32 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M513',
  'นาย',
  'นิคม', 
  'ไชยวารินทร์', 
  32,
  '58',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 58 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M513',
  id,
  20000,
  1.00,
  '2558-06-04',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 513 | ต้นเงิน: 20,000 | ดอกเบี้ย: 19,600 | รวม: 39,600'
FROM members WHERE member_code = 'M513'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 208. นาย ชน ชาวเวียง (M514) - อายุ 48 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M514',
  'นาย',
  'ชน', 
  'ชาวเวียง', 
  48,
  '76',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 76 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M514',
  id,
  20000,
  1.00,
  '2558-06-05',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 514 | ต้นเงิน: 20,000 | ดอกเบี้ย: 19,600 | รวม: 39,600'
FROM members WHERE member_code = 'M514'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 209. นาง วรัญญา ชาวเวียง (M515)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M515',
  'นาง',
  'วรัญญา', 
  'ชาวเวียง', 
  NULL,
  '82',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 82 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M515',
  id,
  20000,
  1.00,
  '2558-06-06',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 515 | ต้นเงิน: 20,000 | ดอกเบี้ย: 19,600 | รวม: 39,600'
FROM members WHERE member_code = 'M515'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 210. นาย อำนวย ชาวเวียง (M518) - อายุ 63 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M518',
  'นาย',
  'อำนวย', 
  'ชาวเวียง', 
  63,
  '83',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 83 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M518',
  id,
  15987,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 518 | ต้นเงิน: 15,987 | ดอกเบี้ย: 12,309.99 | รวม: 28,296.99'
FROM members WHERE member_code = 'M518'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 211. นาง ศรีวรรณ ชาวเวียง (M523) - อายุ 45 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M523',
  'นาง',
  'ศรีวรรณ', 
  'ชาวเวียง', 
  45,
  '76',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 76 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M523',
  id,
  20000,
  1.00,
  '2558-06-08',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 523 | ต้นเงิน: 20,000 | ดอกเบี้ย: 19,600 | รวม: 39,600'
FROM members WHERE member_code = 'M523'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 212. นาง นงลักษณ์ พงษ์ภักดี (M524) - อายุ 46 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M524',
  'นาง',
  'นงลักษณ์', 
  'พงษ์ภักดี', 
  46,
  '81',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 81 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M524',
  id,
  20000,
  1.00,
  '2558-06-09',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 524 | ต้นเงิน: 20,000 | ดอกเบี้ย: 19,600 | รวม: 39,600'
FROM members WHERE member_code = 'M524'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 213. นาย วีรวัฒน์ ชาวเวียง (M525)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M525',
  'นาย',
  'วีรวัฒน์', 
  'ชาวเวียง', 
  NULL,
  '82',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 82 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M525',
  id,
  20000,
  1.00,
  '2558-06-10',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 525 | ต้นเงิน: 20,000 | ดอกเบี้ย: 19,600 | รวม: 39,600'
FROM members WHERE member_code = 'M525'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 214. นาย แก้ว ชาวเวียง (M526) - อายุ 54 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M526',
  'นาย',
  'แก้ว', 
  'ชาวเวียง', 
  54,
  '59',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 59 หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M526',
  id,
  27000,
  1.00,
  '2558-06-11',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 526 | ต้นเงิน: 27,000 | ดอกเบี้ย: 26,460 | รวม: 53,460'
FROM members WHERE member_code = 'M526'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 215. นาง ต่อมแก้ว พากเพียร (M492)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M492',
  'นาง',
  'ต่อมแก้ว', 
  'พากเพียร', 
  NULL,
  '',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่  หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M492',
  id,
  20000,
  1.00,
  '2558-05-28',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 492 | ต้นเงิน: 20,000 | ดอกเบี้ย: 19,600 | รวม: 39,600'
FROM members WHERE member_code = 'M492'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 216. นาง ผัด ชาวเวียง (M517)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M517',
  'นาง',
  'ผัด', 
  'ชาวเวียง', 
  NULL,
  '',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่  หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M517',
  id,
  17000,
  1.00,
  '2558-05-28',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 517 | ต้นเงิน: 17,000 | ดอกเบี้ย: 16,660 | รวม: 33,660'
FROM members WHERE member_code = 'M517'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 217. นาง จำเนียร มะโนดี (M519)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M519',
  'นาง',
  'จำเนียร', 
  'มะโนดี', 
  NULL,
  '',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่  หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M519',
  id,
  20000,
  1.00,
  '2558-05-28',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 519 | ต้นเงิน: 20,000 | ดอกเบี้ย: 19,600 | รวม: 39,600'
FROM members WHERE member_code = 'M519'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 218. นาง คำมอญ พากเพียร (M521)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M521',
  'นาง',
  'คำมอญ', 
  'พากเพียร', 
  NULL,
  '',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่  หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M521',
  id,
  20000,
  1.00,
  '2558-05-28',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 521 | ต้นเงิน: 20,000 | ดอกเบี้ย: 19,600 | รวม: 39,600'
FROM members WHERE member_code = 'M521'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 219. นาง ขันคำ นิทะโน (M522)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M522',
  'นาง',
  'ขันคำ', 
  'นิทะโน', 
  NULL,
  '',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่  หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M522',
  id,
  20000,
  1.00,
  '2558-05-28',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 522 | ต้นเงิน: 20,000 | ดอกเบี้ย: 19,600 | รวม: 39,600'
FROM members WHERE member_code = 'M522'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 220. นาง ย้าย ชาวเวียง (M593)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M593',
  'นาง',
  'ย้าย', 
  'ชาวเวียง', 
  NULL,
  '',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่  หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M593',
  id,
  32000,
  1.00,
  '2558-05-28',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 593 | ต้นเงิน: 32,000 | ดอกเบี้ย: 31,360 | รวม: 63,360'
FROM members WHERE member_code = 'M593'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 221. นาย ทวีศักดิ์ พากเพียร (M464)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M464',
  'นาย',
  'ทวีศักดิ์', 
  'พากเพียร', 
  NULL,
  '',
  '10',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่  หมู่ 10 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M464',
  id,
  30000,
  1.00,
  '2558-05-28',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 464 | ต้นเงิน: 30,000 | ดอกเบี้ย: 29,400 | รวม: 59,400'
FROM members WHERE member_code = 'M464'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 222. นาง กชพร วังเสมอ (M453)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M453',
  'นาง',
  'กชพร', 
  'วังเสมอ', 
  NULL,
  '64',
  '11',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 64 หมู่ 11 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M453',
  id,
  47000,
  1.00,
  '2556-11-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 453 | ต้นเงิน: 47,000 | ดอกเบี้ย: 54,990 | รวม: 101,990'
FROM members WHERE member_code = 'M453'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 223. นาย พันธ์ ชาวเวียง (M700) - อายุ 41 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M700',
  'นาย',
  'พันธ์', 
  'ชาวเวียง', 
  41,
  '23',
  '11',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 23 หมู่ 11 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M700',
  id,
  22000,
  1.00,
  '2561-04-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 700 | ต้นเงิน: 22,000 | ดอกเบี้ย: 14,080 | รวม: 36,080'
FROM members WHERE member_code = 'M700'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 224. นาง ไย ชาวเวียง (M701) - อายุ 63 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M701',
  'นาง',
  'ไย', 
  'ชาวเวียง', 
  63,
  '23',
  '11',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 23 หมู่ 11 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M701',
  id,
  22000,
  1.00,
  '2561-04-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 701 | ต้นเงิน: 22,000 | ดอกเบี้ย: 14,080 | รวม: 36,080'
FROM members WHERE member_code = 'M701'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 225. นาย สมพจน์ บัวเย็น (M359) - อายุ 57 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M359',
  'นาย',
  'สมพจน์', 
  'บัวเย็น', 
  57,
  '105',
  '12',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 105 หมู่ 12 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M359',
  id,
  40000,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 359 | ต้นเงิน: 40,000 | ดอกเบี้ย: 30,800 | รวม: 70,800'
FROM members WHERE member_code = 'M359'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 226. นาง บุญน้อม กลิ่นหอม (M376)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M376',
  'นาง',
  'บุญน้อม', 
  'กลิ่นหอม', 
  NULL,
  '126',
  '12',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 126 หมู่ 12 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M376',
  id,
  40000,
  1.00,
  '2558-05-07',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 376 | ต้นเงิน: 40,000 | ดอกเบี้ย: 39,600 | รวม: 79,600'
FROM members WHERE member_code = 'M376'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 227. นาง จำเนียร เกนทา (M377) - อายุ 57 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M377',
  'นาง',
  'จำเนียร', 
  'เกนทา', 
  57,
  '159',
  '12',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 159 หมู่ 12 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M377',
  id,
  40000,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 377 | ต้นเงิน: 40,000 | ดอกเบี้ย: 30,800 | รวม: 70,800'
FROM members WHERE member_code = 'M377'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 228. นาง แสงเดือน วงศ์แก้ว (M379) - อายุ 47 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M379',
  'นาง',
  'แสงเดือน', 
  'วงศ์แก้ว', 
  47,
  '33',
  '12',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 33 หมู่ 12 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M379',
  id,
  50000,
  1.00,
  '2558-05-09',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 379 | ต้นเงิน: 50,000 | ดอกเบี้ย: 49,500 | รวม: 99,500'
FROM members WHERE member_code = 'M379'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 229. นาง วันเพ็ญ ท้าวสิริ (M381) - อายุ 41 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M381',
  'นาง',
  'วันเพ็ญ', 
  'ท้าวสิริ', 
  41,
  '160',
  '12',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 160 หมู่ 12 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M381',
  id,
  26500,
  1.00,
  '2561-05-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 381 | ต้นเงิน: 26,500 | ดอกเบี้ย: 16,695 | รวม: 43,195'
FROM members WHERE member_code = 'M381'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 230. น.ส. ดลลภัส ทรายแก้ว (M382) - อายุ 40 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M382',
  'น.ส.',
  'ดลลภัส', 
  'ทรายแก้ว', 
  40,
  '103',
  '12',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 103 หมู่ 12 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M382',
  id,
  40000,
  1.00,
  '2556-09-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 382 | ต้นเงิน: 40,000 | ดอกเบี้ย: 47,600 | รวม: 87,600'
FROM members WHERE member_code = 'M382'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 231. นาง บานเย็น ทรายแก้ว (M383) - อายุ 66 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M383',
  'นาง',
  'บานเย็น', 
  'ทรายแก้ว', 
  66,
  '103',
  '12',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 103 หมู่ 12 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M383',
  id,
  15000,
  1.00,
  '2556-09-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 383 | ต้นเงิน: 15,000 | ดอกเบี้ย: 17,850 | รวม: 32,850'
FROM members WHERE member_code = 'M383'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 232. นาย วาสน์ ท้าวสิริ (M386) - อายุ 63 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M386',
  'นาย',
  'วาสน์', 
  'ท้าวสิริ', 
  63,
  '11',
  '12',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 11 หมู่ 12 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M386',
  id,
  32000,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 386 | ต้นเงิน: 32,000 | ดอกเบี้ย: 24,640 | รวม: 56,640'
FROM members WHERE member_code = 'M386'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 233. นาย จั๋น ตะพรหม (M565) - อายุ 69 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M565',
  'นาย',
  'จั๋น', 
  'ตะพรหม', 
  69,
  '128',
  '12',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 128 หมู่ 12 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M565',
  id,
  10000,
  1.00,
  '2558-05-14',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 565 | ต้นเงิน: 10,000 | ดอกเบี้ย: 9,900 | รวม: 19,900'
FROM members WHERE member_code = 'M565'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 234. นาง อรทัย แจ้งสว่าง (M568)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M568',
  'นาง',
  'อรทัย', 
  'แจ้งสว่าง', 
  NULL,
  '34',
  '12',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 34 หมู่ 12 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M568',
  id,
  25000,
  1.00,
  '2558-05-15',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 568 | ต้นเงิน: 25,000 | ดอกเบี้ย: 24,750 | รวม: 49,750'
FROM members WHERE member_code = 'M568'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 235. นาง ดารารัตน์ จอมวุฒิ (M571) - อายุ 54 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M571',
  'นาง',
  'ดารารัตน์', 
  'จอมวุฒิ', 
  54,
  '163',
  '12',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 163 หมู่ 12 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M571',
  id,
  27000,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 571 | ต้นเงิน: 27,000 | ดอกเบี้ย: 20,790 | รวม: 47,790'
FROM members WHERE member_code = 'M571'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 236. น.ส. สกายรินทร์ อินต๊ะวงค์ (M575) - อายุ 34 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M575',
  'น.ส.',
  'สกายรินทร์', 
  'อินต๊ะวงค์', 
  34,
  '142',
  '12',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 142 หมู่ 12 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M575',
  id,
  30000,
  1.00,
  '2561-04-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 575 | ต้นเงิน: 30,000 | ดอกเบี้ย: 19,200 | รวม: 49,200'
FROM members WHERE member_code = 'M575'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 237. นาย รัฐศาสตร์ ท้าวสิริ (M656) - อายุ 40 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M656',
  'นาย',
  'รัฐศาสตร์', 
  'ท้าวสิริ', 
  40,
  '126',
  '12',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 126 หมู่ 12 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M656',
  id,
  18000,
  1.00,
  '2558-05-18',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 656 | ต้นเงิน: 18,000 | ดอกเบี้ย: 17,820 | รวม: 35,820'
FROM members WHERE member_code = 'M656'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 238. นาง สมพร ตะพรหม (M574)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M574',
  'นาง',
  'สมพร', 
  'ตะพรหม', 
  NULL,
  '',
  '12',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่  หมู่ 12 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M574',
  id,
  30000,
  1.00,
  '2558-05-18',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 574 | ต้นเงิน: 30,000 | ดอกเบี้ย: 29,400 | รวม: 59,400'
FROM members WHERE member_code = 'M574'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 239. นาง จำเนียร คำราชา (M566)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M566',
  'นาง',
  'จำเนียร', 
  'คำราชา', 
  NULL,
  '',
  '12',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่  หมู่ 12 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M566',
  id,
  30000,
  1.00,
  '2558-05-28',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 566 | ต้นเงิน: 30,000 | ดอกเบี้ย: 29,400 | รวม: 59,400'
FROM members WHERE member_code = 'M566'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 240. นาง บุญชุม หมื่นขัติย์ (M249) - อายุ 54 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M249',
  'นาง',
  'บุญชุม', 
  'หมื่นขัติย์', 
  54,
  '69',
  '13',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 69 หมู่ 13 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M249',
  id,
  15000,
  1.00,
  '2559-04-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 249 | ต้นเงิน: 15,000 | ดอกเบี้ย: 13,200 | รวม: 28,200'
FROM members WHERE member_code = 'M249'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 241. นาง จันทร์ทอน ขันธะสีลา (M254)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M254',
  'นาง',
  'จันทร์ทอน', 
  'ขันธะสีลา', 
  NULL,
  '38',
  '13',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 38 หมู่ 13 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M254',
  id,
  20000,
  1.00,
  '2559-04-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 254 | ต้นเงิน: 20,000 | ดอกเบี้ย: 17,600 | รวม: 37,600'
FROM members WHERE member_code = 'M254'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 242. นาง อำไพ ขุนมิน (M256) - อายุ 50 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M256',
  'นาง',
  'อำไพ', 
  'ขุนมิน', 
  50,
  '74',
  '13',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 74 หมู่ 13 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M256',
  id,
  20000,
  1.00,
  '2560-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 256 | ต้นเงิน: 20,000 | ดอกเบี้ย: 15,400 | รวม: 35,400'
FROM members WHERE member_code = 'M256'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 243. นาง วนิดา หายโศรก (M273) - อายุ 36 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M273',
  'นาง',
  'วนิดา', 
  'หายโศรก', 
  36,
  '47',
  '13',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 47 หมู่ 13 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M273',
  id,
  17173,
  1.00,
  '2557-03-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 273 | ต้นเงิน: 17,173 | ดอกเบี้ย: 19,405.49 | รวม: 36,578.49'
FROM members WHERE member_code = 'M273'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 244. นาย แดง ศรีสด (M275) - อายุ 45 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M275',
  'นาย',
  'แดง', 
  'ศรีสด', 
  45,
  '139',
  '13',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 139 หมู่ 13 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M275',
  id,
  30000,
  1.00,
  '2560-04-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 275 | ต้นเงิน: 30,000 | ดอกเบี้ย: 22,800 | รวม: 52,800'
FROM members WHERE member_code = 'M275'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 245. นาง บุญเจือ ชัยธิ (M420)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M420',
  'นาง',
  'บุญเจือ', 
  'ชัยธิ', 
  NULL,
  '78',
  '13',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 78 หมู่ 13 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M420',
  id,
  20000,
  1.00,
  '2558-05-20',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 420 | ต้นเงิน: 20,000 | ดอกเบี้ย: 19,800 | รวม: 39,800'
FROM members WHERE member_code = 'M420'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 246. นาย มูล ศรีสด (M674) - อายุ 72 ปี
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M674',
  'นาย',
  'มูล', 
  'ศรีสด', 
  72,
  '',
  '13',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่  หมู่ 13 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M674',
  id,
  9000,
  1.00,
  '2560-04-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 674 | ต้นเงิน: 9,000 | ดอกเบี้ย: 6,840 | รวม: 15,840'
FROM members WHERE member_code = 'M674'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 247. นาย อธิวัฒน์ วงศ์ภักดี (M702)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M702',
  'นาย',
  'อธิวัฒน์', 
  'วงศ์ภักดี', 
  NULL,
  '',
  '13',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่  หมู่ 13 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M702',
  id,
  20000,
  1.00,
  '2560-04-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 702 | ต้นเงิน: 20,000 | ดอกเบี้ย: 15,200 | รวม: 35,200'
FROM members WHERE member_code = 'M702'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 248. น.ส. พวงพยอม บุญสิน (M703)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M703',
  'น.ส.',
  'พวงพยอม', 
  'บุญสิน', 
  NULL,
  '137',
  '13',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 137 หมู่ 13 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M703',
  id,
  20000,
  1.00,
  '2560-04-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 703 | ต้นเงิน: 20,000 | ดอกเบี้ย: 15,200 | รวม: 35,200'
FROM members WHERE member_code = 'M703'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 249. น.ส. อุษณีย์ บุญสิน (M704)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M704',
  'น.ส.',
  'อุษณีย์', 
  'บุญสิน', 
  NULL,
  '137',
  '13',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 137 หมู่ 13 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M704',
  id,
  20000,
  1.00,
  '2560-04-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 704 | ต้นเงิน: 20,000 | ดอกเบี้ย: 15,200 | รวม: 35,200'
FROM members WHERE member_code = 'M704'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 250. นาง พอ สมชื่อ (M419)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M419',
  'นาง',
  'พอ', 
  'สมชื่อ', 
  NULL,
  '',
  '13',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่  หมู่ 13 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M419',
  id,
  30000,
  1.00,
  '2558-05-28',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 419 | ต้นเงิน: 30,000 | ดอกเบี้ย: 29,400 | รวม: 59,400'
FROM members WHERE member_code = 'M419'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 251. นาง ฐานิตา บัวรัตนกุล (M329)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M329',
  'นาง',
  'ฐานิตา', 
  'บัวรัตนกุล', 
  NULL,
  '36',
  '14',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 36 หมู่ 14 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M329',
  id,
  55000,
  1.00,
  '2555-11-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 329 | ต้นเงิน: 55,000 | ดอกเบี้ย: 70,950 | รวม: 125,950'
FROM members WHERE member_code = 'M329'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 252. นาง อินจันทร์ ชัยธิ (M348)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M348',
  'นาง',
  'อินจันทร์', 
  'ชัยธิ', 
  NULL,
  '62',
  '14',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 62 หมู่ 14 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M348',
  id,
  68500,
  1.00,
  '2560-07-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 348 | ต้นเงิน: 68,500 | ดอกเบี้ย: 50,005 | รวม: 118,505'
FROM members WHERE member_code = 'M348'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 253. นาง ประเทียบ บัวเย็น (M355)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M355',
  'นาง',
  'ประเทียบ', 
  'บัวเย็น', 
  NULL,
  '192',
  '14',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 192 หมู่ 14 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M355',
  id,
  25000,
  1.00,
  '2560-08-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 355 | ต้นเงิน: 25,000 | ดอกเบี้ย: 18,000 | รวม: 43,000'
FROM members WHERE member_code = 'M355'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 254. นาง ชุทัน หัวนา (M362)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M362',
  'นาง',
  'ชุทัน', 
  'หัวนา', 
  NULL,
  '158',
  '14',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 158 หมู่ 14 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M362',
  id,
  54091,
  1.00,
  '2561-05-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 362 | ต้นเงิน: 54,091 | ดอกเบี้ย: 34,077.33 | รวม: 88,168.33'
FROM members WHERE member_code = 'M362'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 255. นาง สุพิน คันวงศ์ (M367)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M367',
  'นาง',
  'สุพิน', 
  'คันวงศ์', 
  NULL,
  '36',
  '14',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 36 หมู่ 14 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M367',
  id,
  50000,
  1.00,
  '2558-05-10',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 367 | ต้นเงิน: 50,000 | ดอกเบี้ย: 49,500 | รวม: 99,500'
FROM members WHERE member_code = 'M367'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 256. น.ส. พูนทรัพย์ ปินตา (M471)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M471',
  'น.ส.',
  'พูนทรัพย์', 
  'ปินตา', 
  NULL,
  '208',
  '14',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 208 หมู่ 14 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M471',
  id,
  20000,
  1.00,
  '2558-05-11',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 471 | ต้นเงิน: 20,000 | ดอกเบี้ย: 19,800 | รวม: 39,800'
FROM members WHERE member_code = 'M471'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 257. นาย อัธยา บัวเย็น (M531)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M531',
  'นาย',
  'อัธยา', 
  'บัวเย็น', 
  NULL,
  '192',
  '14',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 192 หมู่ 14 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M531',
  id,
  30000,
  1.00,
  '2558-05-12',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 531 | ต้นเงิน: 30,000 | ดอกเบี้ย: 29,700 | รวม: 59,700'
FROM members WHERE member_code = 'M531'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 258. นาย อดุลย์ กาคำ (M541)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M541',
  'นาย',
  'อดุลย์', 
  'กาคำ', 
  NULL,
  '92',
  '14',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 92 หมู่ 14 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M541',
  id,
  40000,
  1.00,
  '2560-07-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 541 | ต้นเงิน: 40,000 | ดอกเบี้ย: 29,200 | รวม: 69,200'
FROM members WHERE member_code = 'M541'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 259. นาง ประนอม กันวงค์ (M564)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M564',
  'นาง',
  'ประนอม', 
  'กันวงค์', 
  NULL,
  '96',
  '14',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 96 หมู่ 14 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M564',
  id,
  40000,
  1.00,
  '2558-05-14',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 564 | ต้นเงิน: 40,000 | ดอกเบี้ย: 39,600 | รวม: 79,600'
FROM members WHERE member_code = 'M564'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- 260. นาย ปราการ ชัยธิ (M660)
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  'M660',
  'นาย',
  'ปราการ', 
  'ชัยธิ', 
  NULL,
  '238',
  '14',
  'บ้านทุ่งเย็น',
  'แม่ลาว',
  'เชียงคำ',
  'พะเยา',
  'บ้านเลขที่ 238 หมู่ 14 บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  'LC2024-M660',
  id,
  17485,
  1.00,
  '2560-07-01',
  12,
  'active',
  'Import จาก Excel - ทะเบียน 660 | ต้นเงิน: 17,485 | ดอกเบี้ย: 12,764.05 | รวม: 30,249.05'
FROM members WHERE member_code = 'M660'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();

-- ========================================
-- ตรวจสอบผลลัพธ์
-- ========================================
SELECT 
  COUNT(*) as total_members,
  COUNT(CASE WHEN status = 'active' THEN 1 END) as active_members
FROM members WHERE member_code LIKE 'M%';

SELECT 
  COUNT(*) as total_contracts,
  SUM(principal_amount) as total_principal,
  COUNT(CASE WHEN status = 'active' THEN 1 END) as active_contracts
FROM loan_contracts WHERE contract_no LIKE 'LC2024-M%';

-- แสดงข้อมูลสมาชิกและสัญญา (พร้อมที่อยู่แบบแยก field)
SELECT 
  m.member_code,
  m.first_name,
  m.last_name,
  m.age,
  m.house_no,
  m.moo,
  m.village,
  m.tambon,
  m.amphoe,
  m.province,
  c.contract_no,
  c.principal_amount,
  c.loan_period_months,
  c.start_date
FROM members m
LEFT JOIN loan_contracts c ON m.id = c.member_id
WHERE m.member_code LIKE 'M%'
ORDER BY m.member_code;
