'use client'
import {UserLogin} from '@/components/UserLogin'
import { useEffect } from 'react'
import {ScanDashboard} from '@/components/ScanDashboard'
import useUser from '@/auth/use-user'
import { useRouter } from 'next/navigation'



export default function Page() {
    const { user, loggedOut, isLoading, mutate } = useUser()

    return user ? <ScanDashboard playlistId={'3cEYpjA9oz9GiPac4AsH4n'} /> :  <UserLogin/>
}