import { supabase } from './supabase'

/**
 * ดึงข้อมูลสมาชิกทั้งหมด
 */
export async function getAllMembers() {
    const { data, error } = await supabase
        .from('members')
        .select('*')
        .order('created_at', { ascending: false })

    if (error) throw error
    return data
}

/**
 * ดึงข้อมูลสมาชิกที่ใช้งาน
 */
export async function getActiveMembers() {
    const { data, error } = await supabase
        .from('members')
        .select('*')
        .eq('status', 'active')
        .order('member_code', { ascending: true })

    if (error) throw error
    return data
}

/**
 * ดึงข้อมูลสมาชิกตาม ID
 */
export async function getMemberById(id) {
    const { data, error } = await supabase
        .from('members')
        .select('*')
        .eq('id', id)
        .single()

    if (error) throw error
    return data
}

/**
 * ค้นหาสมาชิก
 */
export async function searchMembers(searchTerm) {
    const { data, error } = await supabase
        .from('members')
        .select('*')
        .or(`member_code.ilike.%${searchTerm}%,first_name.ilike.%${searchTerm}%,last_name.ilike.%${searchTerm}%,phone.ilike.%${searchTerm}%`)
        .order('member_code', { ascending: true })

    if (error) throw error
    return data
}

/**
 * สร้างสมาชิกใหม่
 */
export async function createMember(memberData) {
    const { data, error } = await supabase
        .from('members')
        .insert([memberData])
        .select()
        .single()

    if (error) throw error
    return data
}

/**
 * อัปเดตข้อมูลสมาชิก
 */
export async function updateMember(id, memberData) {
    const { data, error } = await supabase
        .from('members')
        .update(memberData)
        .eq('id', id)
        .select()
        .single()

    if (error) throw error
    return data
}

/**
 * ลบสมาชิก (เปลี่ยนสถานะเป็น inactive)
 */
export async function deleteMember(id) {
    const { data, error } = await supabase
        .from('members')
        .update({ status: 'inactive' })
        .eq('id', id)
        .select()
        .single()

    if (error) throw error
    return data
}
