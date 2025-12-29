import { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {
    Box,
    Container,
    Heading,
    Button,
    Table,
    Thead,
    Tbody,
    Tr,
    Th,
    Td,
    Badge,
    Input,
    HStack,
    Spinner,
    Center,
    useToast,
    Card,
    CardBody,
    Text,
    useDisclosure,
    IconButton,
    Menu,
    MenuButton,
    MenuList,
    MenuItem,
    AlertDialog,
    AlertDialogOverlay,
    AlertDialogContent,
    AlertDialogHeader,
    AlertDialogBody,
    AlertDialogFooter,
} from '@chakra-ui/react';
import { FiPlus, FiSearch, FiMoreVertical, FiEdit, FiTrash2, FiUser } from 'react-icons/fi';
import { getAllMembers, searchMembers, deleteMember } from '../services/memberService';
import { getStatusColor, getStatusText } from '../utils/formatters';
import { formatThaiDate } from '../utils/dateHelpers';
import MemberFormModal from '../components/MemberFormModal';
import React from 'react';

export default function MembersPage() {
    const navigate = useNavigate();
    const [members, setMembers] = useState([]);
    const [loading, setLoading] = useState(true);
    const [searchTerm, setSearchTerm] = useState('');
    const toast = useToast();

    // Modal controls
    const { isOpen, onOpen, onClose } = useDisclosure();
    const [selectedMember, setSelectedMember] = useState(null);

    // Alert Dialog controls
    const [isAlertOpen, setIsAlertOpen] = useState(false);
    const [memberToDelete, setMemberToDelete] = useState(null);
    const cancelRef = React.useRef();

    useEffect(() => {
        loadMembers();
    }, []);

    const loadMembers = async () => {
        try {
            setLoading(true);
            const data = await getAllMembers();
            setMembers(data);
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

    const handleSearch = async () => {
        if (!searchTerm.trim()) {
            loadMembers();
            return;
        }

        try {
            setLoading(true);
            const data = await searchMembers(searchTerm);
            setMembers(data);
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

    const handleAddMember = () => {
        setSelectedMember(null);
        onOpen();
    };

    const handleEditMember = (member) => {
        setSelectedMember(member);
        onOpen();
    };

    const handleDeleteClick = (member) => {
        setMemberToDelete(member);
        setIsAlertOpen(true);
    };

    const confirmDelete = async () => {
        if (!memberToDelete) return;

        try {
            await deleteMember(memberToDelete.id);
            toast({
                title: 'ลบสมาชิกสำเร็จ',
                status: 'success',
                duration: 3000,
                isClosable: true,
            });
            loadMembers();
        } catch (error) {
            toast({
                title: 'เกิดข้อผิดพลาด',
                description: error.message,
                status: 'error',
                duration: 3000,
                isClosable: true,
            });
        } finally {
            setIsAlertOpen(false);
            setMemberToDelete(null);
        }
    };

    if (loading) {
        return (
            <Center h="calc(100vh - 200px)">
                <Spinner size="xl" color="brand.500" thickness="4px" />
            </Center>
        );
    }

    return (
        <Container maxW="container.xl">
            <HStack justify="space-between" mb={6}>
                <Heading>สมาชิก</Heading>
                <Button leftIcon={<FiPlus />} colorScheme="brand" onClick={handleAddMember}>
                    เพิ่มสมาชิก
                </Button>
            </HStack>

            <Card mb={6}>
                <CardBody>
                    <HStack>
                        <Input
                            placeholder="ค้นหาด้วย รหัสสมาชิก, ชื่อ, นามสกุล, เบอร์โทร"
                            value={searchTerm}
                            onChange={(e) => setSearchTerm(e.target.value)}
                            onKeyPress={(e) => e.key === 'Enter' && handleSearch()}
                        />
                        <Button
                            leftIcon={<FiSearch />}
                            colorScheme="brand"
                            onClick={handleSearch}
                        >
                            ค้นหา
                        </Button>
                        <Button onClick={() => { setSearchTerm(''); loadMembers(); }}>รีเซ็ต</Button>
                    </HStack>
                </CardBody>
            </Card>

            <Card>
                <CardBody>
                    {members.length === 0 ? (
                        <Text color="gray.500" textAlign="center" py={8}>
                            ไม่พบข้อมูลสมาชิก
                        </Text>
                    ) : (
                        <Table variant="simple">
                            <Thead>
                                <Tr>
                                    <Th>รหัสสมาชิก</Th>
                                    <Th>ชื่อ-นามสกุล</Th>
                                    <Th>เบอร์โทร</Th>
                                    <Th>ที่อยู่</Th>
                                    <Th>สถานะ</Th>
                                    <Th>วันที่สมัคร</Th>
                                    <Th>จัดการ</Th>
                                </Tr>
                            </Thead>
                            <Tbody>
                                {members.map((member) => (
                                    <Tr key={member.id}>
                                        <Td fontWeight="semibold">{member.member_code}</Td>
                                        <Td>{`${member.title_prefix || ''}${member.first_name} ${member.last_name}`}</Td>
                                        <Td>{member.phone || '-'}</Td>
                                        <Td maxW="300px" isTruncated>
                                            {member.address || '-'}
                                        </Td>
                                        <Td>
                                            <Badge colorScheme={getStatusColor(member.status)}>
                                                {getStatusText(member.status)}
                                            </Badge>
                                        </Td>
                                        <Td>{formatThaiDate(member.created_at)}</Td>
                                        <Td>
                                            <Menu>
                                                <MenuButton
                                                    as={IconButton}
                                                    icon={<FiMoreVertical />}
                                                    variant="ghost"
                                                    size="sm"
                                                />
                                                <MenuList>
                                                    <MenuItem icon={<FiUser />} onClick={() => navigate(`/members/${member.id}`)}>
                                                        ดูรายละเอียด
                                                    </MenuItem>
                                                    <MenuItem icon={<FiEdit />} onClick={() => handleEditMember(member)}>
                                                        แก้ไข
                                                    </MenuItem>
                                                    <MenuItem
                                                        icon={<FiTrash2 />}
                                                        color="red.500"
                                                        onClick={() => handleDeleteClick(member)}
                                                    >
                                                        ลบ (เลิกใช้งาน)
                                                    </MenuItem>
                                                </MenuList>
                                            </Menu>
                                        </Td>
                                    </Tr>
                                ))}
                            </Tbody>
                        </Table>
                    )}
                </CardBody>
            </Card>

            <MemberFormModal
                isOpen={isOpen}
                onClose={onClose}
                onSuccess={loadMembers}
                initialData={selectedMember}
            />

            <AlertDialog
                isOpen={isAlertOpen}
                leastDestructiveRef={cancelRef}
                onClose={() => setIsAlertOpen(false)}
            >
                <AlertDialogOverlay>
                    <AlertDialogContent>
                        <AlertDialogHeader fontSize="lg" fontWeight="bold">
                            ยืนยันการลบสมาชิก
                        </AlertDialogHeader>

                        <AlertDialogBody>
                            คุณต้องการลบสมาชิก "{memberToDelete?.first_name} {memberToDelete?.last_name}" ใช่หรือไม่?
                            <br />
                            <Text fontSize="sm" color="gray.500" mt={2}>
                                *ข้อมูลจะถูกเปลี่ยนสถานะเป็น "inactive" เท่านั้น
                            </Text>
                        </AlertDialogBody>

                        <AlertDialogFooter>
                            <Button ref={cancelRef} onClick={() => setIsAlertOpen(false)}>
                                ยกเลิก
                            </Button>
                            <Button colorScheme="red" onClick={confirmDelete} ml={3}>
                                ลบสมาชิก
                            </Button>
                        </AlertDialogFooter>
                    </AlertDialogContent>
                </AlertDialogOverlay>
            </AlertDialog>
        </Container>
    );
}
