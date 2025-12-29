import XLSX from 'xlsx';

// อ่านไฟล์ Excel
const workbook = XLSX.readFile('source.xlsx');
const sheetNames = workbook.SheetNames;

console.log(`Found ${sheetNames.length} sheets: ${sheetNames.join(', ')}\n`);

sheetNames.forEach((name, index) => {
    console.log(`\n--- Sheet ${index + 1}: ${name} ---`);
    const worksheet = workbook.Sheets[name];
    const data = XLSX.utils.sheet_to_json(worksheet, { header: 1 }); // Read as array of arrays to see raw structure

    // Show first 5 non-empty rows
    const preview = data.filter(row => row.length > 0).slice(0, 5);
    console.log(JSON.stringify(preview, null, 2));
});
