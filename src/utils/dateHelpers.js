import { format, parseISO, formatDistance, addMonths } from 'date-fns'
import { th } from 'date-fns/locale'

/**
 * แปลงวันที่เป็นรูปแบบไทย
 * @param {Date|string} date - วันที่
 * @param {string} formatStr - รูปแบบ (default: 'dd/MM/yyyy')
 * @returns {string}
 */
export function formatThaiDate(date, formatStr = 'dd/MM/yyyy') {
    if (!date) return '-'
    try {
        const dateObj = typeof date === 'string' ? parseISO(date) : date
        return format(dateObj, formatStr, { locale: th })
    } catch (error) {
        return '-'
    }
}

/**
 * แปลงวันที่เป็นรูปแบบแสดงผล
 * @param {Date|string} date - วันที่
 * @returns {string}
 */
export function formatDisplayDate(date) {
    return formatThaiDate(date, 'd MMMM yyyy')
}

/**
 * คำนวณระยะเวลาจากวันที่ปัจจุบัน
 * @param {Date|string} date - วันที่
 * @returns {string}
 */
export function getRelativeTime(date) {
    if (!date) return '-'
    try {
        const dateObj = typeof date === 'string' ? parseISO(date) : date
        return formatDistance(dateObj, new Date(), { addSuffix: true, locale: th })
    } catch (error) {
        return '-'
    }
}

/**
 * คำนวณวันที่สิ้นสุดสัญญา
 * @param {Date|string} startDate - วันที่เริ่มสัญญา
 * @param {number} months - จำนวนเดือน
 * @returns {Date}
 */
export function calculateEndDate(startDate, months) {
    const start = typeof startDate === 'string' ? parseISO(startDate) : startDate
    return addMonths(start, months)
}

/**
 * ตรวจสอบว่าวันที่ผ่านมาแล้วหรือไม่
 * @param {Date|string} date - วันที่
 * @returns {boolean}
 */
export function isPastDate(date) {
    if (!date) return false
    const dateObj = typeof date === 'string' ? parseISO(date) : date
    return dateObj < new Date()
}

/**
 * คำนวณจำนวนวันที่เหลือ
 * @param {Date|string} date - วันที่
 * @returns {number}
 */
export function getDaysRemaining(date) {
    if (!date) return 0
    const dateObj = typeof date === 'string' ? parseISO(date) : date
    const now = new Date()
    const diffTime = dateObj - now
    return Math.ceil(diffTime / (1000 * 60 * 60 * 24))
}
