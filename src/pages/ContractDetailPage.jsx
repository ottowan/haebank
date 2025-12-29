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
    useDisclosure,
    Progress,
    Grid,
    GridItem,
    Stat,
    StatLabel,
    StatNumber,
    StatHelpText,
} from '@chakra-ui/react';
import { FiArrowLeft, FiDollarSign } from 'react-icons/fi';
import { getContractById } from '../services/contractService';
import { getPaymentsByContract } from '../services/paymentService';
import { formatCurrency, getPaymentTypeText, getStatusColor, getStatusText } from '../utils/formatters';
import { formatThaiDate } from '../utils/dateHelpers';
import { calculateLoanDetails, calculatePaymentProgress } from '../utils/interestCalculator';
import PaymentFormModal from '../components/PaymentFormModal';

export default function ContractDetailPage() {
    const { id } = useParams();
    const navigate = useNavigate();
    const [contract, setContract] = useState(null);
    const [payments, setPayments] = useState([]);
    const [loading, setLoading] = useState(true);
    const { isOpen, onOpen, onClose } = useDisclosure();
    const toast = useToast();

    useEffect(() => {
        loadContractData();
    }, [id]);

    const loadContractData = async () => {
        try {
            setLoading(true);
            const [contractData, paymentsData] = await Promise.all([
                getContractById(id),
                getPaymentsByContract(id)
            ]);
            setContract(contractData);
            setPayments(paymentsData || []);
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

    const handlePaymentSuccess = () => {
        loadContractData();
    };

    if (loading) {
        return (
            <Center h="calc(100vh - 200px)">
                <Spinner size="xl" color="brand.500" thickness="4px" />
            </Center>
        );
    }

    if (!contract) {
        return (
            <Container maxW="container.xl">
                <Text>ไม่พบข้อมูลสัญญา</Text>
            </Container>
        );
    }

    // คำนวณข้อมูลสัญญา
    const loanDetails = calculateLoanDetails(
        contract.principal_amount,
        contract.interest_rate,
        contract.start_date,
        contract.loan_period_months
    );

    const progress = calculatePaymentProgress(
        contract.total_paid || 0,
        loanDetails.totalAmount
    );

    const remainingBalance = loanDetails.totalAmount - (contract.total_paid || 0);

    return (
        <Container maxW="container.xl">
            {/* Header */}
            <HStack justify="space-between" mb={6}>
                <HStack>
                    <Button
                        leftIcon={<FiArrowLeft />}
                        variant="ghost"
                        onClick={() => navigate('/contracts')}
                    >
                        กลับ
                    </Button>
                    <Heading size="lg">รายละเอียดสัญญา</Heading>
                </HStack>
                <Button
                    leftIcon={<FiDollarSign />}
                    colorScheme="green"
                    onClick={onOpen}
                    isDisabled={contract.status === 'closed'}
                >
                    บันทึกการชำระเงิน
                </Button>
            </HStack>

            {/* สรุปข้อมูลสัญญา */}
            <Grid templateColumns="repeat(12, 1fr)" gap={6} mb={6}>
                <GridItem colSpan={{ base: 12, md: 8 }}>
                    <Card>
                        <CardHeader>
                            <HStack justify="space-between">
                                <Heading size="md">ข้อมูลสัญญา</Heading>
                                <Badge colorScheme={getStatusColor(contract.status)} fontSize="md">
                                    {getStatusText(contract.status)}
                                </Badge>
                            </HStack>
                        </CardHeader>
                        <CardBody>
                            <VStack align="stretch" spacing={3}>
                                <HStack justify="space-between">
                                    <Text fontWeight="bold">เลขที่สัญญา:</Text>
                                    <Text fontSize="lg">{contract.contract_no}</Text>
                                </HStack>
                                <Divider />
                                <HStack justify="space-between">
                                    <Text fontWeight="bold">ชื่อสมาชิก:</Text>
                                    <Text>
                                        {contract.title_prefix} {contract.first_name} {contract.last_name}
                                    </Text>
                                </HStack>
                                <HStack justify="space-between">
                                    <Text fontWeight="bold">รหัสสมาชิก:</Text>
                                    <Text>{contract.member_code}</Text>
                                </HStack>
                                <Divider />
                                <HStack justify="space-between">
                                    <Text fontWeight="bold">วันที่เริ่มสัญญา:</Text>
                                    <Text>{formatThaiDate(contract.start_date)}</Text>
                                </HStack>
                                <HStack justify="space-between">
                                    <Text fontWeight="bold">วันครบกำหนด:</Text>
                                    <Text>{formatThaiDate(loanDetails.endDate)}</Text>
                                </HStack>
                                <HStack justify="space-between">
                                    <Text fontWeight="bold">ระยะเวลา:</Text>
                                    <Text>{contract.loan_period_months} เดือน</Text>
                                </HStack>
                                <HStack justify="space-between">
                                    <Text fontWeight="bold">อัตราดอกเบี้ย:</Text>
                                    <Text>{contract.interest_rate}% ต่อเดือน</Text>
                                </HStack>
                            </VStack>
                        </CardBody>
                    </Card>
                </GridItem>

                <GridItem colSpan={{ base: 12, md: 4 }}>
                    <VStack spacing={4}>
                        <Card w="full">
                            <CardBody>
                                <Stat>
                                    <StatLabel>ความคืบหน้า</StatLabel>
                                    <StatNumber>{progress}%</StatNumber>
                                    <StatHelpText>
                                        {formatCurrency(contract.total_paid || 0)} / {formatCurrency(loanDetails.totalAmount)}
                                    </StatHelpText>
                                    <Progress
                                        value={progress}
                                        colorScheme={progress === 100 ? 'green' : 'blue'}
                                        size="lg"
                                        borderRadius="full"
                                        mt={2}
                                    />
                                </Stat>
                            </CardBody>
                        </Card>

                        <Card w="full">
                            <CardBody>
                                <Stat>
                                    <StatLabel>ยอดคงเหลือ</StatLabel>
                                    <StatNumber color="red.600">
                                        {formatCurrency(remainingBalance)}
                                    </StatNumber>
                                </Stat>
                            </CardBody>
                        </Card>
                    </VStack>
                </GridItem>
            </Grid>

            {/* รายละเอียดการเงิน */}
            <Card mb={6}>
                <CardHeader>
                    <Heading size="md">รายละเอียดการเงิน</Heading>
                </CardHeader>
                <CardBody>
                    <Grid templateColumns="repeat(12, 1fr)" gap={4}>
                        <GridItem colSpan={{ base: 12, md: 3 }}>
                            <Box p={4} bg="blue.50" borderRadius="md">
                                <Text fontSize="sm" color="gray.600">เงินต้น</Text>
                                <Text fontSize="xl" fontWeight="bold" color="blue.600">
                                    {formatCurrency(contract.principal_amount)}
                                </Text>
                            </Box>
                        </GridItem>
                        <GridItem colSpan={{ base: 12, md: 3 }}>
                            <Box p={4} bg="purple.50" borderRadius="md">
                                <Text fontSize="sm" color="gray.600">ดอกเบี้ยสะสม</Text>
                                <Text fontSize="xl" fontWeight="bold" color="purple.600">
                                    {formatCurrency(loanDetails.accumulatedInterest)}
                                </Text>
                                <Text fontSize="xs" color="gray.500">
                                    {loanDetails.monthsElapsed} เดือน
                                </Text>
                            </Box>
                        </GridItem>
                        <GridItem colSpan={{ base: 12, md: 3 }}>
                            <Box p={4} bg="orange.50" borderRadius="md">
                                <Text fontSize="sm" color="gray.600">ยอดรวมทั้งหมด</Text>
                                <Text fontSize="xl" fontWeight="bold" color="orange.600">
                                    {formatCurrency(loanDetails.totalAmount)}
                                </Text>
                            </Box>
                        </GridItem>
                        <GridItem colSpan={{ base: 12, md: 3 }}>
                            <Box p={4} bg="green.50" borderRadius="md">
                                <Text fontSize="sm" color="gray.600">ชำระแล้ว</Text>
                                <Text fontSize="xl" fontWeight="bold" color="green.600">
                                    {formatCurrency(contract.total_paid || 0)}
                                </Text>
                                <Text fontSize="xs" color="gray.500">
                                    {payments.length} ครั้ง
                                </Text>
                            </Box>
                        </GridItem>
                    </Grid>
                </CardBody>
            </Card>

            {/* ประวัติการชำระเงิน */}
            <Card>
                <CardHeader>
                    <Heading size="md">ประวัติการชำระเงิน</Heading>
                </CardHeader>
                <CardBody>
                    {payments.length === 0 ? (
                        <Text color="gray.500" textAlign="center" py={8}>
                            ยังไม่มีประวัติการชำระเงิน
                        </Text>
                    ) : (
                        <Table variant="simple">
                            <Thead>
                                <Tr>
                                    <Th>วันที่ชำระ</Th>
                                    <Th>ประเภท</Th>
                                    <Th isNumeric>จำนวนเงิน</Th>
                                    <Th>หมายเหตุ</Th>
                                </Tr>
                            </Thead>
                            <Tbody>
                                {payments.map((payment) => (
                                    <Tr key={payment.id}>
                                        <Td>{formatThaiDate(payment.payment_date)}</Td>
                                        <Td>
                                            <Badge
                                                colorScheme={
                                                    payment.payment_type === 'close' ? 'purple' :
                                                        payment.payment_type === 'installment' ? 'green' :
                                                            'blue'
                                                }
                                            >
                                                {getPaymentTypeText(payment.payment_type)}
                                            </Badge>
                                        </Td>
                                        <Td isNumeric fontWeight="bold" color="green.600">
                                            {formatCurrency(payment.amount)}
                                        </Td>
                                        <Td maxW="300px" isTruncated>
                                            {payment.note || '-'}
                                        </Td>
                                    </Tr>
                                ))}
                            </Tbody>
                        </Table>
                    )}
                </CardBody>
            </Card>

            {/* Payment Form Modal */}
            <PaymentFormModal
                isOpen={isOpen}
                onClose={onClose}
                onSuccess={handlePaymentSuccess}
                preSelectedContractId={contract.contract_id}
            />
        </Container>
    );
}
