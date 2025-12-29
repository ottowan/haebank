import { supabase } from './supabase'

/**
 * ดึงข้อมูลการชำระเงินทั้งหมด
 */
export async function getAllPayments() {
    const { data, error } = await supabase
        .from('loan_payments')
        .select(`
      *,
      loan_contracts (
        contract_no,
        member_id,
        members (
          member_code,
          first_name,
          last_name
        )
      )
    `)
        .order('payment_date', { ascending: false })

    if (error) throw error
    return data
}

/**
 * ดึงข้อมูลการชำระเงินตามสัญญา
 */
export async function getPaymentsByContract(contractId) {
    const { data, error } = await supabase
        .from('loan_payments')
        .select('*')
        .eq('contract_id', contractId)
        .order('payment_date', { ascending: false })

    if (error) throw error
    return data
}

/**
 * ดึงข้อมูลการชำระเงินตาม ID
 */
export async function getPaymentById(id) {
    const { data, error } = await supabase
        .from('loan_payments')
        .select(`
      *,
      loan_contracts (
        contract_no,
        member_id,
        members (
          member_code,
          first_name,
          last_name
        )
      )
    `)
        .eq('id', id)
        .single()

    if (error) throw error
    return data
}

/**
 * บันทึกการชำระเงิน
 */
export async function createPayment(paymentData) {
    const { data: { user } } = await supabase.auth.getUser()

    const { data, error } = await supabase
        .from('loan_payments')
        .insert([{
            ...paymentData,
            created_by: user?.id
        }])
        .select()
        .single()

    if (error) throw error
    return data
}

/**
 * อัปเดตข้อมูลการชำระเงิน
 */
export async function updatePayment(id, paymentData) {
    const { data, error } = await supabase
        .from('loan_payments')
        .update(paymentData)
        .eq('id', id)
        .select()
        .single()

    if (error) throw error
    return data
}

/**
 * ลบการชำระเงิน
 */
export async function deletePayment(id) {
    const { data, error } = await supabase
        .from('loan_payments')
        .delete()
        .eq('id', id)

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
        member_id,
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
 * คำนวณยอดรวมการชำระเงินตามสัญญา
 */
export async function getTotalPaidByContract(contractId) {
    const { data, error } = await supabase
        .from('loan_payments')
        .select('amount')
        .eq('contract_id', contractId)

    if (error) throw error

    const total = data.reduce((sum, payment) => sum + parseFloat(payment.amount), 0)
    return total
}
/**
 * ดึงข้อมูลการชำระเงินตามสมาชิก
 */
export async function getPaymentsByMember(memberId) {
    const { data, error } = await supabase
        .from('loan_payments')
        .select(`
            *,
            loan_contracts!inner (
                contract_no,
                member_id
            )
        `)
        .eq('loan_contracts.member_id', memberId)
        .order('payment_date', { ascending: false })

    if (error) throw error
    return data
}
