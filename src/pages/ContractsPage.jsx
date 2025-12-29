import { useEffect, useState } from 'react'
import { Link as RouterLink } from 'react-router-dom'
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
    Progress,
    Tooltip,
    useDisclosure,
    IconButton,
    Link,
} from '@chakra-ui/react'
import { FiPlus, FiSearch, FiDollarSign } from 'react-icons/fi'
import { getAllContracts, searchContracts } from '../services/contractService'
import { formatCurrency, getStatusColor, getStatusText } from '../utils/formatters'
import { formatThaiDate } from '../utils/dateHelpers'
import { calculatePaymentProgress } from '../utils/interestCalculator'
import PaymentFormModal from '../components/PaymentFormModal'

export default function ContractsPage() {
    const [contracts, setContracts] = useState([])
    const [loading, setLoading] = useState(true)
    const [searchTerm, setSearchTerm] = useState('')
    const [selectedContractId, setSelectedContractId] = useState(null)
    const { isOpen, onOpen, onClose } = useDisclosure()
    const toast = useToast()

    useEffect(() => {
        loadContracts()
    }, [])

    const loadContracts = async () => {
        try {
            setLoading(true)
            const data = await getAllContracts()
            setContracts(data)
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

    const handleSearch = async () => {
        if (!searchTerm.trim()) {
            loadContracts()
            return
        }

        try {
            setLoading(true)
            const data = await searchContracts(searchTerm)
            setContracts(data)
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

    const handleOpenPaymentForm = (contractId) => {
        setSelectedContractId(contractId)
        onOpen()
    }

    const handlePaymentSuccess = () => {
        loadContracts()
        setSelectedContractId(null)
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
                <Heading>สัญญาเงินกู้</Heading>
                <Button leftIcon={<FiPlus />} colorScheme="brand">
                    สร้างสัญญาใหม่
                </Button>
            </HStack>

            <Card mb={6}>
                <CardBody>
                    <HStack>
                        <Input
                            placeholder="ค้นหาด้วย เลขที่สัญญา, รหัสสมาชิก, ชื่อ, นามสกุล"
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
                        <Button onClick={loadContracts}>รีเซ็ต</Button>
                    </HStack>
                </CardBody>
            </Card>

            <Card>
                <CardBody>
                    {contracts.length === 0 ? (
                        <Text color="gray.500" textAlign="center" py={8}>
                            ไม่พบข้อมูลสัญญา
                        </Text>
                    ) : (
                        <Table variant="simple">
                            <Thead>
                                <Tr>
                                    <Th>เลขที่สัญญา</Th>
                                    <Th>สมาชิก</Th>
                                    <Th isNumeric>เงินต้น</Th>
                                    <Th isNumeric>ดอกเบี้ยสะสม</Th>
                                    <Th isNumeric>ยอดคงเหลือ</Th>
                                    <Th>ความคืบหน้า</Th>
                                    <Th>วันครบกำหนด</Th>
                                    <Th>สถานะ</Th>
                                    <Th>การดำเนินการ</Th>
                                </Tr>
                            </Thead>
                            <Tbody>
                                {contracts.map((contract) => {
                                    const progress = calculatePaymentProgress(
                                        contract.total_paid,
                                        contract.total_amount
                                    )

                                    return (
                                        <Tr key={contract.contract_id}>
                                            <Td>
                                                <Link
                                                    as={RouterLink}
                                                    to={`/contracts/${contract.contract_id}`}
                                                    fontWeight="semibold"
                                                    color="brand.600"
                                                    _hover={{ color: 'brand.700', textDecoration: 'underline' }}
                                                >
                                                    {contract.contract_no}
                                                </Link>
                                            </Td>
                                            <Td>
                                                <Text>{`${contract.first_name} ${contract.last_name}`}</Text>
                                                <Text fontSize="xs" color="gray.500">
                                                    {contract.member_code}
                                                </Text>
                                            </Td>
                                            <Td isNumeric>{formatCurrency(contract.principal_amount)}</Td>
                                            <Td isNumeric>{formatCurrency(contract.accumulated_interest)}</Td>
                                            <Td isNumeric fontWeight="bold">
                                                {formatCurrency(contract.balance)}
                                            </Td>
                                            <Td>
                                                <Tooltip label={`${progress}%`}>
                                                    <Progress
                                                        value={progress}
                                                        size="sm"
                                                        colorScheme={progress === 100 ? 'green' : 'blue'}
                                                        borderRadius="full"
                                                    />
                                                </Tooltip>
                                            </Td>
                                            <Td>{formatThaiDate(contract.end_date)}</Td>
                                            <Td>
                                                <Badge colorScheme={getStatusColor(contract.status)}>
                                                    {getStatusText(contract.status)}
                                                </Badge>
                                            </Td>
                                            <Td>
                                                <Tooltip label="บันทึกการชำระเงิน">
                                                    <IconButton
                                                        icon={<FiDollarSign />}
                                                        size="sm"
                                                        colorScheme="green"
                                                        onClick={() => handleOpenPaymentForm(contract.contract_id)}
                                                        isDisabled={contract.status === 'closed'}
                                                    />
                                                </Tooltip>
                                            </Td>
                                        </Tr>
                                    )
                                })}
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
                preSelectedContractId={selectedContractId}
            />
        </Container>
    )
}
