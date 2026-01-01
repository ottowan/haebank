import { Box, Flex, Drawer, DrawerContent, useDisclosure, DrawerOverlay, DrawerCloseButton, DrawerBody } from '@chakra-ui/react'
import Navbar from './Navbar'
import Sidebar, { SidebarContent } from './Sidebar'

export default function Layout({ children }) {
    const { isOpen, onOpen, onClose } = useDisclosure()

    return (
        <Flex h="100vh" overflow="hidden">
            {/* Sidebar (Desktop) */}
            <Sidebar />

            {/* Sidebar (Mobile Drawer) */}
            <Drawer
                autoFocus={false}
                isOpen={isOpen}
                placement="left"
                onClose={onClose}
                returnFocusOnClose={false}
                onOverlayClick={onClose}
                size="full"
            >
                <DrawerOverlay />
                <DrawerContent>
                    <SidebarContent onClose={onClose} />
                </DrawerContent>
            </Drawer>

            {/* Main Content */}
            <Flex flex="1" direction="column" overflow="hidden">
                {/* Navbar */}
                <Navbar onOpen={onOpen} />

                {/* Page Content */}
                <Box
                    flex="1"
                    overflow="auto"
                    bg="gray.50"
                    p={6}
                >
                    {children}
                </Box>
            </Flex>
        </Flex>
    )
}
