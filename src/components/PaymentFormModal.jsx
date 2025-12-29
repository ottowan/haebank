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
    Select,
    Input,
    Textarea,
    VStack,
    HStack,
    Text,
    useToast,
    Box,
    Divider,
    Badge
} from '@chakra-ui/react';
import { createPayment } from '../services/paymentService';
import { getActiveContracts } from '../services/contractService';
import { formatCurrency, getPaymentTypeText } from '../utils/formatters';
import { calculateLoanDetails } from '../utils/interestCalculator';

const PaymentFormModal = ({ isOpen, onClose, onSuccess, preSelectedContractId = null }) => {
    const [contracts, setContracts] = useState([]);
    const [selectedContract, setSelectedContract] = useState(null);
    const [searchTerm, setSearchTerm] = useState('');
    const [showDropdown, setShowDropdown] = useState(false);
    const [paymentData, setPaymentData] = useState({
        contract_id: '',
        amount: '',
        payment_type: 'installment',
        note: ''
    });
    const [loading, setLoading] = useState(false);
    const [loadingContracts, setLoadingContracts] = useState(true);
    const toast = useToast();

    // โหลดรายการสัญญาที่ใช้งานอยู่
    useEffect(() => {
        loadContracts();
    }, []);

    // ถ้ามีการเลือกสัญญาล่วงหน้า
    useEffect(() => {
        if (preSelectedContractId && contracts.length > 0) {
            const contract = contracts.find(c => c.id === preSelectedContractId);
            if (contract) {
                setSelectedContract(contract);
                setPaymentData(prev => ({ ...prev, contract_id: preSelectedContractId }));
            }
        }
    }, [preSelectedContractId, contracts]);

    const loadContracts = async () => {
        try {
            setLoadingContracts(true);
            const data = await getActiveContracts();
            setContracts(data || []);
        } catch (error) {
            toast({
                title: 'เกิดข้อผิดพลาด',
                description: 'ไม่สามารถโหลดรายการสัญญาได้',
                status: 'error',
                duration: 3000,
                isClosable: true,
            });
        } finally {
            setLoadingContracts(false);
        }
    };

    const handleContractChange = (contractId) => {
        const contract = contracts.find(c => c.id === parseInt(contractId));
        setSelectedContract(contract);
        setPaymentData(prev => ({ ...prev, contract_id: contractId }));
    };

    const handleSubmit = async (e) => {
        e.preventDefault();

        // Validation
        if (!paymentData.contract_id) {
            toast({
                title: 'กรุณาเลือกสัญญา',
                status: 'warning',
                duration: 3000,
                isClosable: true,
            });
            return;
        }

        if (!paymentData.amount || parseFloat(paymentData.amount) <= 0) {
            toast({
                title: 'กรุณากรอกจำนวนเงินที่ถูกต้อง',
                status: 'warning',
                duration: 3000,
                isClosable: true,
            });
            return;
        }

        // ตรวจสอบว่าจำนวนเงินไม่เกินยอดคงเหลือ
        if (selectedContract) {
            const details = calculateLoanDetails(
                selectedContract.principal_amount,
                selectedContract.interest_rate,
                selectedContract.start_date,
                selectedContract.loan_period_months
            );

            const remainingBalance = details.totalAmount - (selectedContract.total_paid || 0);

            if (parseFloat(paymentData.amount) > remainingBalance) {
                toast({
                    title: 'จำนวนเงินเกินยอดคงเหลือ',
                    description: `ยอดคงเหลือ: ${formatCurrency(remainingBalance)}`,
                    status: 'warning',
                    duration: 3000,
                    isClosable: true,
                });
                return;
            }
        }

        try {
            setLoading(true);
            await createPayment({
                contract_id: parseInt(paymentData.contract_id),
                amount: parseFloat(paymentData.amount),
                payment_type: paymentData.payment_type,
                note: paymentData.note || null
            });

            toast({
                title: 'บันทึกการชำระเงินสำเร็จ',
                status: 'success',
                duration: 3000,
                isClosable: true,
            });

            // Reset form
            setPaymentData({
                contract_id: '',
                amount: '',
                payment_type: 'installment',
                note: ''
            });
            setSelectedContract(null);

            if (onSuccess) onSuccess();
            onClose();
        } catch (error) {
            toast({
                title: 'เกิดข้อผิดพลาด',
                description: error.message || 'ไม่สามารถบันทึกการชำระเงินได้',
                status: 'error',
                duration: 5000,
                isClosable: true,
            });
        } finally {
            setLoading(false);
        }
    };

    // คำนวณข้อมูลสัญญาที่เลือก
    const contractDetails = selectedContract ? calculateLoanDetails(
        selectedContract.principal_amount,
        selectedContract.interest_rate,
        selectedContract.start_date,
        selectedContract.loan_period_months
    ) : null;

    const remainingBalance = contractDetails
        ? contractDetails.totalAmount - (selectedContract.total_paid || 0)
        : 0;

    // กรองสัญญาตามคำค้นหา
    const filteredContracts = contracts.filter(contract => {
        if (!searchTerm.trim()) return true;

        const search = searchTerm.toLowerCase();
        const contractNo = contract.contract_no?.toLowerCase() || '';
        const firstName = contract.first_name?.toLowerCase() || '';
        const lastName = contract.last_name?.toLowerCase() || '';
        const memberCode = contract.member_code?.toLowerCase() || '';

        return contractNo.includes(search) ||
            firstName.includes(search) ||
            lastName.includes(search) ||
            memberCode.includes(search);
    });

    return (
        <Modal isOpen={isOpen} onClose={onClose} size="xl">
            <ModalOverlay />
            <ModalContent>
                <ModalHeader>บันทึกการชำระเงิน</ModalHeader>
                <ModalCloseButton />

                <form onSubmit={handleSubmit}>
                    <ModalBody>
                        <VStack spacing={4} align="stretch">
                            {/* เลือกสัญญา */}
                            <FormControl isRequired>
                                <FormLabel>เลือกสัญญา</FormLabel>

                                {preSelectedContractId ? (
                                    <Input
                                        value={selectedContract ? `${selectedContract.contract_no} - ${selectedContract.title_prefix || ''}${selectedContract.first_name} ${selectedContract.last_name}` : ''}
                                        isReadOnly
                                        bg="gray.100"
                                    />
                                ) : (
                                    <Box position="relative">
                                        <Input
                                            placeholder="พิมพ์เลขที่สัญญา, ชื่อ หรือนามสกุล เพื่อค้นหา..."
                                            value={searchTerm}
                                            onChange={(e) => {
                                                setSearchTerm(e.target.value);
                                                setSelectedContract(null); // Clear selection when typing
                                                setPaymentData(prev => ({ ...prev, contract_id: '' }));
                                                setShowDropdown(true);
                                            }}
                                            onFocus={() => setShowDropdown(true)}
                                            onBlur={() => {
                                                // Delay hiding to allow click event on list item to fire
                                                setTimeout(() => setShowDropdown(false), 200);
                                            }}
                                        />

                                        {/* Dropdown List */}
                                        {showDropdown && !selectedContract && filteredContracts.length > 0 && (
                                            <Box
                                                position="absolute"
                                                top="100%"
                                                left={0}
                                                right={0}
                                                zIndex={10}
                                                bg="white"
                                                boxShadow="lg"
                                                borderRadius="md"
                                                maxH="200px"
                                                overflowY="auto"
                                                mt={1}
                                                border="1px solid"
                                                borderColor="gray.200"
                                            >
                                                {filteredContracts.map((contract) => {
                                                    const details = calculateLoanDetails(
                                                        contract.principal_amount,
                                                        contract.interest_rate,
                                                        contract.start_date,
                                                        contract.loan_period_months
                                                    );
                                                    const balance = details.totalAmount - (contract.total_paid || 0);

                                                    return (
                                                        <Box
                                                            key={contract.contract_id || contract.id}
                                                            p={3}
                                                            cursor="pointer"
                                                            _hover={{ bg: "blue.50" }}
                                                            onClick={() => {
                                                                handleContractChange(contract.contract_id || contract.id);
                                                                setSearchTerm(`${contract.contract_no} - ${contract.title_prefix || ''}${contract.first_name} ${contract.last_name}`);
                                                                setShowDropdown(false);
                                                            }}
                                                            borderBottom="1px solid"
                                                            borderColor="gray.100"
                                                        >
                                                            <Text fontWeight="bold" fontSize="sm">
                                                                {contract.contract_no} - {contract.title_prefix || ''}{contract.first_name} {contract.last_name}
                                                            </Text>
                                                            <Text fontSize="xs" color="gray.500">
                                                                ยอดคงเหลือ: {formatCurrency(balance)}
                                                            </Text>
                                                        </Box>
                                                    );
                                                })}
                                            </Box>
                                        )}

                                        {showDropdown && searchTerm && !selectedContract && filteredContracts.length === 0 && (
                                            <Box
                                                position="absolute"
                                                top="100%"
                                                left={0}
                                                right={0}
                                                zIndex={10}
                                                bg="white"
                                                boxShadow="md"
                                                p={3}
                                                mt={1}
                                                borderRadius="md"
                                                border="1px solid"
                                                borderColor="gray.200"
                                            >
                                                <Text color="red.500" fontSize="sm">ไม่พบข้อมูลสัญญา</Text>
                                            </Box>
                                        )}
                                    </Box>
                                )}
                            </FormControl>

                            {/* แสดงข้อมูลสัญญาที่เลือก */}
                            {selectedContract && contractDetails && (
                                <Box p={4} bg="gray.50" borderRadius="md" borderWidth="1px">
                                    <VStack align="stretch" spacing={2}>
                                        <HStack justify="space-between">
                                            <Text fontWeight="bold">เลขที่สัญญา:</Text>
                                            <Text>{selectedContract.contract_no}</Text>
                                        </HStack>
                                        <HStack justify="space-between">
                                            <Text fontWeight="bold">ชื่อสมาชิก:</Text>
                                            <Text>
                                                {selectedContract.title_prefix || ''}{selectedContract.first_name} {selectedContract.last_name}
                                            </Text>
                                        </HStack>
                                        <Divider />
                                        <HStack justify="space-between">
                                            <Text>เงินต้น:</Text>
                                            <Text>{formatCurrency(selectedContract.principal_amount)}</Text>
                                        </HStack>
                                        <HStack justify="space-between">
                                            <Text>ดอกเบี้ยสะสม:</Text>
                                            <Text>{formatCurrency(contractDetails.accumulatedInterest)}</Text>
                                        </HStack>
                                        <HStack justify="space-between">
                                            <Text>ยอดรวมทั้งหมด:</Text>
                                            <Text fontWeight="bold">{formatCurrency(contractDetails.totalAmount)}</Text>
                                        </HStack>
                                        <HStack justify="space-between">
                                            <Text>ชำระแล้ว:</Text>
                                            <Text color="green.600">{formatCurrency(selectedContract.total_paid || 0)}</Text>
                                        </HStack>
                                        <Divider />
                                        <HStack justify="space-between">
                                            <Text fontWeight="bold" fontSize="lg">ยอดคงเหลือ:</Text>
                                            <Text fontWeight="bold" fontSize="lg" color="red.600">
                                                {formatCurrency(remainingBalance)}
                                            </Text>
                                        </HStack>
                                    </VStack>
                                </Box>
                            )}

                            {/* จำนวนเงิน */}
                            <FormControl isRequired>
                                <FormLabel>จำนวนเงินที่ชำระ (บาท)</FormLabel>
                                <Input
                                    type="number"
                                    step="0.01"
                                    min="0"
                                    placeholder="0.00"
                                    value={paymentData.amount}
                                    onChange={(e) => setPaymentData({ ...paymentData, amount: e.target.value })}
                                />
                                {selectedContract && paymentData.amount && (
                                    <Text fontSize="sm" color="gray.600" mt={1}>
                                        คงเหลือหลังชำระ: {formatCurrency(remainingBalance - parseFloat(paymentData.amount || 0))}
                                    </Text>
                                )}
                            </FormControl>

                            {/* ประเภทการชำระ */}
                            <FormControl isRequired>
                                <FormLabel>ประเภทการชำระ</FormLabel>
                                <Select
                                    value={paymentData.payment_type}
                                    onChange={(e) => setPaymentData({ ...paymentData, payment_type: e.target.value })}
                                >
                                    <option value="installment">รายงวด</option>
                                    <option value="partial">ชำระบางส่วน</option>
                                    <option value="close">ปิดยอด</option>
                                </Select>
                                <Text fontSize="sm" color="gray.600" mt={1}>
                                    {getPaymentTypeText(paymentData.payment_type)}
                                </Text>
                            </FormControl>

                            {/* หมายเหตุ */}
                            <FormControl>
                                <FormLabel>หมายเหตุ (ถ้ามี)</FormLabel>
                                <Textarea
                                    placeholder="บันทึกเพิ่มเติม..."
                                    value={paymentData.note}
                                    onChange={(e) => setPaymentData({ ...paymentData, note: e.target.value })}
                                    rows={3}
                                />
                            </FormControl>
                        </VStack>
                    </ModalBody>

                    <ModalFooter>
                        <Button variant="ghost" mr={3} onClick={onClose}>
                            ยกเลิก
                        </Button>
                        <Button
                            colorScheme="blue"
                            type="submit"
                            isLoading={loading}
                            loadingText="กำลังบันทึก..."
                        >
                            บันทึกการชำระเงิน
                        </Button>
                    </ModalFooter>
                </form>
            </ModalContent>
        </Modal>
    );
};

export default PaymentFormModal;
