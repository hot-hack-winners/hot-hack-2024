import executeQuery from "@/lib/db";
import { z } from 'zod';

const gigSchema = z.object(
    {
        uuid: z.string(),
        venue_uuid: z.string(),
        start_time: z.string().datetime(),
        end_time: z.string().datetime(),
        spotify_playlist_id: z.string().optional()
    }
)

export type Gig = z.infer<typeof gigSchema>

export function getAllGigs() {
    return executeQuery<Gig[]>(
        'SELECT * FROM gigs',
        []
    )
}

// getCurrentVenueGig()
export function getCurrentVenueGig(venueId: string, currentTime: string) {
    // Current time need to be in ISO format, eg: 2024-01-19T12:00:00Z
    const data = executeQuery<Gig>(
        `SELECT * FROM gigs 
        where venue_uuid = ? 
            and ? >= start_time
            and ? <= end_time`,
        [venueId, currentTime, currentTime]
    )
    return data
}

export function getGigByID(gigId: string) {
    const data = executeQuery<Gig>(
        'SELECT * FROM gigs where uuid = ?;',
        [gigId]
    )
    return data
}

export function addGig(gig: Saveable<Gig>) {
    // Start time and End time need to be in ISO format, eg: 2024-01-19T12:00:00Z
    return executeQuery(
        'INSERT INTO gigs (uuid, venue_uuid, start_time, end_time, spotify_playlist_id) VALUES(uuid(), ?, ?, ?, ?)',
        [gig.venue_uuid, gig.start_time, gig.end_time, gig.spotify_playlist_id]
    )
}