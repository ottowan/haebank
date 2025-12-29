import XLSX from 'xlsx';
import { createClient } from '@supabase/supabase-js';
import 'dotenv/config';

// ตั้งค่า Supabase - ใช้ Service Role Key เพื่อข้าม RLS
const supabaseUrl = process.env.VITE_SUPABASE_URL;
// ลองใช้ VITE_SUPABASE_SERVICE_ROLE_KEY ถ้ามี ไม่งั้นใช้ ANON_KEY
const supabaseKey = process.env.VITE_SUPABASE_SERVICE_ROLE_KEY || process.env.VITE_SUPABASE_ANON_KEY;

console.log('🔑 Using Supabase URL:', supabaseUrl);
console.log('🔑 Using Key type:', process.env.VITE_SUPABASE_SERVICE_ROLE_KEY ? 'Service Role' : 'Anon Key');

const supabase = createClient(supabaseUrl, supabaseKey, {
    auth: {
        autoRefreshToken: false,
        persistSession: false
    }
});

// อ่านไฟล์ Excel
const workbook = XLSX.readFile('source.xlsx');
const sheetName = workbook.SheetNames[0];
const worksheet = workbook.Sheets[sheetName];
const data = XLSX.utils.sheet_to_json(worksheet);

// กรองเฉพาะข้อมูลที่มีเลขทะเบียน (ข้ามแถว header)
const validData = data.filter(row =>
    row.__EMPTY &&
    typeof row.__EMPTY === 'number' &&
    row.__EMPTY > 100 // เลขทะเบียนเริ่มต้นที่ 320
);

console.log(`พบข้อมูลที่ถูกต้อง ${validData.length} รายการ\n`);

// ฟังก์ชันแยกชื่อ-นามสกุล
function splitName(fullName) {
    if (!fullName) return { firstName: '', lastName: '' };

    const parts = fullName.trim().split(' ');
    if (parts.length === 1) {
        return { firstName: parts[0], lastName: '' };
    }

    // ลบคำนำหน้า (นาย, นาง, น.ส.)
    const prefix = parts[0];
    const nameWithoutPrefix = parts.slice(1).join(' ');
    const nameParts = nameWithoutPrefix.split(' ');

    return {
        firstName: nameParts[0] || '',
        lastName: nameParts.slice(1).join(' ') || ''
    };
}

// ฟังก์ชันแปลงวันที่จาก Excel Serial Number
function excelDateToJSDate(serial) {
    if (!serial || typeof serial !== 'number') return null;

    // Excel serial date เริ่มจาก 1900-01-01
    const utc_days = Math.floor(serial - 25569);
    const utc_value = utc_days * 86400;
    const date_info = new Date(utc_value * 1000);

    return date_info.toISOString().split('T')[0];
}

// Import ข้อมูล
async function importData() {
    let successCount = 0;
    let errorCount = 0;

    for (const row of validData) {
        try {
            const memberCode = `M${String(row.__EMPTY).padStart(3, '0')}`;
            const { firstName, lastName } = splitName(row.__EMPTY_1);
            const houseNo = row.__EMPTY_3 || '';
            const moo = row.__EMPTY_4 || '';
            const address = `บ้านเลขที่ ${houseNo} หมู่ ${moo} บ้านทุ่งเย็น ตำบลแม่ลาว อำเภอเชียงคำ จังหวัดพะเยา`;

            // 1. สร้างสมาชิก
            const { data: member, error: memberError } = await supabase
                .from('members')
                .upsert({
                    member_code: memberCode,
                    first_name: firstName,
                    last_name: lastName,
                    address: address,
                    status: 'active'
                }, {
                    onConflict: 'member_code',
                    ignoreDuplicates: false
                })
                .select()
                .single();

            if (memberError) {
                console.error(`❌ Error creating member ${memberCode}:`, memberError.message);
                errorCount++;
                continue;
            }

            // 2. สร้างสัญญาเงินกู้
            const principalAmount = row.__EMPTY_6 || 0;
            const totalInterest = row.__EMPTY_7 || 0;
            const startDate = excelDateToJSDate(row.__EMPTY_5) || new Date().toISOString().split('T')[0];

            // คำนวณระยะเวลากู้จากดอกเบี้ย (ดอกเบี้ย = เงินต้น × 0.01 × เดือน)
            const monthlyInterest = principalAmount * 0.01;
            const loanPeriodMonths = monthlyInterest > 0 ? Math.round(totalInterest / monthlyInterest) : 12;

            const contractNo = `LC${new Date().getFullYear()}-${memberCode}`;

            const { data: contract, error: contractError } = await supabase
                .from('loan_contracts')
                .upsert({
                    contract_no: contractNo,
                    member_id: member.id,
                    principal_amount: principalAmount,
                    interest_rate: 1.00,
                    start_date: startDate,
                    loan_period_months: loanPeriodMonths,
                    status: 'active',
                    note: `Import จาก Excel - ทะเบียน ${row.__EMPTY}`
                }, {
                    onConflict: 'contract_no',
                    ignoreDuplicates: false
                })
                .select()
                .single();

            if (contractError) {
                console.error(`❌ Error creating contract ${contractNo}:`, contractError.message);
                errorCount++;
                continue;
            }

            console.log(`✅ Import สำเร็จ: ${memberCode} - ${firstName} ${lastName} (${principalAmount.toLocaleString()} บาท)`);
            successCount++;

        } catch (error) {
            console.error(`❌ Error processing row:`, error.message);
            errorCount++;
        }
    }

    console.log(`\n=== สรุปผลการ Import ===`);
    console.log(`✅ สำเร็จ: ${successCount} รายการ`);
    console.log(`❌ ล้มเหลว: ${errorCount} รายการ`);
    console.log(`📊 รวมทั้งหมด: ${validData.length} รายการ`);
}

// รัน import
importData()
    .then(() => {
        console.log('\n🎉 Import เสร็จสมบูรณ์!');
        process.exit(0);
    })
    .catch(error => {
        console.error('\n❌ เกิดข้อผิดพลาด:', error);
        process.exit(1);
    });
