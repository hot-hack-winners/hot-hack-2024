import executeQuery from "@/lib/db";
import { z } from 'zod';
import bcrypt from 'bcrypt';
import { getAttendeeByID, getAttendeeBySpotifyID } from "./attendees";
import { getVenueByID } from "./venues";
import { getCurrentVenueGig } from "./gigs";
import { addArtist } from "./artists";
import { addScan } from "./scans";

const favoritesSchema = z.object(
    {
        uuid: z.string(),
        spotify_artists_id: z.string().optional(),
        gigs_uuid: z.string(),
        attendees_uuid: z.string(),
        ranking: z.string(),
        timestamp: z.string(),
        venues_uuid: z.string(),
    }
)

export type Favorite = z.infer<typeof favoritesSchema>

export function getFavoritesByVenueArtistId(venues_uuid: string, spotify_artists_id: string) {
    return executeQuery<Favorite[]>(
        `SELECT * FROM favourites 
        WHERE venues_uuid = ?
            AND spotify_artists_id = ?`,
        [venues_uuid, spotify_artists_id]
    )
}

export function addFavorite(favorite: Saveable<Favorite>) {
    return executeQuery(
        'INSERT INTO favourites (uuid, spotify_artists_id, gigs_uuid, attendees_uuid, ranking, timestamp, venues_uuid) VALUES(uuid(), ?, ?, ?, ?, ?, ?)',
        [favorite.spotify_artists_id, favorite.gigs_uuid, favorite.attendees_uuid, favorite.ranking, favorite.timestamp, favorite.venues_uuid]
    )
}

async function topUserArtists(spotifyToken: string) {
    try {
        const response: any = await
            fetch('https://api.spotify.com/v1/me/top/artists', {
                headers: {
                    Authorization: 'Bearer ' + spotifyToken
                }
            })
        const responseJson = await response.json()
        const items = responseJson.items.map((item: any) => { return { id: item.id, name: item.name, popularity: item.popularity, genres: item.genres } })

        return items
    } catch (err) {
        console.log(err);
    }
}

export async function submitScan(spotify_user_id: string, venue_uuid: string, spotify_token: string) {
    const current_time = new Date().toISOString();
    console.log(current_time)
    const [venue, topArtists, currentGig,] = await Promise.all(
        [
            getVenueByID(venue_uuid),
            topUserArtists(spotify_token),
            getCurrentVenueGig(venue_uuid, current_time)
        ]
    );
    const user = await getAttendeeBySpotifyID(spotify_user_id)

    if (!currentGig) {
        console.log("NO CURRENT GIG");
        return Promise.reject();
    }

    if ('error' in user || 'error' in venue || 'error' in topArtists || 'error' in currentGig) {
        return Promise.reject();
    }

    const scan = {
        gigs_uuid: currentGig[0].uuid, attendees_uuid: user[0].uuid, timestamp: current_time, venues_uuid: venue_uuid
    }

    await addScan(scan)

    // Add user favorites
    for (const artist of topArtists) {
        const favorite: Saveable<Favorite> = {
            spotify_artists_id: artist.id,
            gigs_uuid: currentGig[0].uuid,
            attendees_uuid: user[0].uuid,
            ranking: artist.popularity,
            timestamp: current_time,
            venues_uuid: venue[0].uuid,
        }
        try {
            await addArtist({ name: artist.name, spotify_id: artist.id, popularity: artist.popularity })
        } catch (error) {
            // if error occurs, continue function. Currently intended to catch duplicate entries in the artists table
            console.log(error)
        }

        await addFavorite(favorite)
    }

    return { user_uuid: user[0].uuid };
}

export async function favouritesSummary() {

}