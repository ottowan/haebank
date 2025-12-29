import XLSX from 'xlsx';
import fs from 'fs';

// อ่านไฟล์ Excel
const workbook = XLSX.readFile('source/source.xlsx');
const sheetName = workbook.SheetNames[0];
const worksheet = workbook.Sheets[sheetName];
const data = XLSX.utils.sheet_to_json(worksheet);

// กรองเฉพาะข้อมูลที่มีเลขทะเบียน
const validData = data.filter(row =>
  row.__EMPTY &&
  typeof row.__EMPTY === 'number' &&
  row.__EMPTY > 100
);

console.log(`พบข้อมูลที่ถูกต้อง ${validData.length} รายการ\n`);

// ฟังก์ชันแยกคำนำหน้า ชื่อ-นามสกุล
function splitName(fullName) {
  if (!fullName) return { prefix: '', firstName: '', lastName: '' };

  const trimmed = fullName.trim();
  if (!trimmed) return { prefix: '', firstName: '', lastName: '' };

  // รายการคำนำหน้าที่รู้จัก
  const prefixes = ['นาย', 'นาง', 'นางสาว', 'น.ส.', 'ด.ช.', 'ด.ญ.', 'Mr.', 'Mrs.', 'Miss', 'Ms.'];

  let prefix = '';
  let remaining = trimmed;

  // ตรวจสอบว่าขึ้นต้นด้วยคำนำหน้าหรือไม่ (ไม่ว่าจะมีช่องว่างหรือไม่)
  for (const p of prefixes) {
    if (trimmed.startsWith(p)) {
      prefix = p;
      remaining = trimmed.substring(p.length).trim();
      break;
    }
  }

  // แยกชื่อและนามสกุลจากส่วนที่เหลือ
  const parts = remaining.split(/\s+/);

  let firstName = '';
  let lastName = '';

  if (parts.length === 0 || (parts.length === 1 && parts[0] === '')) {
    // ไม่มีชื่อ
    firstName = '';
    lastName = '';
  } else if (parts.length === 1) {
    // มีแค่ชื่อ
    firstName = parts[0];
  } else {
    // มีชื่อและนามสกุล
    firstName = parts[0];
    lastName = parts.slice(1).join(' ');
  }

  return { prefix, firstName, lastName };
}

// ฟังก์ชันแปลงวันที่จาก Excel Serial Number
function excelDateToJSDate(serial) {
  if (!serial || typeof serial !== 'number') return null;

  const utc_days = Math.floor(serial - 25569);
  const utc_value = utc_days * 86400;
  const date_info = new Date(utc_value * 1000);

  return date_info.toISOString().split('T')[0];
}

