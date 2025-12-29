import { Routes, Route, Navigate } from 'react-router-dom'
import { useAuth } from './hooks/useAuth'
import { Box, Spinner, Center } from '@chakra-ui/react'

// Pages
import LoginPage from './pages/LoginPage'
import DashboardPage from './pages/DashboardPage'
import MembersPage from './pages/MembersPage'
import MemberDetailPage from './pages/MemberDetailPage'
import ContractsPage from './pages/ContractsPage'
import ContractDetailPage from './pages/ContractDetailPage'
import PaymentsPage from './pages/PaymentsPage'

// Layout
import Layout from './components/layout/Layout'

function ProtectedRoute({ children }) {
    const { user, loading } = useAuth()

    if (loading) {
        return (
            <Center h="100vh">
                <Spinner size="xl" color="brand.500" thickness="4px" />
            </Center>
        )
    }

    if (!user) {
        return <Navigate to="/login" replace />
    }

    return <Layout>{children}</Layout>
}

function App() {
    const { user, loading } = useAuth()

    if (loading) {
        return (
            <Center h="100vh">
                <Spinner size="xl" color="brand.500" thickness="4px" />
            </Center>
        )
    }

    return (
        <Box minH="100vh">
            <Routes>
                <Route
                    path="/login"
                    element={user ? <Navigate to="/" replace /> : <LoginPage />}
                />

                <Route
                    path="/"
                    element={
                        <ProtectedRoute>
                            <DashboardPage />
                        </ProtectedRoute>
                    }
                />

                <Route
                    path="/members"
                    element={
                        <ProtectedRoute>
                            <MembersPage />
                        </ProtectedRoute>
                    }
                />

                <Route
                    path="/members/:id"
                    element={
                        <ProtectedRoute>
                            <MemberDetailPage />
                        </ProtectedRoute>
                    }
                />

                <Route
                    path="/contracts"
                    element={
                        <ProtectedRoute>
                            <ContractsPage />
                        </ProtectedRoute>
                    }
                />

                <Route
                    path="/contracts/:id"
                    element={
                        <ProtectedRoute>
                            <ContractDetailPage />
                        </ProtectedRoute>
                    }
                />

                <Route
                    path="/payments"
                    element={
                        <ProtectedRoute>
                            <PaymentsPage />
                        </ProtectedRoute>
                    }
                />

                <Route path="*" element={<Navigate to="/" replace />} />
            </Routes>
        </Box>
    )
}

export default App
// Force rebuild
