import executeQuery from "@/lib/db";
import { z } from 'zod';

const venueSchema = z.object(
    {
        uuid: z.string(),
        organisations_uuid: z.string(),
        name: z.string(),
        address: z.string(),
    }
)

export type Venue = z.infer<typeof venueSchema>

export function getAllVenues() {
    return executeQuery<Venue[]>(
        'SELECT * FROM venues',
        []
    )
}

export function getVenueByID(venueId: string) {
    const data = executeQuery<Venue>(
        'SELECT * FROM venues where uuid = ?;',
        [venueId]
    )
    return data
}

export function addVenue(venue: Saveable<Venue>) {
    return executeQuery(
        'INSERT INTO venues (uuid, organisations_uuid, name, address) VALUES(uuid(), ?, ?, ?)',
        [venue.organisations_uuid, venue.name, venue.address]
    )
}