import { Box, VStack, Icon, Text, Flex, useColorModeValue } from '@chakra-ui/react'
import { NavLink } from 'react-router-dom'
import {
    FiHome,
    FiUsers,
    FiFileText,
    FiDollarSign
} from 'react-icons/fi'

const NavItem = ({ icon, children, to }) => {
    const activeBg = useColorModeValue('brand.50', 'brand.900')
    const activeColor = useColorModeValue('brand.600', 'brand.200')
    const hoverBg = useColorModeValue('gray.100', 'gray.700')

    return (
        <NavLink to={to} style={{ width: '100%' }}>
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

export default function Sidebar() {
    const bg = useColorModeValue('white', 'gray.900')
    const borderColor = useColorModeValue('gray.200', 'gray.700')

    return (
        <Box
            bg={bg}
            borderRight="1px"
            borderRightColor={borderColor}
            w={{ base: 'full', md: 60 }}
            h="full"
            display={{ base: 'none', md: 'block' }}
        >
            <VStack spacing={1} align="stretch" mt={4}>
                <NavItem icon={FiHome} to="/">
                    หน้าหลัก
                </NavItem>
                <NavItem icon={FiUsers} to="/members">
                    สมาชิก
                </NavItem>
                <NavItem icon={FiFileText} to="/contracts">
                    สัญญาเงินกู้
                </NavItem>
                <NavItem icon={FiDollarSign} to="/payments">
                    การชำระเงิน
                </NavItem>
            </VStack>
        </Box>
    )
}
