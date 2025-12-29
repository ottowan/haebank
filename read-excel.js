import XLSX from 'xlsx';
import fs from 'fs';

// อ่านไฟล์ Excel
const workbook = XLSX.readFile('source.xlsx');
const sheetName = workbook.SheetNames[0];
const worksheet = workbook.Sheets[sheetName];

// แปลงเป็น JSON
const data = XLSX.utils.sheet_to_json(worksheet);

// แสดงข้อมูล 5 แถวแรก
console.log('จำนวนแถวทั้งหมด:', data.length);
console.log('\nคอลัมน์ที่มี:', Object.keys(data[0] || {}));
console.log('\nข้อมูล 5 แถวแรก:');
console.log(JSON.stringify(data.slice(0, 5), null, 2));

// บันทึกข้อมูลทั้งหมดเป็น JSON
fs.writeFileSync('data-preview.json', JSON.stringify(data, null, 2));
console.log('\n✅ บันทึกข้อมูลทั้งหมดไว้ที่ data-preview.json');
