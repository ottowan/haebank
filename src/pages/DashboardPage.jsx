import { useEffect, useState } from 'react'
import {
    Box,
    Container,
    Heading,
    SimpleGrid,
    Stat,
    StatLabel,
    StatNumber,
    StatHelpText,
    StatArrow,
    Card,
    CardHeader,
    CardBody,
    Table,
    Thead,
    Tbody,
    Tr,
    Th,
    Td,
    Badge,
    Text,
    Spinner,
    Center,
    useToast,
    Icon,
} from '@chakra-ui/react'
import { FiDollarSign, FiFileText, FiAlertCircle, FiTrendingUp, FiInbox, FiUsers } from 'react-icons/fi'
import { getDashboardSummary, getContractsNearDue, getRecentPayments, getOverdueContracts } from '../services/dashboardService'
import { formatCurrency, getStatusColor, getStatusText, getPaymentTypeText } from '../utils/formatters'
import { formatThaiDate } from '../utils/dateHelpers'

function StatCard({ title, value, icon, helpText, colorScheme = 'blue' }) {
    const colorMap = {
        blue: { bg: 'blue.50', iconBg: 'blue.500', iconColor: 'white' },
        green: { bg: 'green.50', iconBg: 'green.500', iconColor: 'white' },
        orange: { bg: 'orange.50', iconBg: 'orange.500', iconColor: 'white' },
        red: { bg: 'red.50', iconBg: 'red.500', iconColor: 'white' },
        purple: { bg: 'purple.50', iconBg: 'purple.500', iconColor: 'white' },
    }

    const colors = colorMap[colorScheme] || colorMap.blue

    return (
        <Card
            bg={colors.bg}
            borderLeft="4px"
            borderColor={colors.iconBg}
            _hover={{ transform: 'translateY(-2px)', shadow: 'md' }}
            transition="all 0.2s"
        >
            <CardBody>
                <Stat>
                    <Box display="flex" justifyContent="space-between" alignItems="flex-start">
                        <Box flex="1">
                            <StatLabel fontSize="sm" color="gray.600" mb={1}>
                                {title}
                            </StatLabel>
                            <StatNumber fontSize="3xl" fontWeight="bold" color="gray.800">
                                {value}
                            </StatNumber>
                            {helpText && (
                                <StatHelpText fontSize="xs" color="gray.500" mb={0}>
                                    {helpText}
                                </StatHelpText>
                            )}
                        </Box>
                        <Box
                            bg={colors.iconBg}
                            color={colors.iconColor}
                            p={3}
                            borderRadius="lg"
                        >
                            <Icon as={icon} boxSize={6} />
                        </Box>
                    </Box>
                </Stat>
            </CardBody>
        </Card>
    )
}

