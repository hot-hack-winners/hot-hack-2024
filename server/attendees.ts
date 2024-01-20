import executeQuery from "@/lib/db";
import { z } from 'zod';
import bcrypt from 'bcrypt';

const attendeeSchema = z.object(
    {
        uuid: z.string(),
        spotify_id: z.string().optional(),
        name: z.string(),
        email: z.string(),
    }
)

export type Attendee = z.infer<typeof attendeeSchema>

export function getAllAttendees() {
    return executeQuery<Attendee[]>(
        'SELECT * FROM attendees',
        []
    )
}

export function getAttendeeByID(attendeeId: string) {
    const data = executeQuery<Attendee>(
        'SELECT * FROM attendees where uuid = ?;',
        [attendeeId]
    )
    return data
}

export function addAttendee(attendee: Attendee) {
    const saltRounds: number = 10;
    return executeQuery(
        'INSERT INTO attendees (uuid, spotify_id, name, email) VALUES(uuid(), ?, ?, ?)',
        [attendee.spotify_id, attendee.name, attendee.email]
    )
}