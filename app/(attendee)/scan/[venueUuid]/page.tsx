'use client'

import {ScanDashboard} from '@/components/ScanDashboard'


import { beginLogin } from '../auth/spotify'
import useUser from '../auth/use-user'

//import Nav from 'components/nav'
import { useRouter } from 'next/navigation'
import { useEffect } from 'react'


export default function Page() {


    return <ScanDashboard playlistId={'12b8Y3MRyU6TX8D3a8LdAJ'} />
}
