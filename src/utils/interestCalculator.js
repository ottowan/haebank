/**
 * คำนวณดอกเบี้ยและยอดคงเหลือของสัญญาเงินกู้
 * 
 * @param {number} principalAmount - เงินต้น
 * @param {number} interestRate - อัตราดอกเบี้ยต่อเดือน (%)
 * @param {Date|string} startDate - วันที่เริ่มสัญญา
 * @param {number} loanPeriodMonths - ระยะเวลากู้ (เดือน)
 * @param {number} totalPaid - ยอดที่ชำระแล้ว
 * @returns {Object} ข้อมูลการคำนวณ
 */
export function calculateLoanDetails(
    principalAmount,
    interestRate,
    startDate,
    loanPeriodMonths,
    totalPaid = 0
) {
    const principal = parseFloat(principalAmount) || 0
    const rate = parseFloat(interestRate) || 1.0
    const paid = parseFloat(totalPaid) || 0

    // คำนวณจำนวนเดือนที่ผ่านไป
    const start = new Date(startDate)
    const now = new Date()
    const monthsElapsed = Math.max(
        0,
        (now.getFullYear() - start.getFullYear()) * 12 +
        (now.getMonth() - start.getMonth())
    )

    // คำนวณดอกเบี้ยต่อเดือน
    const monthlyInterest = principal * (rate / 100)

    // คำนวณดอกเบี้ยสะสม (ตามจำนวนเดือนจริง ไม่จำกัด)
    const accumulatedInterest = monthlyInterest * monthsElapsed

    // คำนวณยอดรวมที่ต้องชำระ
    const totalAmount = principal + accumulatedInterest

    // คำนวณยอดคงเหลือ
    const balance = totalAmount - paid

    // คำนวณวันที่สิ้นสุดสัญญา
    const endDate = new Date(start)
    endDate.setMonth(endDate.getMonth() + loanPeriodMonths)

    return {
        principalAmount: principal,
        monthlyInterest: parseFloat(monthlyInterest.toFixed(2)),
        monthsElapsed,
        accumulatedInterest: parseFloat(accumulatedInterest.toFixed(2)),
        totalAmount: parseFloat(totalAmount.toFixed(2)),
        totalPaid: paid,
        balance: parseFloat(balance.toFixed(2)),
        endDate,
        isOverdue: now > endDate && balance > 0,
        isPaidOff: balance <= 0
    }
}

/**
 * คำนวณยอดชำระแนะนำต่องวด
 * 
 * @param {number} principalAmount - เงินต้น
 * @param {number} interestRate - อัตราดอกเบี้ยต่อเดือน (%)
 * @param {number} loanPeriodMonths - ระยะเวลากู้ (เดือน)
 * @returns {number} ยอดชำระแนะนำต่องวด
 */
export function calculateInstallmentAmount(
    principalAmount,
    interestRate,
    loanPeriodMonths
) {
    const principal = parseFloat(principalAmount) || 0
    const rate = parseFloat(interestRate) || 1.0
    const months = parseInt(loanPeriodMonths) || 1

    // คำนวณดอกเบี้ยรวมทั้งหมด
    const totalInterest = principal * (rate / 100) * months

    // คำนวณยอดรวมทั้งหมด
    const totalAmount = principal + totalInterest

    // แบ่งเป็นรายงวด
    const installment = totalAmount / months

    return parseFloat(installment.toFixed(2))
}

/**
 * ตรวจสอบว่าสัญญาใกล้ครบกำหนดหรือไม่
 * 
 * @param {Date|string} endDate - วันที่สิ้นสุดสัญญา
 * @param {number} daysThreshold - จำนวนวันที่ถือว่าใกล้ครบกำหนด (default: 30)
 * @returns {boolean}
 */
export function isNearDueDate(endDate, daysThreshold = 30) {
    const end = new Date(endDate)
    const now = new Date()
    const diffTime = end - now
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24))

    return diffDays >= 0 && diffDays <= daysThreshold
}

/**
 * คำนวณเปอร์เซ็นต์การชำระเงิน
 * 
 * @param {number} totalPaid - ยอดที่ชำระแล้ว
 * @param {number} totalAmount - ยอดรวมทั้งหมด
 * @returns {number} เปอร์เซ็นต์ (0-100)
 */
export function calculatePaymentProgress(totalPaid, totalAmount) {
    if (totalAmount === 0) return 0
    const progress = (totalPaid / totalAmount) * 100
    return Math.min(100, parseFloat(progress.toFixed(2)))
}
