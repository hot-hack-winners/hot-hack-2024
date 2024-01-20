import executeQuery from "@/lib/db";
import { z } from 'zod';

const artistSchema = z.object(
    {
        uuid: z.string().optional(),
        spotify_id: z.string().optional(),
        name: z.string(),
    }
)

export type Artist = z.infer<typeof artistSchema>

export function getAllArtists() {
    return executeQuery<Artist[]>(
        'SELECT * FROM artists',
        []
    )
}

export function addArtist(artist: Artist) {
    return executeQuery(
        'INSERT INTO artists (uuid, name, spotify_id) VALUES(uuid(), ?, ?)',
        [artist.name, artist.spotify_id]
    )

}