'use server'
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

export async function getAllArtists() {
    const test =  await executeQuery<Artist[]>(
        'SELECT * FROM artists',
        []
    )

    console.log(test)

    return test
}

export async function getArtistByID(artistId: string) {
    const data = await executeQuery<Artist>(
        'SELECT * FROM artists where uuid = ?;',
        [artistId]
    )
    return data
}

export async function addArtist(artist: Artist) {
    return  await executeQuery(
        'INSERT INTO artists (uuid, name, spotify_id) VALUES(uuid(), ?, ?)',
        [artist.name, artist.spotify_id]
    )

}