import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import { ChakraProvider, extendTheme } from '@chakra-ui/react'
import { BrowserRouter } from 'react-router-dom'
import App from './App.jsx'

// กำหนด Theme สำหรับ Chakra UI
const theme = extendTheme({
    fonts: {
        heading: `'Noto Sans Thai', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif`,
        body: `'Noto Sans Thai', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif`,
    },
    colors: {
        brand: {
            50: '#e3f2fd',
            100: '#bbdefb',
            200: '#90caf9',
            300: '#64b5f6',
            400: '#42a5f5',
            500: '#2196f3',
            600: '#1e88e5',
            700: '#1976d2',
            800: '#1565c0',
            900: '#0d47a1',
        },
    },
    config: {
        initialColorMode: 'light',
        useSystemColorMode: false,
    },
    styles: {
        global: {
            body: {
                bg: 'gray.50',
            },
        },
    },
})

createRoot(document.getElementById('root')).render(
    <StrictMode>
        <ChakraProvider theme={theme}>
            <BrowserRouter>
                <App />
            </BrowserRouter>
        </ChakraProvider>
    </StrictMode>,
)
