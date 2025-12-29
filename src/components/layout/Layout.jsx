import { Box, Flex } from '@chakra-ui/react'
import Navbar from './Navbar'
import Sidebar from './Sidebar'

export default function Layout({ children }) {
    return (
        <Flex h="100vh" overflow="hidden">
            {/* Sidebar */}
            <Sidebar />

            {/* Main Content */}
            <Flex flex="1" direction="column" overflow="hidden">
                {/* Navbar */}
                <Navbar />

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