// ฟังก์ชัน escape string สำหรับ SQL
function escapeSql(str) {
  if (!str) return '';
  return str.replace(/'/g, "''");
}

// สร้าง SQL Script
let sql = `-- ========================================
-- Import ข้อมูลจาก source.xlsx
-- สร้างเมื่อ: ${new Date().toLocaleString('th-TH')}
-- จำนวนรายการ: ${validData.length}
-- ========================================

-- ลบข้อมูลตัวอย่างเดิม (ถ้ามี)
DELETE FROM loan_payments WHERE contract_id IN (
  SELECT id FROM loan_contracts WHERE contract_no LIKE 'LC%'
);
DELETE FROM loan_contracts WHERE contract_no LIKE 'LC%';
DELETE FROM members WHERE member_code LIKE 'M%';

-- Insert ข้อมูลสมาชิกและสัญญา
`;

validData.forEach((row, index) => {
  const memberCode = `M${String(row.__EMPTY).padStart(3, '0')}`;
  const { prefix, firstName, lastName } = splitName(row.__EMPTY_1);
  const houseNo = row.__EMPTY_3 || '';
  const moo = row.__EMPTY_4 || '';

  // จัดการอายุ - ถ้าเป็นข้อความหรือค่าพิเศษให้เป็น null
  let age = row.__EMPTY_2;
  if (typeof age === 'string' || age === 'ตาย' || isNaN(age)) {
    age = null;
  }

  // ข้อมูลที่อยู่แบบแยก field
  const village = 'บ้านทุ่งเย็น';
  const tambon = 'แม่ลาว';
  const amphoe = 'เชียงคำ';
  const province = 'พะเยา';

  // ที่อยู่แบบเต็ม (สำหรับ field address เดิม)
  const fullAddress = `บ้านเลขที่ ${houseNo} หมู่ ${moo} ${village} ตำบล${tambon} อำเภอ${amphoe} จังหวัด${province}`;

  const principalAmount = row.__EMPTY_6 || 0;
  const totalInterest = row.__EMPTY_7 || 0;
  const totalAmount = row.__EMPTY_8 || 0;
  const startDate = excelDateToJSDate(row.__EMPTY_5) || new Date().toISOString().split('T')[0];

  // สัญญาทุกสัญญามีอายุ 12 เดือน (1 ปี)
  const loanPeriodMonths = 12;

  const contractNo = `LC2024-${memberCode}`;

  sql += `
-- ${index + 1}. ${prefix} ${firstName} ${lastName} (${memberCode})${age ? ` - อายุ ${age} ปี` : ''}
INSERT INTO members (
  member_code, title_prefix, first_name, last_name, age, 
  house_no, moo, village, tambon, amphoe, province,
  address, status
)
VALUES (
  '${memberCode}',
  ${prefix ? `'${escapeSql(prefix)}'` : 'NULL'},
  '${escapeSql(firstName)}', 
  '${escapeSql(lastName)}', 
  ${age || 'NULL'},
  '${houseNo}',
  '${moo}',
  '${village}',
  '${tambon}',
  '${amphoe}',
  '${province}',
  '${escapeSql(fullAddress)}',
  'active'
)
ON CONFLICT (member_code) 
DO UPDATE SET
  title_prefix = EXCLUDED.title_prefix,
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  age = EXCLUDED.age,
  house_no = EXCLUDED.house_no,
  moo = EXCLUDED.moo,
  village = EXCLUDED.village,
  tambon = EXCLUDED.tambon,
  amphoe = EXCLUDED.amphoe,
  province = EXCLUDED.province,
  address = EXCLUDED.address,
  status = EXCLUDED.status,
  updated_at = NOW();

INSERT INTO loan_contracts (contract_no, member_id, principal_amount, interest_rate, start_date, loan_period_months, status, note)
SELECT 
  '${contractNo}',
  id,
  ${principalAmount},
  1.00,
  '${startDate}',
  ${loanPeriodMonths},
  'active',
  'Import จาก Excel - ทะเบียน ${row.__EMPTY} | ต้นเงิน: ${principalAmount.toLocaleString()} | ดอกเบี้ย: ${totalInterest.toLocaleString()} | รวม: ${totalAmount.toLocaleString()}'
FROM members WHERE member_code = '${memberCode}'
ON CONFLICT (contract_no) 
DO UPDATE SET
  principal_amount = EXCLUDED.principal_amount,
  interest_rate = EXCLUDED.interest_rate,
  start_date = EXCLUDED.start_date,
  loan_period_months = EXCLUDED.loan_period_months,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  updated_at = NOW();
`;
});

sql += `
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
`;

// บันทึกไฟล์
fs.writeFileSync('import-data.sql', sql);

console.log('✅ สร้างไฟล์ import-data.sql เรียบร้อยแล้ว');
console.log(`📊 จำนวนสมาชิก: ${validData.length} รายการ`);
console.log(`📊 จำนวนสัญญา: ${validData.length} สัญญา`);
console.log(`📅 อายุสัญญา: 12 เดือน (1 ปี) ทุกสัญญา`);
console.log(`💰 อัตราดอกเบี้ย: 1% ต่อเดือน`);
console.log('\n📍 ข้อมูลที่อยู่แบบแยก field:');
console.log('   - บ้านเลขที่ (house_no)');
console.log('   - หมู่ (moo)');
console.log('   - บ้าน (village)');
console.log('   - ตำบล (tambon)');
console.log('   - อำเภอ (amphoe)');
console.log('   - จังหวัด (province)');
console.log('\n🎯 วิธีใช้งาน:');
console.log('1. รัน add-address-fields.sql ก่อน (เพิ่ม field ใหม่)');
console.log('2. รัน add-age-field.sql (เพิ่ม field อายุ)');
console.log('3. รัน add-prefix-field.sql (เพิ่ม field คำนำหน้า)');
console.log('4. รัน import-data.sql (import ข้อมูล)');
console.log('5. ตรวจสอบผลลัพธ์จากคำสั่ง SELECT ท้ายสุด');
