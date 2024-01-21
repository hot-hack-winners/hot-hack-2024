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
