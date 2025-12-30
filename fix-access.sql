-- ========================================
-- Script แก้ไขสิทธิ์การเข้าถึงข้อมูล (Fix Access / RLS)
-- ========================================

-- 1. แก้ไข Policy ของตาราง members
DROP POLICY IF EXISTS staff_read_members ON members;

CREATE POLICY staff_read_members ON members
  FOR SELECT
  TO authenticated
  USING (true);  -- อนุญาตให้ User ที่ Login แล้วทุกคนสามารถดูข้อมูลได้

-- 2. แก้ไข Policy ของตาราง loan_contracts
DROP POLICY IF EXISTS staff_read_contracts ON loan_contracts;

CREATE POLICY staff_read_contracts ON loan_contracts
  FOR SELECT
  TO authenticated
  USING (true);

-- 3. แก้ไข Policy ของตาราง loan_payments
DROP POLICY IF EXISTS staff_read_payments ON loan_payments;

CREATE POLICY staff_read_payments ON loan_payments
  FOR SELECT
  TO authenticated
  USING (true);

-- 4. ตรวจสอบข้อมูล
SELECT COUNT(*) as member_count FROM members;
