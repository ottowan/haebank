/**
 * แปลงตัวเลขเป็นรูปแบบเงินบาท
 * @param {number} amount - จำนวนเงิน
 * @param {boolean} showCurrency - แสดงสัญลักษณ์สกุลเงินหรือไม่
 * @returns {string}
 */
export function formatCurrency(amount, showCurrency = true) {
    if (amount === null || amount === undefined) return '-'

    const formatted = new Intl.NumberFormat('th-TH', {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    }).format(amount)

    return showCurrency ? `฿${formatted}` : formatted
}

/**
 * แปลงตัวเลขเป็นรูปแบบที่มีคอมม่า
 * @param {number} number - ตัวเลข
 * @returns {string}
 */
export function formatNumber(number) {
    if (number === null || number === undefined) return '-'

    return new Intl.NumberFormat('th-TH').format(number)
}

/**
 * แปลงสถานะเป็นข้อความภาษาไทย
 * @param {string} status - สถานะ
 * @returns {string}
 */
export function getStatusText(status) {
    const statusMap = {
        active: 'ใช้งาน',
        inactive: 'ไม่ใช้งาน',
        closed: 'ปิดแล้ว',
        overdue: 'เกินกำหนด'
    }
    return statusMap[status] || status
}

/**
 * แปลงประเภทการชำระเงินเป็นข้อความภาษาไทย
 * @param {string} type - ประเภท
 * @returns {string}
 */
export function getPaymentTypeText(type) {
    const typeMap = {
        installment: 'รายงวด',
        partial: 'ชำระบางส่วน',
        close: 'ปิดยอด'
    }
    return typeMap[type] || type
}

/**
 * แปลงสถานะเป็นสี
 * @param {string} status - สถานะ
 * @returns {string} ชื่อสี Chakra UI
 */
export function getStatusColor(status) {
    const colorMap = {
        active: 'green',
        inactive: 'gray',
        closed: 'blue',
        overdue: 'red'
    }
    return colorMap[status] || 'gray'
}

/**
 * ตรวจสอบความถูกต้องของเลขบัตรประชาชน
 * @param {string} idCard - เลขบัตรประชาชน
 * @returns {boolean}
 */
export function validateThaiID(idCard) {
    if (!idCard || idCard.length !== 13) return false

    let sum = 0
    for (let i = 0; i < 12; i++) {
        sum += parseInt(idCard.charAt(i)) * (13 - i)
    }

    const mod = sum % 11
    const checkDigit = (11 - mod) % 10

    return checkDigit === parseInt(idCard.charAt(12))
}

/**
 * ตรวจสอบความถูกต้องของเบอร์โทรศัพท์
 * @param {string} phone - เบอร์โทรศัพท์
 * @returns {boolean}
 */
export function validatePhone(phone) {
    if (!phone) return false
    const phoneRegex = /^0[0-9]{1,2}-?[0-9]{3,4}-?[0-9]{4}$/
    return phoneRegex.test(phone)
}
