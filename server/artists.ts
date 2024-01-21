'use server'
import executeQuery from "@/lib/db";
import { z } from 'zod';

const artistSchema = z.object(
    {
        uuid: z.string(),
        spotify_id: z.string().optional(),
        name: z.string(),
        popularity: z.string()
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

export async function getArtistPopularity(spotifyArtistId: string) {
    const response = await executeQuery<any>(
        'SELECT popularity FROM artists WHERE spotify_id=?',
        [spotifyArtistId]
    )
    return response[0].popularity
}

export async function addArtist(artist: Saveable<Artist>) {
    return await executeQuery(
        'INSERT INTO artists (uuid, name, spotify_id, popularity) VALUES(uuid(), ?, ?, ?)',
        [artist.name, artist.spotify_id, artist.popularity]
    )

}