export default function DashboardPage() {
    const [summary, setSummary] = useState(null)
    const [nearDue, setNearDue] = useState([])
    const [recentPayments, setRecentPayments] = useState([])
    const [overdueContracts, setOverdueContracts] = useState([])
    const [loading, setLoading] = useState(true)
    const toast = useToast()

    useEffect(() => {
        loadDashboardData()
    }, [])

    const loadDashboardData = async () => {
        try {
            setLoading(true)
            const [summaryData, nearDueData, paymentsData, overdueData] = await Promise.all([
                getDashboardSummary(),
                getContractsNearDue(),
                getRecentPayments(5),
                getOverdueContracts(),
            ])

            setSummary(summaryData)
            setNearDue(nearDueData)
            setRecentPayments(paymentsData)
            setOverdueContracts(overdueData)
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

    if (loading) {
        return (
            <Center h="calc(100vh - 200px)">
                <Spinner size="xl" color="brand.500" thickness="4px" />
            </Center>
        )
    }

    return (
        <Container maxW="container.xl">
            <Heading mb={6}>หน้าหลัก</Heading>

            {/* กลุ่มข้อมูลทั่วไป */}
            <Heading size="md" mb={4} color="gray.600">ข้อมูลทั่วไป</Heading>
            <SimpleGrid columns={{ base: 1, md: 3 }} spacing={6} mb={8}>
                <StatCard
                    title="สัญญาที่ใช้งาน"
                    value={summary?.active_contracts || 0}
                    icon={FiFileText}
                    helpText="สัญญาปกติ"
                    colorScheme="blue"
                />
                <StatCard
                    title="สัญญาค้างชำระ"
                    value={summary?.overdue_contracts || 0}
                    icon={FiAlertCircle}
                    helpText="เกินกำหนด"
                    colorScheme="red"
                />
                <StatCard
                    title="จำนวนสมาชิก"
                    value={summary?.total_members || 0}
                    icon={FiUsers}
                    helpText="สมาชิกทั้งหมด"
                    colorScheme="blue"
                />
            </SimpleGrid>

            {/* กลุ่มข้อมูลการเงิน */}
            <Heading size="md" mb={4} color="gray.600">ข้อมูลการเงิน</Heading>
            <SimpleGrid columns={{ base: 1, md: 3 }} spacing={6} mb={8}>
                <StatCard
                    title="เงินต้นรวม"
                    value={formatCurrency(summary?.total_active_principal || 0)}
                    icon={FiDollarSign}
                    helpText="ยอดเงินต้นของสัญญาที่ใช้งาน"
                    colorScheme="purple"
                />
                <StatCard
                    title="ดอกเบี้ยที่ได้รับ"
                    value={formatCurrency(summary?.total_interest_earned || 0)}
                    icon={FiTrendingUp}
                    helpText="ดอกเบี้ยสะสม"
                    colorScheme="green"
                />
                <StatCard
                    title="ยอดรวมคงค้าง"
                    value={formatCurrency(summary?.total_outstanding || 0)}
                    icon={FiDollarSign}
                    helpText="เงินต้น + ดอกเบี้ย"
                    colorScheme="orange"
                />
            </SimpleGrid>

            <SimpleGrid columns={{ base: 1, lg: 2 }} spacing={6}>
                {/* สัญญาใกล้ครบกำหนด */}
                <Card>
                    <CardHeader>
                        <Heading size="md">สัญญาใกล้ครบกำหนด (30 วัน)</Heading>
                    </CardHeader>
                    <CardBody>
                        {nearDue.length === 0 ? (
                            <Box textAlign="center" py={8}>
                                <Icon as={FiInbox} boxSize={12} color="gray.300" mb={3} />
                                <Text color="gray.500" fontSize="sm">ไม่มีสัญญาใกล้ครบกำหนด</Text>
                                <Text color="gray.400" fontSize="xs">ทุกสัญญายังอยู่ในระยะปกติ</Text>
                            </Box>
                        ) : (
                            <Table variant="simple" size="sm">
                                <Thead>
                                    <Tr>
                                        <Th>เลขที่สัญญา</Th>
                                        <Th>สมาชิก</Th>
                                        <Th isNumeric>ยอดคงเหลือ</Th>
                                        <Th>วันครบกำหนด</Th>
                                    </Tr>
                                </Thead>
                                <Tbody>
                                    {nearDue.map((contract) => (
                                        <Tr key={contract.contract_id}>
                                            <Td>{contract.contract_no}</Td>
                                            <Td>{`${contract.first_name} ${contract.last_name}`}</Td>
                                            <Td isNumeric>{formatCurrency(contract.balance)}</Td>
                                            <Td>
                                                <Badge colorScheme="orange">
                                                    {contract.days_until_due} วัน
                                                </Badge>
                                            </Td>
                                        </Tr>
                                    ))}
                                </Tbody>
                            </Table>
                        )}
                    </CardBody>
                </Card>

                {/* การชำระเงินล่าสุด */}
                <Card>
                    <CardHeader>
                        <Heading size="md">การชำระเงินล่าสุด</Heading>
                    </CardHeader>
                    <CardBody>
                        {recentPayments.length === 0 ? (
                            <Box textAlign="center" py={8}>
                                <Icon as={FiInbox} boxSize={12} color="gray.300" mb={3} />
                                <Text color="gray.500" fontSize="sm">ยังไม่มีการชำระเงิน</Text>
                                <Text color="gray.400" fontSize="xs">รอการบันทึกการชำระเงินครั้งแรก</Text>
                            </Box>
                        ) : (
                            <Table variant="simple" size="sm">
                                <Thead>
                                    <Tr>
                                        <Th>วันที่</Th>
                                        <Th>เลขที่สัญญา</Th>
                                        <Th>ประเภท</Th>
                                        <Th isNumeric>จำนวนเงิน</Th>
                                    </Tr>
                                </Thead>
                                <Tbody>
                                    {recentPayments.map((payment) => (
                                        <Tr key={payment.id}>
                                            <Td>{formatThaiDate(payment.payment_date)}</Td>
                                            <Td>{payment.loan_contracts?.contract_no}</Td>
                                            <Td>
                                                <Badge colorScheme="green">
                                                    {getPaymentTypeText(payment.payment_type)}
                                                </Badge>
                                            </Td>
                                            <Td isNumeric>{formatCurrency(payment.amount)}</Td>
                                        </Tr>
                                    ))}
                                </Tbody>
                            </Table>
                        )}
                    </CardBody>
                </Card>
            </SimpleGrid>

            {/* สัญญาค้างชำระ */}
            {overdueContracts.length > 0 && (
                <Card mt={6}>
                    <CardHeader>
                        <Heading size="md" color="red.600">
                            สัญญาค้างชำระ ({overdueContracts.length})
                        </Heading>
                    </CardHeader>
                    <CardBody>
                        <Table variant="simple">
                            <Thead>
                                <Tr>
                                    <Th>เลขที่สัญญา</Th>
                                    <Th>สมาชิก</Th>
                                    <Th>เบอร์โทร</Th>
                                    <Th isNumeric>ยอดคงเหลือ</Th>
                                    <Th>วันครบกำหนด</Th>
                                    <Th>สถานะ</Th>
                                </Tr>
                            </Thead>
                            <Tbody>
                                {overdueContracts.map((contract) => (
                                    <Tr key={contract.contract_id}>
                                        <Td>{contract.contract_no}</Td>
                                        <Td>{`${contract.first_name} ${contract.last_name}`}</Td>
                                        <Td>{contract.phone}</Td>
                                        <Td isNumeric fontWeight="bold" color="red.600">
                                            {formatCurrency(contract.balance)}
                                        </Td>
                                        <Td>{formatThaiDate(contract.end_date)}</Td>
                                        <Td>
                                            <Badge colorScheme={getStatusColor(contract.status)}>
                                                {getStatusText(contract.status)}
                                            </Badge>
                                        </Td>
                                    </Tr>
                                ))}
                            </Tbody>
                        </Table>
                    </CardBody>
                </Card>
            )}
        </Container>
    )
}
