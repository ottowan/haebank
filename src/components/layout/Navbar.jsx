import {
    Box,
    Flex,
    Avatar,
    HStack,
    IconButton,
    Button,
    Menu,
    MenuButton,
    MenuList,
    MenuItem,
    MenuDivider,
    useColorModeValue,
    Text,
    useToast,
    useColorMode,
} from '@chakra-ui/react'
import { FiBell, FiChevronDown, FiMenu, FiMoon, FiSun } from 'react-icons/fi'
import { useAuth } from '../../hooks/useAuth'
import { useNavigate } from 'react-router-dom'

export default function Navbar({ onOpen }) {
    const { user, signOut } = useAuth()
    const { colorMode, toggleColorMode } = useColorMode()
    const navigate = useNavigate()
    const toast = useToast()

    const handleSignOut = async () => {
        const { error } = await signOut()
        if (error) {
            toast({
                title: 'เกิดข้อผิดพลาด',
                description: error.message,
                status: 'error',
                duration: 3000,
                isClosable: true,
            })
        } else {
            navigate('/login')
        }
    }

    return (
        <Box
            bg={useColorModeValue('white', 'gray.900')}
            px={4}
            borderBottomWidth="1px"
            borderBottomColor={useColorModeValue('gray.200', 'gray.700')}
        >
            <Flex h={16} alignItems="center" justifyContent="space-between">
                <IconButton
                    display={{ base: 'flex', md: 'none' }}
                    onClick={onOpen}
                    variant="outline"
                    aria-label="open menu"
                    icon={<FiMenu />}
                    mr={4}
                />

                <Text fontSize="xl" fontWeight="bold" color="brand.600">
                    ระบบลูกหนี้เงินกู้
                </Text>

                <HStack spacing={4}>
                    <IconButton
                        size="lg"
                        variant="ghost"
                        aria-label="Toggle Color Mode"
                        onClick={toggleColorMode}
                        icon={colorMode === 'light' ? <FiMoon /> : <FiSun />}
                    />
                    <IconButton
                        size="lg"
                        variant="ghost"
                        aria-label="แจ้งเตือน"
                        icon={<FiBell />}
                    />

                    <Menu>
                        <MenuButton
                            as={Button}
                            rounded="full"
                            variant="link"
                            cursor="pointer"
                            minW={0}
                        >
                            <HStack>
                                <Avatar
                                    size="sm"
                                    name={user?.email}
                                    bg="brand.500"
                                />
                                <Text display={{ base: 'none', md: 'flex' }} fontSize="sm">
                                    {user?.email}
                                </Text>
                                <FiChevronDown />
                            </HStack>
                        </MenuButton>
                        <MenuList>
                            <MenuItem>โปรไฟล์</MenuItem>
                            <MenuItem>ตั้งค่า</MenuItem>
                            <MenuDivider />
                            <MenuItem onClick={handleSignOut} color="red.500">
                                ออกจากระบบ
                            </MenuItem>
                        </MenuList>
                    </Menu>
                </HStack>
            </Flex>
        </Box>
    )
}
