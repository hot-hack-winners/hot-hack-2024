'use client'

import {ScanDashboard} from '@/components/ScanDashboard'


interface PageProps {
    params: {
        venueUuid: string
    }
}
export default function Page(props: PageProps) {
    return (
        <ScanDashboard playlistId={'3cEYpjA9oz9GiPac4AsH4n'} venueUuid={props.params.venueUuid} />
    );
}
