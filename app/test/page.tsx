'use client'

import DarkChart from '@/components/DarkChart'
import VenuesDashboard from '@/components/VenuesDashboard'
import Scheduler from '@/components/ui/scheduler'

import { useTheme } from "next-themes"

export default function Page() {
    const { setTheme } = useTheme()
    setTheme("dark")

    return <VenuesDashboard/>
}
