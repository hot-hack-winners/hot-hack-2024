import executeQuery from "@/lib/db";
import { z } from 'zod';

const venueSchema = z.object(
    {
        venues_uuid: z.string().optional(),
        organisation_uuid: z.string().optional(),
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

export function addVenue(venue: Venue) {
    return executeQuery(
        'INSERT INTO venues (venues_uuid, organisation_uuid, name, address) VALUES(uuid(), ?, ?, ?)',
        [venue.organisation_uuid, venue.name, venue.address]
    )
}