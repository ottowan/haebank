import { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import {
    Box,
    Container,
    Heading,
    Button,
    Card,
    CardBody,
    CardHeader,
    VStack,
    HStack,
    Text,
    Divider,
    Badge,
    Table,
    Thead,
    Tbody,
    Tr,
    Th,
    Td,
    Spinner,
    Center,
    useToast,
    Grid,
    GridItem,
    Stat,
    StatLabel,
    StatNumber,
    StatHelpText,
} from '@chakra-ui/react';
import { FiArrowLeft, FiEdit, FiFileText } from 'react-icons/fi';
import { getMemberById } from '../services/memberService';
import { getContractsByMember } from '../services/contractService';
import { getPaymentsByMember } from '../services/paymentService';
import { formatCurrency, getStatusColor, getStatusText, getPaymentTypeText } from '../utils/formatters';
import { formatThaiDate } from '../utils/dateHelpers';
import MemberFormModal from '../components/MemberFormModal'; // Reuse for editing

export default function MemberDetailPage() {
    const { id } = useParams();
    const navigate = useNavigate();
    const toast = useToast();

    const [member, setMember] = useState(null);
    const [contracts, setContracts] = useState([]);
    const [payments, setPayments] = useState([]);
    const [loading, setLoading] = useState(true);

    // Edit Modal state
    const [isEditOpen, setIsEditOpen] = useState(false);

    useEffect(() => {
        loadData();
    }, [id]);

    const loadData = async () => {
        try {
            setLoading(true);
            const [memberData, contractsData, paymentsData] = await Promise.all([
                getMemberById(id),
                getContractsByMember(id),
                getPaymentsByMember(id)
            ]);

            setMember(memberData);
            setContracts(contractsData || []);
            setPayments(paymentsData || []);
        } catch (error) {
            toast({
                title: 'เกิดข้อผิดพลาด',
                description: error.message,
                status: 'error',
                duration: 3000,
                isClosable: true,
            });
            navigate('/members');
        } finally {
            setLoading(false);
        }
    };

    const handleEditSuccess = () => {
        loadData();
    };

    if (loading) {
        return (
            <Center h="calc(100vh - 200px)">
                <Spinner size="xl" color="brand.500" thickness="4px" />
            </Center>
        );
    }

    if (!member) {
        return (
            <Container maxW="container.xl">
                <Text>ไม่พบข้อมูลสมาชิก</Text>
            </Container>
        );
    }

    // Calculate Stats
    const activeContracts = contracts.filter(c => c.status === 'active' || c.status === 'overdue');
    const totalDebt = activeContracts.reduce((sum, c) => sum + (c.balance || 0), 0);
    const totalPaid = payments.reduce((sum, p) => sum + (p.amount || 0), 0);

    return (
        <Container maxW="container.xl">
            {/* Header */}
            <HStack justify="space-between" mb={6}>
                <HStack>
                    <Button leftIcon={<FiArrowLeft />} variant="ghost" onClick={() => navigate('/members')}>
                        กลับ
                    </Button>
                    <Heading size="lg">ข้อมูลสมาชิก</Heading>
                </HStack>
                <Button leftIcon={<FiEdit />} colorScheme="blue" onClick={() => setIsEditOpen(true)}>
                    แก้ไขข้อมูล
                </Button>
            </HStack>

            <Grid templateColumns="repeat(12, 1fr)" gap={6} mb={6}>
                {/* Info Card */}
                <GridItem colSpan={{ base: 12, md: 8 }}>
                    <Card h="full">
                        <CardHeader>
                            <HStack justify="space-between">
                                <Heading size="md">รายละเอียดส่วนตัว</Heading>
                                <Badge colorScheme={getStatusColor(member.status)} fontSize="md">
                                    {getStatusText(member.status)}
                                </Badge>
                            </HStack>
                        </CardHeader>
                        <CardBody>
                            <VStack align="stretch" spacing={3}>
                                <HStack justify="space-between">
                                    <Text fontWeight="bold">รหัสสมาชิก:</Text>
                                    <Text fontSize="lg">{member.member_code}</Text>
                                </HStack>
                                <Divider />
                                <HStack justify="space-between">
                                    <Text fontWeight="bold">ชื่อ-นามสกุล:</Text>
                                    <Text fontSize="lg">
                                        {member.title_prefix}{member.first_name} {member.last_name}
                                    </Text>
                                </HStack>
                                <HStack justify="space-between">
                                    <Text fontWeight="bold">เบอร์โทรศัพท์:</Text>
                                    <Text>{member.phone || '-'}</Text>
                                </HStack>
                                <HStack align="start" justify="space-between">
                                    <Text fontWeight="bold" minW="100px">ที่อยู่:</Text>
                                    <Text textAlign="right">{member.address || '-'}</Text>
                                </HStack>
                                <HStack justify="space-between">
                                    <Text fontWeight="bold">วันที่สมัคร:</Text>
                                    <Text>{formatThaiDate(member.created_at)}</Text>
                                </HStack>
                            </VStack>
                        </CardBody>
                    </Card>
                </GridItem>

                {/* Stats Cards */}
                <GridItem colSpan={{ base: 12, md: 4 }}>
                    <VStack spacing={4} h="full">
                        <Card w="full">
                            <CardBody>
                                <Stat>
                                    <StatLabel>หนี้สินคงเหลือก (เงินต้น + ดอกเบี้ย)</StatLabel>
                                    <StatNumber color="red.500">{formatCurrency(totalDebt)}</StatNumber>
                                    <StatHelpText>จาก {activeContracts.length} สัญญาที่ยังไม่ปิด</StatHelpText>
                                </Stat>
                            </CardBody>
                        </Card>
                        <Card w="full">
                            <CardBody>
                                <Stat>
                                    <StatLabel>ยอดชำระรวมทั้งหมด</StatLabel>
                                    <StatNumber color="green.500">{formatCurrency(totalPaid)}</StatNumber>
                                    <StatHelpText>จากประวัติการชำระ {payments.length} ครั้ง</StatHelpText>
                                </Stat>
                            </CardBody>
                        </Card>
                    </VStack>
                </GridItem>
            </Grid>

            {/* Contracts */}
            <Card mb={6}>
                <CardHeader>
                    <HStack justify="space-between">
                        <Heading size="md">สัญญาเงินกู้ ({contracts.length})</Heading>
                        {/* Future: Add 'Create Contract' button here? */}
                    </HStack>
                </CardHeader>
                <CardBody>
                    {contracts.length === 0 ? (
                        <Text color="gray.500" textAlign="center">ไม่มีข้อมูลสัญญา</Text>
                    ) : (
                        <Table variant="simple" size="sm">
                            <Thead>
                                <Tr>
                                    <Th>เลขที่สัญญา</Th>
                                    <Th>วันที่เริ่ม</Th>
                                    <Th isNumeric>เงินต้น</Th>
                                    <Th isNumeric>คงเหลือ</Th>
                                    <Th>สถานะ</Th>
                                    <Th></Th>
                                </Tr>
                            </Thead>
                            <Tbody>
                                {contracts.map((contract) => (
                                    <Tr key={contract.contract_id || contract.id}>
                                        <Td fontWeight="medium">{contract.contract_no}</Td>
                                        <Td>{formatThaiDate(contract.start_date)}</Td>
                                        <Td isNumeric>{formatCurrency(contract.principal_amount)}</Td>
                                        <Td isNumeric fontWeight="bold" color={contract.balance > 0 ? "red.500" : "green.500"}>
                                            {formatCurrency(contract.balance)}
                                        </Td>
                                        <Td>
                                            <Badge colorScheme={getStatusColor(contract.status)}>
                                                {getStatusText(contract.status)}
                                            </Badge>
                                        </Td>
                                        <Td>
                                            <Button
                                                size="sm"
                                                variant="ghost"
                                                leftIcon={<FiFileText />}
                                                onClick={() => navigate(`/contracts/${contract.contract_id || contract.id}`)}
                                            >
                                                ดูรายระเอียด
                                            </Button>
                                        </Td>
                                    </Tr>
                                ))}
                            </Tbody>
                        </Table>
                    )}
                </CardBody>
            </Card>

            {/* Payment History */}
            <Card>
                <CardHeader>
                    <Heading size="md">ประวัติการชำระเงินล่าสุด</Heading>
                </CardHeader>
                <CardBody>
                    {payments.length === 0 ? (
                        <Text color="gray.500" textAlign="center">ไม่มีประวัติการชำระเงิน</Text>
                    ) : (
                        <Table variant="simple" size="sm">
                            <Thead>
                                <Tr>
                                    <Th>วันที่</Th>
                                    <Th>สัญญา</Th>
                                    <Th>ประเภท</Th>
                                    <Th isNumeric>จำนวนเงิน</Th>
                                </Tr>
                            </Thead>
                            <Tbody>
                                {payments.slice(0, 10).map((payment) => ( // Show only recent 10
                                    <Tr key={payment.id}>
                                        <Td>{formatThaiDate(payment.payment_date)}</Td>
                                        <Td>{payment.loan_contracts?.contract_no || '-'}</Td>
                                        <Td>
                                            <Badge size="sm" colorScheme={payment.payment_type === 'close' ? 'purple' : 'gray'}>
                                                {getPaymentTypeText(payment.payment_type)}
                                            </Badge>
                                        </Td>
                                        <Td isNumeric fontWeight="bold" color="green.600">
                                            {formatCurrency(payment.amount)}
                                        </Td>
                                    </Tr>
                                ))}
                            </Tbody>
                        </Table>
                    )}
                </CardBody>
            </Card>

            {/* Reuse Member Form for Editing */}
            <MemberFormModal
                isOpen={isEditOpen}
                onClose={() => setIsEditOpen(false)}
                onSuccess={handleEditSuccess}
                initialData={member}
            />
        </Container>
    );
}
