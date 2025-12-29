import { supabase } from './supabase'

/**
 * ดึงข้อมูลสัญญาทั้งหมดพร้อมข้อมูลสมาชิกและยอดคงเหลือ
 */
export async function getAllContracts() {
    const { data, error } = await supabase
        .from('v_contract_balances')
        .select('*')
        .order('created_at', { ascending: false })

    if (error) throw error
    return data
}

/**
 * ดึงข้อมูลสัญญาที่ใช้งาน
 */
export async function getActiveContracts() {
    const { data, error } = await supabase
        .from('v_contract_balances')
        .select('*')
        .eq('status', 'active')
        .order('start_date', { ascending: false })

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
 * ดึงข้อมูลสัญญาตาม ID
 */
export async function getContractById(id) {
    const { data, error } = await supabase
        .from('v_contract_balances')
        .select('*')
        .eq('contract_id', id)
        .single()

    if (error) throw error
    return data
}

/**
 * ดึงข้อมูลสัญญาตามสมาชิก
 */
export async function getContractsByMember(memberId) {
    const { data, error } = await supabase
        .from('v_contract_balances')
        .select('*')
        .eq('member_id', memberId)
        .order('start_date', { ascending: false })

    if (error) throw error
    return data
}

/**
 * สร้างสัญญาใหม่
 */
export async function createContract(contractData) {
    const { data: { user } } = await supabase.auth.getUser()

    const { data, error } = await supabase
        .from('loan_contracts')
        .insert([{
            ...contractData,
            created_by: user?.id
        }])
        .select()
        .single()

    if (error) throw error
    return data
}

/**
 * อัปเดตข้อมูลสัญญา
 */
export async function updateContract(id, contractData) {
    const { data, error } = await supabase
        .from('loan_contracts')
        .update(contractData)
        .eq('id', id)
        .select()
        .single()

    if (error) throw error
    return data
}

/**
 * ปิดสัญญา
 */
export async function closeContract(id) {
    const { data, error } = await supabase
        .from('loan_contracts')
        .update({ status: 'closed' })
        .eq('id', id)
        .select()
        .single()

    if (error) throw error
    return data
}

/**
 * ค้นหาสัญญา
 */
export async function searchContracts(searchTerm) {
    const { data, error } = await supabase
        .from('v_contract_balances')
        .select('*')
        .or(`contract_no.ilike.%${searchTerm}%,member_code.ilike.%${searchTerm}%,first_name.ilike.%${searchTerm}%,last_name.ilike.%${searchTerm}%`)
        .order('created_at', { ascending: false })

    if (error) throw error
    return data
}

/**
 * ตรวจสอบและอัปเดตสัญญาค้างชำระ
 */
export async function checkOverdueContracts() {
    const { data, error } = await supabase.rpc('check_overdue_contracts')

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
        .order('days_until_due', { ascending: true })

    if (error) throw error
    return data
}
