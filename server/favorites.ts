'use server'
import executeQuery from "@/lib/db";
import { z } from 'zod';
import bcrypt from 'bcrypt';
import { getAttendeeByID, getAttendeeBySpotifyID } from "./attendees";
import { getVenueByID } from "./venues";
import { getCurrentVenueGig } from "./gigs";
import { addArtist, getArtistPopularity } from "./artists";
import { addScan } from "./scans";

const  favoritesSchema = z.object(
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

export async function getFavoritesByVenueArtistId(venuesUuid: string, spotifyArtistId: string) {
    const favourites = await executeQuery<Favorite[]>(
        `SELECT * FROM favourites 
        WHERE venues_uuid = ?
            AND spotify_artists_id = ?`,
        [venuesUuid, spotifyArtistId]
    );
    const popularity: number = await getArtistPopularity(spotifyArtistId);
    const weight: number = 100 - Math.pow(popularity - 50, 2) / 30;
    let score: number = 0;
    if ('error' in favourites) {
	console.log("error");
    } else {
	favourites.forEach((favourite:any) => {
    	    score += (Date.now() - favourite.timestamp)/favourite.rank;
    	});
    }
    return await score * weight;
}

export async function getFavoritesByGigArtistId(gigUuid: string, spotifyArtistId: string) {
    const favourites = await executeQuery<Favorite[]>(
        `SELECT * FROM favourites 
        WHERE gigs_uuid = ?
            AND spotify_artists_id = ?`,
        [gigUuid, spotifyArtistId]
    );
    const popularity: number = await getArtistPopularity(spotifyArtistId);
    const weight: number = 100 - Math.pow(popularity - 50, 2) / 30;
    let score: number = 0;
    if ('error' in favourites) {
	console.log("error");
    } else {
	favourites.forEach((favourite:any) => {
    	    score += (Date.now() - favourite.timestamp)/favourite.rank;
    	});
    }
    return  await score * weight;
}

export async function getBestArtistForVenue(venueUuid: string) {
    const artists = await executeQuery<[]>(
	`SELECT DISTINCT spotify_artists_id FROM favourites
	WHERE venues_uuid = ?`,
	[venueUuid]
    );
    
    if ('error' in artists) {
	   return console.log("Error");
    }

    const data =  await Promise.all(artists.map((artist) => getFavoritesByVenueArtistId(venueUuid, artist)))
    return data.map((artist) => ({ artist }))
}

export async function getBestArtistForGig(gigUuid: string) {
    const artists = await executeQuery<[]>(
	`SELECT DISTINCT spotify_artists_id FROM favourites
	WHERE gigs_uuid = ?`,
	[gigUuid]
    );
    let artistScores: {}[] = [];
    if ('error' in artists) {
	console.log("Error");
    } else {
	artists.forEach((artist) => {
    	    artistScores.push({artist: getFavoritesByGigArtistId(gigUuid, artist)});
    	});
    }
    return await artistScores;
}

export async function  addFavorite(favorite: Saveable<Favorite>) {
    return await executeQuery(
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

        return await items
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


    const fucked = await currentGig[0]?.uuid;
    const fucked2 = await user[0]?.uuid;

    
    const scan = {
        gigs_uuid: fucked, attendees_uuid: fucked2, timestamp: current_time, venues_uuid: venue_uuid
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
    const returnFucked = await user[0]?.uuid ;
    return { user_uuid: returnFucked };
}

export async function favouritesSummary() {

}
