'use server'
import executeQuery from "@/lib/db";
import { z } from 'zod';
import bcrypt from 'bcrypt';

const attendeeSchema = z.object(
    {
        uuid: z.string().optional(),
        spotify_id: z.string().optional(),
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
    return result.length > 0;
}


export async function getAttendeeByID(attendeeId: string) {
    return await executeQuery<Attendee>(
        'SELECT * FROM attendees where uuid = ?;',
        [attendeeId]
    )
}

export async function addAttendee(attendee: Attendee) {
    return await executeQuery(
        'INSERT INTO attendees (uuid, spotify_id, name, email) VALUES(uuid(), ?, ?, ?)',
        [attendee.spotify_id, attendee.name, attendee.email]
    )
}

export async function addAttendeeIfNotExists(attendee: Attendee) {
    // Check if attendee already exists
    const exists = await attendeeExists(attendee.email); // You can use email or spotify_id as the identifier
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
