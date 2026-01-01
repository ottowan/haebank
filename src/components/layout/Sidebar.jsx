import { Box, VStack, Icon, Text, Flex, useColorModeValue, CloseButton } from '@chakra-ui/react'
import { NavLink } from 'react-router-dom'
import {
    FiHome,
    FiUsers,
    FiFileText,
    FiDollarSign
} from 'react-icons/fi'

const NavItem = ({ icon, children, to, onClose }) => {
    const activeBg = useColorModeValue('brand.50', 'brand.900')
    const activeColor = useColorModeValue('brand.600', 'brand.200')
    const hoverBg = useColorModeValue('gray.100', 'gray.700')

    return (
        <NavLink to={to} style={{ width: '100%' }} onClick={onClose}>
            {({ isActive }) => (
                <Flex
                    align="center"
                    p={4}
                    mx={2}
                    borderRadius="lg"
                    role="group"
                    cursor="pointer"
                    bg={isActive ? activeBg : 'transparent'}
                    color={isActive ? activeColor : 'inherit'}
                    _hover={{
                        bg: hoverBg,
                        color: activeColor,
                    }}
                    transition="all 0.2s"
                >
                    <Icon
                        mr={4}
                        fontSize="20"
                        as={icon}
                    />
                    <Text fontWeight={isActive ? 'semibold' : 'normal'}>
                        {children}
                    </Text>
                </Flex>
            )}
        </NavLink>
    )
}

export const SidebarContent = ({ onClose, ...rest }) => {
    return (
        <Box
            bg={useColorModeValue('white', 'gray.900')}
            borderRight="1px"
            borderRightColor={useColorModeValue('gray.200', 'gray.700')}
            w={{ base: 'full', md: 60 }}
            h="full"
            {...rest}
        >
            <Flex h="20" alignItems="center" mx="8" justifyContent="space-between">
                <Text fontSize="lg" fontWeight="bold" color={useColorModeValue('brand.600', 'white')}>
                    ระบบลูกหนี้เงินกู้
                </Text>
                <CloseButton display={{ base: 'flex', md: 'none' }} onClick={onClose} />
            </Flex>
            <VStack spacing={1} align="stretch" mt={4}>
                <NavItem icon={FiHome} to="/" onClose={onClose}>
                    หน้าหลัก
                </NavItem>
                <NavItem icon={FiUsers} to="/members" onClose={onClose}>
                    สมาชิก
                </NavItem>
                <NavItem icon={FiFileText} to="/contracts" onClose={onClose}>
                    สัญญาเงินกู้
                </NavItem>
                <NavItem icon={FiDollarSign} to="/payments" onClose={onClose}>
                    การชำระเงิน
                </NavItem>
            </VStack>
        </Box>
    )
}

export default function Sidebar() {
    return (
        <Box display={{ base: 'none', md: 'block' }}>
            <SidebarContent />
        </Box>
    )
}
