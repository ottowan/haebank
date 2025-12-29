-- ========================================
-- ลบข้อมูลตัวอย่างทั้งหมด
-- ========================================

-- ลบข้อมูลตามลำดับ (เพื่อไม่ให้เกิด Foreign Key Constraint Error)

-- 1. ลบการชำระเงินทั้งหมด
DELETE FROM loan_payments;

-- 2. ลบสัญญาเงินกู้ทั้งหมด
DELETE FROM loan_contracts;

-- 3. ลบสมาชิกทั้งหมด
DELETE FROM members;

-- หมายเหตุ: Supabase จะจัดการ Auto Increment (sequence) อัตโนมัติ
-- ไม่จำเป็นต้อง reset sequence manually

-- ตรวจสอบว่าลบหมดแล้ว
SELECT 
  (SELECT COUNT(*) FROM members) as members_count,
  (SELECT COUNT(*) FROM loan_contracts) as contracts_count,
  (SELECT COUNT(*) FROM loan_payments) as payments_count;
