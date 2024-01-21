'use server'
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

export async function getAllVenues() {
    return await executeQuery<Venue[]>(
        'SELECT * FROM venues',
        []
    )
}

export async function getVenueByID(venueId: string) {
    const data = await executeQuery<Venue>(
        'SELECT * FROM venues where uuid = ?;',
        [venueId]
    )
    return data
}

export async function addVenue(venue: Saveable<Venue>) {
    return await executeQuery(
        'INSERT INTO venues (uuid, organisations_uuid, name, address) VALUES(uuid(), ?, ?, ?)',
        [venue.organisations_uuid, venue.name, venue.address]
    )
}
