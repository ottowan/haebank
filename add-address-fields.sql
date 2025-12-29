-- แยก field ที่อยู่ให้ละเอียดขึ้น
ALTER TABLE members ADD COLUMN IF NOT EXISTS house_no VARCHAR(20);
ALTER TABLE members ADD COLUMN IF NOT EXISTS moo VARCHAR(10);
ALTER TABLE members ADD COLUMN IF NOT EXISTS village VARCHAR(100);
ALTER TABLE members ADD COLUMN IF NOT EXISTS tambon VARCHAR(100);
ALTER TABLE members ADD COLUMN IF NOT EXISTS amphoe VARCHAR(100);
ALTER TABLE members ADD COLUMN IF NOT EXISTS province VARCHAR(100);

-- เพิ่ม comment อธิบาย
COMMENT ON COLUMN members.house_no IS 'บ้านเลขที่';
COMMENT ON COLUMN members.moo IS 'หมู่ที่';
COMMENT ON COLUMN members.village IS 'ชื่อหมู่บ้าน';
COMMENT ON COLUMN members.tambon IS 'ตำบล';
COMMENT ON COLUMN members.amphoe IS 'อำเภอ';
COMMENT ON COLUMN members.province IS 'จังหวัด';

-- ตั้งค่าเริ่มต้นสำหรับข้อมูลที่มีอยู่แล้ว
UPDATE members 
SET 
  village = 'บ้านทุ่งเย็น',
  tambon = 'แม่ลาว',
  amphoe = 'เชียงคำ',
  province = 'พะเยา'
WHERE village IS NULL;
