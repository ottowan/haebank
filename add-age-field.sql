-- เพิ่ม field age ในตาราง members
ALTER TABLE members ADD COLUMN IF NOT EXISTS age INTEGER;

-- เพิ่ม comment อธิบาย field
COMMENT ON COLUMN members.age IS 'อายุของสมาชิก (ปี)';
