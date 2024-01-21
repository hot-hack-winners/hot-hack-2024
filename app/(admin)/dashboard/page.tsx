'use client'

import VenuesDashboard from '@/components/VenuesDashboard'

import { useTheme } from "next-themes"

export default function Page() {
    const { setTheme } = useTheme()
    setTheme("dark")

    return <VenuesDashboard/>
}
