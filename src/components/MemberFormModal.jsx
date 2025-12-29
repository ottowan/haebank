import React, { useState, useEffect } from 'react';
import {
    Modal,
    ModalOverlay,
    ModalContent,
    ModalHeader,
    ModalFooter,
    ModalBody,
    ModalCloseButton,
    Button,
    FormControl,
    FormLabel,
    Input,
    Select,
    VStack,
    HStack,
    SimpleGrid,
    useToast,
} from '@chakra-ui/react';
import { createMember, updateMember } from '../services/memberService';

const MemberFormModal = ({ isOpen, onClose, onSuccess, initialData = null }) => {
    const [formData, setFormData] = useState({
        member_code: '',
        title_prefix: 'นาย',
        first_name: '',
        last_name: '',
        phone: '',
        address: '', // Keep for backward compatibility or display
        // Detailed Address Fields
        house_no: '',
        moo: '',
        village: '',
        tambon: '',
        amphoe: '',
        province: '',
    });
    const [loading, setLoading] = useState(false);
    const toast = useToast();

    useEffect(() => {
        if (initialData) {
            setFormData({
                member_code: initialData.member_code || '',
                title_prefix: initialData.title_prefix || 'นาย',
                first_name: initialData.first_name || '',
                last_name: initialData.last_name || '',
                phone: initialData.phone || '',
                address: initialData.address || '',
                house_no: initialData.house_no || '',
                moo: initialData.moo || '',
                village: initialData.village || '',
                tambon: initialData.tambon || '',
                amphoe: initialData.amphoe || '',
                province: initialData.province || '',
            });
        } else {
            // Reset form for new member
            setFormData({
                member_code: '',
                title_prefix: 'นาย',
                first_name: '',
                last_name: '',
                phone: '',
                address: '',
                house_no: '',
                moo: '',
                village: '',
                tambon: '',
                amphoe: '',
                province: 'พะเยา', // Default province as per context
            });
        }
    }, [initialData, isOpen]);

    const handleChange = (e) => {
        const { name, value } = e.target;
        setFormData(prev => ({ ...prev, [name]: value }));
    };

    const generateFullAddress = () => {
        const { house_no, moo, village, tambon, amphoe, province } = formData;
        let addr = '';
        if (house_no) addr += `บ้านเลขที่ ${house_no} `;
        if (moo) addr += `หมู่ ${moo} `;
        if (village) addr += `บ้าน${village} `;
        if (tambon) addr += `ต.${tambon} `;
        if (amphoe) addr += `อ.${amphoe} `;
        if (province) addr += `จ.${province}`;
        return addr.trim();
    };

    const handleSubmit = async (e) => {
        e.preventDefault();

        if (!formData.member_code || !formData.first_name || !formData.last_name) {
            toast({
                title: 'กรุณากรอกข้อมูลให้ครบถ้วน',
                description: 'รหัสสมาชิก, ชื่อ และนามสกุล จำเป็นต้องระบุ',
                status: 'warning',
                duration: 3000,
                isClosable: true,
            });
            return;
        }

        try {
            setLoading(true);
            const fullAddress = generateFullAddress();
            const dataToSubmit = {
                ...formData,
                address: fullAddress // Update the legacy address field with the composed string
            };

            if (initialData) {
                await updateMember(initialData.id, dataToSubmit);
                toast({ title: 'อัปเดตข้อมูลสมาชิกสำเร็จ', status: 'success', duration: 3000, isClosable: true });
            } else {
                await createMember(dataToSubmit);
                toast({ title: 'เพิ่มสมาชิกใหม่สำเร็จ', status: 'success', duration: 3000, isClosable: true });
            }

            if (onSuccess) onSuccess();
            onClose();
        } catch (error) {
            toast({
                title: 'เกิดข้อผิดพลาด',
                description: error.message,
                status: 'error',
                duration: 3000,
                isClosable: true,
            });
        } finally {
            setLoading(false);
        }
    };

    return (
        <Modal isOpen={isOpen} onClose={onClose} size="xl">
            <ModalOverlay />
            <ModalContent>
                <ModalHeader>{initialData ? 'แก้ไขข้อมูลสมาชิก' : 'เพิ่มสมาชิกใหม่'}</ModalHeader>
                <ModalCloseButton />
                <form onSubmit={handleSubmit}>
                    <ModalBody>
                        <VStack spacing={4}>
                            <HStack w="full" spacing={4}>
                                <FormControl isRequired>
                                    <FormLabel>รหัสสมาชิก</FormLabel>
                                    <Input
                                        name="member_code"
                                        value={formData.member_code}
                                        onChange={handleChange}
                                        placeholder="เช่น M001"
                                    />
                                </FormControl>
                                <FormControl>
                                    <FormLabel>คำนวณหน้า</FormLabel>
                                    <Select name="title_prefix" value={formData.title_prefix} onChange={handleChange}>
                                        <option value="นาย">นาย</option>
                                        <option value="นาง">นาง</option>
                                        <option value="นางสาว">นางสาว</option>
                                    </Select>
                                </FormControl>
                            </HStack>

                            <HStack w="full" spacing={4}>
                                <FormControl isRequired>
                                    <FormLabel>ชื่อ</FormLabel>
                                    <Input
                                        name="first_name"
                                        value={formData.first_name}
                                        onChange={handleChange}
                                    />
                                </FormControl>
                                <FormControl isRequired>
                                    <FormLabel>นามสกุล</FormLabel>
                                    <Input
                                        name="last_name"
                                        value={formData.last_name}
                                        onChange={handleChange}
                                    />
                                </FormControl>
                            </HStack>

                            <FormControl>
                                <FormLabel>เบอร์โทรศัพท์</FormLabel>
                                <Input
                                    name="phone"
                                    value={formData.phone}
                                    onChange={handleChange}
                                    placeholder="0xxxxxxxxx"
                                />
                            </FormControl>

                            <SimpleGrid columns={2} spacing={4} w="full">
                                <FormControl>
                                    <FormLabel>บ้านเลขที่</FormLabel>
                                    <Input name="house_no" value={formData.house_no} onChange={handleChange} />
                                </FormControl>
                                <FormControl>
                                    <FormLabel>หมู่ที่</FormLabel>
                                    <Input name="moo" value={formData.moo} onChange={handleChange} />
                                </FormControl>
                                <FormControl>
                                    <FormLabel>ชื่อหมู่บ้าน</FormLabel>
                                    <Input name="village" value={formData.village} onChange={handleChange} />
                                </FormControl>
                                <FormControl>
                                    <FormLabel>ตำบล</FormLabel>
                                    <Input name="tambon" value={formData.tambon} onChange={handleChange} />
                                </FormControl>
                                <FormControl>
                                    <FormLabel>อำเภอ</FormLabel>
                                    <Input name="amphoe" value={formData.amphoe} onChange={handleChange} />
                                </FormControl>
                                <FormControl>
                                    <FormLabel>จังหวัด</FormLabel>
                                    <Input name="province" value={formData.province} onChange={handleChange} />
                                </FormControl>
                            </SimpleGrid>
                        </VStack>
                    </ModalBody>

                    <ModalFooter>
                        <Button variant="ghost" mr={3} onClick={onClose}>
                            ยกเลิก
                        </Button>
                        <Button colorScheme="blue" type="submit" isLoading={loading}>
                            {initialData ? 'บันทึกการแก้ไข' : 'บันทึกสมาชิก'}
                        </Button>
                    </ModalFooter>
                </form>
            </ModalContent>
        </Modal>
    );
};

export default MemberFormModal;
