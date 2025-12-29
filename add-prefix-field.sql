-- เพิ่ม field คำนำหน้าชื่อ
ALTER TABLE members ADD COLUMN IF NOT EXISTS title_prefix VARCHAR(20);

-- เพิ่ม comment อธิบาย
COMMENT ON COLUMN members.title_prefix IS 'คำนำหน้าชื่อ (นาย, นาง, นางสาว, น.ส.)';
