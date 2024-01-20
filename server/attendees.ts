import executeQuery from "@/lib/db";
import { z } from 'zod';
import bcrypt from 'bcrypt';

const attendeeSchema = z.object(
    {
        attendees_uuid: z.string().optional(),
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

export function addAttendee(attendee: Attendee) {
    const saltRounds: number = 10;
    return executeQuery(
        'INSERT INTO attendees (attendees_uuid, spotify_id, name, email) VALUES(uuid(), ?, ?, ?)',
        [attendee.spotify_id, attendee.name, attendee.email]
    )
}