import { useEffect, useState } from 'react'
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
    HStack,
    Spinner,
    Center,
    useToast,
    Card,
    CardBody,
    Text,
    Select,
    useDisclosure,
    Input,
} from '@chakra-ui/react'
import { FiPlus, FiSearch } from 'react-icons/fi'
import { getAllPayments } from '../services/paymentService'
import { formatCurrency, getPaymentTypeText } from '../utils/formatters'
import { formatThaiDate } from '../utils/dateHelpers'
import PaymentFormModal from '../components/PaymentFormModal'

export default function PaymentsPage() {
    const [payments, setPayments] = useState([])
    const [loading, setLoading] = useState(true)
    const [filterType, setFilterType] = useState('all')
    const [searchTerm, setSearchTerm] = useState('')
    const { isOpen, onOpen, onClose } = useDisclosure()
    const toast = useToast()

    useEffect(() => {
        loadPayments()
    }, [])

    const loadPayments = async () => {
        try {
            setLoading(true)
            const data = await getAllPayments()
            setPayments(data)
        } catch (error) {
            toast({
                title: 'เกิดข้อผิดพลาด',
                description: error.message,
                status: 'error',
                duration: 3000,
                isClosable: true,
            })
        } finally {
            setLoading(false)
        }
    }

    const filteredPayments = payments.filter(p => {
        // กรองตามประเภท
        const typeMatch = filterType === 'all' || p.payment_type === filterType

        // กรองตามคำค้นหา
        if (!searchTerm.trim()) return typeMatch

        const search = searchTerm.toLowerCase()
        const contractNo = p.loan_contracts?.contract_no?.toLowerCase() || ''
        const firstName = p.loan_contracts?.members?.first_name?.toLowerCase() || ''
        const lastName = p.loan_contracts?.members?.last_name?.toLowerCase() || ''
        const memberCode = p.loan_contracts?.members?.member_code?.toLowerCase() || ''

        const searchMatch = contractNo.includes(search) ||
            firstName.includes(search) ||
            lastName.includes(search) ||
            memberCode.includes(search)

        return typeMatch && searchMatch
    })

    const handlePaymentSuccess = () => {
        loadPayments() // Reload payments after successful submission
    }

    if (loading) {
        return (
            <Center h="calc(100vh - 200px)">
                <Spinner size="xl" color="brand.500" thickness="4px" />
            </Center>
        )
    }

    return (
        <Container maxW="container.xl">
            <HStack justify="space-between" mb={6}>
                <Heading>การชำระเงิน</Heading>
                <Button leftIcon={<FiPlus />} colorScheme="brand" onClick={onOpen}>
                    บันทึกการชำระเงิน
                </Button>
            </HStack>

            <Card mb={6}>
                <CardBody>
                    <HStack spacing={4}>
                        <Box flex="1">
                            <Input
                                placeholder="ค้นหาด้วย เลขที่สัญญา, รหัสสมาชิก, ชื่อ, นามสกุล"
                                value={searchTerm}
                                onChange={(e) => setSearchTerm(e.target.value)}
                                leftIcon={<FiSearch />}
                            />
                        </Box>
                        <HStack minW="250px">
                            <Text minW="80px">ประเภท:</Text>
                            <Select
                                value={filterType}
                                onChange={(e) => setFilterType(e.target.value)}
                            >
                                <option value="all">ทั้งหมด</option>
                                <option value="installment">รายงวด</option>
                                <option value="partial">ชำระบางส่วน</option>
                                <option value="close">ปิดยอด</option>
                            </Select>
                        </HStack>
                    </HStack>
                </CardBody>
            </Card>

            <Card>
                <CardBody>
                    {filteredPayments.length === 0 ? (
                        <Text color="gray.500" textAlign="center" py={8}>
                            ไม่พบข้อมูลการชำระเงิน
                        </Text>
                    ) : (
                        <Table variant="simple">
                            <Thead>
                                <Tr>
                                    <Th>วันที่ชำระ</Th>
                                    <Th>เลขที่สัญญา</Th>
                                    <Th>สมาชิก</Th>
                                    <Th>ประเภท</Th>
                                    <Th isNumeric>จำนวนเงิน</Th>
                                    <Th>หมายเหตุ</Th>
                                </Tr>
                            </Thead>
                            <Tbody>
                                {filteredPayments.map((payment) => (
                                    <Tr key={payment.id}>
                                        <Td>{formatThaiDate(payment.payment_date)}</Td>
                                        <Td fontWeight="semibold">
                                            {payment.loan_contracts?.contract_no}
                                        </Td>
                                        <Td>
                                            {payment.loan_contracts?.members ? (
                                                <Box>
                                                    <Text fontWeight="medium">
                                                        {payment.loan_contracts.members.title_prefix || ''} {payment.loan_contracts.members.first_name} {payment.loan_contracts.members.last_name}
                                                    </Text>
                                                    <Text fontSize="xs" color="gray.500">
                                                        {payment.loan_contracts.members.member_code}
                                                    </Text>
                                                </Box>
                                            ) : '-'}
                                        </Td>
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
                                        <Td maxW="200px" isTruncated>
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
            />
        </Container>
    )
}
