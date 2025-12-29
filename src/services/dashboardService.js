import { supabase } from './supabase'

/**
 * ดึงข้อมูลสรุปสำหรับ Dashboard
 */
export async function getDashboardSummary() {
    const { data, error } = await supabase
        .from('v_dashboard_summary')
        .select('*')
        .single()

    if (error) throw error
    return data
}

/**
 * ดึงข้อมูลสัญญาใกล้ครบกำหนด
 */
export async function getContractsNearDue() {
    const { data, error } = await supabase
        .from('v_contracts_near_due')
        .select('*')
        .limit(10)

    if (error) throw error
    return data
}

/**
 * ดึงข้อมูลการชำระเงินล่าสุด
 */
export async function getRecentPayments(limit = 10) {
    const { data, error } = await supabase
        .from('loan_payments')
        .select(`
      *,
      loan_contracts (
        contract_no,
        members (
          member_code,
          first_name,
          last_name
        )
      )
    `)
        .order('payment_date', { ascending: false })
        .limit(limit)

    if (error) throw error
    return data
}

/**
 * ดึงข้อมูลสัญญาค้างชำระ
 */
export async function getOverdueContracts() {
    const { data, error } = await supabase
        .from('v_contract_balances')
        .select('*')
        .eq('status', 'overdue')
        .order('end_date', { ascending: true })

    if (error) throw error
    return data
}

/**
 * ดึงสถิติรายเดือน
 */
export async function getMonthlyStats() {
    // ดึงข้อมูลการชำระเงินในเดือนนี้
    const now = new Date()
    const firstDayOfMonth = new Date(now.getFullYear(), now.getMonth(), 1)
    const lastDayOfMonth = new Date(now.getFullYear(), now.getMonth() + 1, 0)

    const { data: payments, error: paymentsError } = await supabase
        .from('loan_payments')
        .select('amount')
        .gte('payment_date', firstDayOfMonth.toISOString().split('T')[0])
        .lte('payment_date', lastDayOfMonth.toISOString().split('T')[0])

    if (paymentsError) throw paymentsError

    const totalPayments = payments.reduce((sum, p) => sum + parseFloat(p.amount), 0)

    // ดึงข้อมูลสัญญาใหม่ในเดือนนี้
    const { data: contracts, error: contractsError } = await supabase
        .from('loan_contracts')
        .select('id')
        .gte('created_at', firstDayOfMonth.toISOString())
        .lte('created_at', lastDayOfMonth.toISOString())

    if (contractsError) throw contractsError

    return {
        totalPayments,
        newContracts: contracts.length,
        month: now.toLocaleString('th-TH', { month: 'long', year: 'numeric' })
    }
}
