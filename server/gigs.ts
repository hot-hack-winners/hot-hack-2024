import executeQuery from "@/lib/db";
import { z } from 'zod';

const gigSchema = z.object(
    {
        uuid: z.string().optional(),
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

export function addGig(gig: Gig) {
    // Start time and End time need to be in ISO format, eg: 2024-01-19T12:00:00Z
    return executeQuery(
        'INSERT INTO gigs (uuid, venue_uuid, start_time, end_time, spotify_playlist_id) VALUES(uuid(), ?, ?, ?, ?)',
        [gig.venue_uuid, gig.start_time, gig.end_time, gig.spotify_playlist_id]
    )
}