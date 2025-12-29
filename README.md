# ระบบลูกหนี้เงินกู้ - HAE Bank

ระบบจัดการลูกหนี้เงินกู้แบบครบวงจร พัฒนาด้วย React (Vite) + Chakra UI + Supabase

## วิธีการติดตั้งและรัน

### 1. ติดตั้ง Dependencies

```bash
npm install
```

### 2. ตั้งค่า Environment Variables

สร้างไฟล์ `.env` และกำหนดค่าดังนี้:

```env
VITE_SUPABASE_URL=your_supabase_url_here
VITE_SUPABASE_ANON_KEY=your_supabase_anon_key_here
```

### 3. ตั้งค่าฐานข้อมูล Supabase

1. สร้างโปรเจคใหม่ใน [Supabase](https://supabase.com)
2. ไปที่ SQL Editor
3. รันคำสั่งใน `database.sql`

### 4. รันโปรเจค

```bash
npm run dev
```

เปิดเบราว์เซอร์ที่ `http://localhost:3000`

### 5. Build สำหรับ Production

```bash
npm run build
```

## โครงสร้างโปรเจค

```
haebank/
├── src/
│   ├── components/
│   │   └── layout/
│   │       ├── Layout.jsx
│   │       ├── Navbar.jsx
│   │       └── Sidebar.jsx
│   ├── hooks/
│   │   └── useAuth.js
│   ├── pages/
│   │   ├── LoginPage.jsx
│   │   ├── DashboardPage.jsx
│   │   ├── MembersPage.jsx
│   │   ├── ContractsPage.jsx
│   │   └── PaymentsPage.jsx
│   ├── services/
│   │   ├── supabase.js
│   │   ├── memberService.js
│   │   ├── contractService.js
│   │   ├── paymentService.js
│   │   └── dashboardService.js
│   ├── utils/
│   │   ├── interestCalculator.js
│   │   ├── dateHelpers.js
│   │   └── formatters.js
│   ├── App.jsx
│   └── main.jsx
├── database.sql
├── package.json
├── vite.config.js
└── index.html
```

## ฟีเจอร์หลัก

### 1. Dashboard
- สรุปสัญญาที่ใช้งาน
- ลูกหนี้คงค้าง
- ดอกเบี้ยที่ได้รับ
- สัญญาค้างชำระ
- สัญญาใกล้ครบกำหนด
- การชำระเงินล่าสุด

### 2. จัดการสมาชิก
- แสดงรายชื่อสมาชิก
- ค้นหาสมาชิก
- ดูรายละเอียดสมาชิก

### 3. จัดการสัญญาเงินกู้
- แสดงรายการสัญญา
- ค้นหาสัญญา
- คำนวณดอกเบี้ยอัตโนมัติ
- แสดงยอดคงเหลือ
- แสดงความคืบหน้าการชำระ

### 4. จัดการการชำระเงิน
- บันทึกการชำระเงิน
- แสดงประวัติการชำระ
- กรองตามประเภทการชำระ
- อัปเดตยอดคงเหลืออัตโนมัติ

## การคำนวณดอกเบี้ย

- อัตราดอกเบี้ย: **1% ต่อเดือน** (Simple Interest)
- ดอกเบี้ยต่อเดือน = เงินต้น × 0.01
- ดอกเบี้ยสะสม = ดอกเบี้ยต่อเดือน × จำนวนเดือนที่ผ่านไป
- ยอดคงเหลือ = เงินต้น + ดอกเบี้ยสะสม - ยอดที่ชำระแล้ว

## การ Deploy บน Netlify

1. Push โค้ดไปยัง GitHub
2. เชื่อมต่อ Repository กับ Netlify
3. ตั้งค่า Environment Variables ใน Netlify Dashboard
4. Deploy อัตโนมัติ

## เทคโนโลยีที่ใช้

- **Frontend**: React 18 + Vite
- **UI Framework**: Chakra UI
- **Backend/Database**: Supabase (PostgreSQL)
- **Authentication**: Supabase Auth
- **Deployment**: Netlify
- **Date Library**: date-fns
- **Router**: React Router v6

## License

MIT
