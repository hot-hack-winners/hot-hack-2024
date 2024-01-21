'use server'
import executeQuery from "@/lib/db";
import { z } from 'zod';

const artistSchema = z.object(
    {
        uuid: z.string(),
        spotify_id: z.string().optional(),
        name: z.string(),
    }
)

export type Artist = z.infer<typeof artistSchema>

export async function getAllArtists() {
    return await executeQuery<Artist[]>(
        'SELECT * FROM artists',
        []
    )
}

export async function getArtistByID(artistId: string) {
    return await executeQuery<Artist>(
        'SELECT * FROM artists where uuid = ?;',
        [artistId]
    )
}

export async function addArtist(artist: Saveable<Artist>) {
    return await executeQuery(
        'INSERT INTO artists (uuid, name, spotify_id) VALUES(uuid(), ?, ?)',
        [artist.name, artist.spotify_id]
    )

}
