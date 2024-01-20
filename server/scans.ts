import executeQuery from "@/lib/db";
import { z } from 'zod';

const scanSchema = z.object(
    {
        scans_uuid: z.string().optional(),
        timestamp: z.string().datetime(),
        attendee_uuid: z.string().optional(),
        gigs_uuid: z.string().optional(),
        venue_uuid: z.string().optional(),
    }
)

export type Scan = z.infer<typeof scanSchema>

export function getAllScans() {
    return executeQuery<Scan[]>(
        'SELECT * FROM scans',
        []
    )
}

export function addScan(scan: Scan) {
    // Start time and End time need to be in ISO format, eg: 2024-01-19T12:00:00Z
    return executeQuery(
        'INSERT INTO scans (scans_uuid, timestamp, attendee_uuid, gigs_uuid, venue_uuid) VALUES(uuid(), ?, ?, ?, ?)',
        [scan.timestamp, scan.attendee_uuid, scan.gigs_uuid, scan.venue_uuid]
    )
}