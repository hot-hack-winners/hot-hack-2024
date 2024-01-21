'use client'

import {ScanDashboard} from '@/components/ScanDashboard'


interface PageProps {
    params: {
        venueUuid: string
    }
}
export default function Page(props: PageProps) {
    return (
        <ScanDashboard playlistId={'5VwYIrOYiEH3NFGysW3KGK'} venueUuid={props.params.venueUuid} />
    );
}
