import executeQuery from "@/lib/db";
import { z } from 'zod';

const scanSchema = z.object(
    {
        uuid: z.string(),
        timestamp: z.string().datetime(),
        attendees_uuid: z.string(),
        gigs_uuid: z.string(),
        venues_uuid: z.string(),
    }
)

export type Scan = z.infer<typeof scanSchema>

export function getAllScans() {
    return executeQuery<Scan[]>(
        'SELECT * FROM scans',
        []
    )
}

export function getScanByID(scanId: string) {
    const data = executeQuery<Scan>(
        'SELECT * FROM scans where uuid = ?;',
        [scanId]
    )
    return data
}

export function addScan(scan: Saveable<Scan>) {
    // Start time and End time need to be in ISO format, eg: 2024-01-19T12:00:00Z
    return executeQuery(
        'INSERT INTO scans (uuid, timestamp, attendees_uuid, gigs_uuid, venues_uuid) VALUES(uuid(), ?, ?, ?, ?)',
        [scan.timestamp, scan.attendees_uuid, scan.gigs_uuid, scan.venues_uuid]
    )
}