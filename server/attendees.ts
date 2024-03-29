'use server'
import executeQuery from "@/lib/db";
import { z } from 'zod';
import bcrypt from 'bcrypt';

const attendeeSchema = z.object(
    {
        uuid: z.string(),
        spotify_id: z.string(),
        name: z.string(),
        email: z.string(),
    }
)

export type Attendee = z.infer<typeof attendeeSchema>

export async function getAllAttendees() {
    return await executeQuery<Attendee[]>(
        'SELECT * FROM attendees',
        []
    )
}
export async function attendeeExists(identifier: string) {
    const result = await executeQuery<Attendee[]>(
        'SELECT * FROM attendees WHERE email = ? OR spotify_id = ?',
        [identifier, identifier]
    );
    return !('error' in result) && result.length > 0;
}


export async function getAttendeeByID(attendeeId: string) {
    return await executeQuery<Attendee[]>(
        'SELECT * FROM attendees where uuid = ?;',
        [attendeeId]
    )
}

export async function getAttendeeBySpotifyID(spotify_id: string) {
    return await executeQuery<Attendee[]>(
        'SELECT * FROM attendees where spotify_id = ?;',
        [spotify_id]
    )
}

export async function addAttendee(attendee: Saveable<Attendee>) {
    return await executeQuery(
        'INSERT INTO attendees (uuid, spotify_id, name, email) VALUES(uuid(), ?, ?, ?)',
        [attendee.spotify_id, attendee.name, attendee.email]
    )
}

export async function addAttendeeIfNotExists(attendee: Saveable<Attendee>) {
    // Check if attendee already exists
    const exists = await attendeeExists(attendee.spotify_id); // You can use email or spotify_id as the identifier
    if (!exists) {
        // Add the attendee if they don't exist
        return await addAttendee(attendee);
    } else {
        // Attendee already exists
        console.log('Attendee already exists');
        // Optionally, return the existing attendee's details or a relevant message
        return 'Attendee already exists';
    }
}
