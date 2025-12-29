import { useState } from 'react'
import {
    Box,
    Button,
    Container,
    FormControl,
    FormLabel,
    Input,
    Stack,
    Heading,
    Text,
    useColorModeValue,
    useToast,
    InputGroup,
    InputRightElement,
    IconButton,
} from '@chakra-ui/react'
import { FiEye, FiEyeOff } from 'react-icons/fi'
import { useAuth } from '../hooks/useAuth'
import { useNavigate } from 'react-router-dom'

export default function LoginPage() {
    const [email, setEmail] = useState('')
    const [password, setPassword] = useState('')
    const [showPassword, setShowPassword] = useState(false)
    const [loading, setLoading] = useState(false)
    const { signIn } = useAuth()
    const navigate = useNavigate()
    const toast = useToast()

    const handleSubmit = async (e) => {
        e.preventDefault()
        setLoading(true)

        const { error } = await signIn(email, password)

        if (error) {
            toast({
                title: 'เข้าสู่ระบบไม่สำเร็จ',
                description: error.message,
                status: 'error',
                duration: 3000,
                isClosable: true,
            })
        } else {
            toast({
                title: 'เข้าสู่ระบบสำเร็จ',
                status: 'success',
                duration: 2000,
                isClosable: true,
            })
            navigate('/')
        }

        setLoading(false)
    }

    return (
        <Box
            minH="100vh"
            display="flex"
            alignItems="center"
            justifyContent="center"
            bg={useColorModeValue('gray.50', 'gray.800')}
        >
            <Container maxW="md">
                <Box
                    bg={useColorModeValue('white', 'gray.700')}
                    p={8}
                    borderRadius="lg"
                    boxShadow="lg"
                >
                    <Stack spacing={6}>
                        <Stack spacing={2} textAlign="center">
                            <Heading size="xl" color="brand.600">
                                ระบบลูกหนี้เงินกู้
                            </Heading>
                            <Text color="gray.600">
                                HAE Bank Loan Management System
                            </Text>
                        </Stack>

                        <form onSubmit={handleSubmit}>
                            <Stack spacing={4}>
                                <FormControl isRequired>
                                    <FormLabel>อีเมล</FormLabel>
                                    <Input
                                        type="email"
                                        value={email}
                                        onChange={(e) => setEmail(e.target.value)}
                                        placeholder="your@email.com"
                                    />
                                </FormControl>

                                <FormControl isRequired>
                                    <FormLabel>รหัสผ่าน</FormLabel>
                                    <InputGroup>
                                        <Input
                                            type={showPassword ? 'text' : 'password'}
                                            value={password}
                                            onChange={(e) => setPassword(e.target.value)}
                                            placeholder="••••••••"
                                        />
                                        <InputRightElement>
                                            <IconButton
                                                size="sm"
                                                variant="ghost"
                                                icon={showPassword ? <FiEyeOff /> : <FiEye />}
                                                onClick={() => setShowPassword(!showPassword)}
                                                aria-label={showPassword ? 'ซ่อนรหัสผ่าน' : 'แสดงรหัสผ่าน'}
                                            />
                                        </InputRightElement>
                                    </InputGroup>
                                </FormControl>

                                <Button
                                    type="submit"
                                    colorScheme="brand"
                                    size="lg"
                                    isLoading={loading}
                                    loadingText="กำลังเข้าสู่ระบบ..."
                                >
                                    เข้าสู่ระบบ
                                </Button>
                            </Stack>
                        </form>

                        <Text fontSize="sm" color="gray.600" textAlign="center">
                            สำหรับผู้ดูแลระบบและเจ้าหน้าที่เท่านั้น
                        </Text>
                    </Stack>
                </Box>
            </Container>
        </Box>
    )
}
