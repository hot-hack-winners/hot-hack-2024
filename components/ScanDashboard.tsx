import useUser from '../auth/use-user'
import Head from 'next/head'
import { useRouter } from 'next/navigation'
import { useEffect, useState } from 'react'
import { logout } from '../auth/spotify'
import useTopArtists from '../auth/useTopArtists'
import useFollowPlaylist from '../auth/useFollowPlaylist'


import {addAttendeeIfNotExists} from '@/server/attendees'
import {submitScan} from '@/server/favorites'

interface ScanDashboardProps {
  playlistId: string;
  venueUuid: string;
}
export function ScanDashboard({ playlistId, venueUuid }: ScanDashboardProps) {
  const [isPressed, setIsPressed] =  useState(false)
  const { follow, data, isFollowing, error } = useFollowPlaylist(playlistId);
  const router = useRouter()
  const { user, loggedOut, mutate } = useUser()
  const { topArtists, isLoading, isError } = useTopArtists()



  const handleScans = async () => {
    const tokenSet = localStorage.getItem('tokenSet');

    const token = JSON.parse(tokenSet!)

    // Define newAttendee and newScan objects here...

    // Now for the scan
    const scanResult = await submitScan(user.id, venueUuid, token.access_token);
    console.log('Scan Result:', scanResult);
  }

  const handleAttendee = async () => {

    const newAttendee = {
      // Assuming 'uuid' and 'spotify_id' are optional
      name: user.display_name,              // Replace with actual attendee name
      email: 'fake@fake.com',
      spotify_id: user.id
  };
      // Attempt to add the new attendee
      const result = await addAttendeeIfNotExists(newAttendee);
      console.log('Result:', result)

  }

  useEffect(() => {
    if (loggedOut) {
      sessionStorage.setItem('preAuthUrl', window.location.href);
      const savedUrl =   sessionStorage.getItem('preAuthUrl');
      mutate(null, false).then(() => router.replace('/userlogin'))
    }
    if (!loggedOut && user){

      handleAttendee();
        handleScans();
        // submitscan stuff

     /* submitScan(attendee_uuid, venue_uuid, spotify_token, current_time)
        .then(topArtists => {
          console.log('Scan submitted successfully. Top Artists:', topArtists);
        })
        .catch(error => {
          console.error('Error submitting scan:', error);
        });
*/
    }



  }, [loggedOut, user, mutate])



  const handleFollowClick = async () => {
    try {
      await follow();
      setIsPressed(true)
      // Handle successful follow action (e.g., show a message)
    } catch (err) {
      console.error(err);
      // Handle errors (e.g., show an error message)
    }
  };


  if (isLoading) {
    return <div>Loading...</div>;
  }
            /*<p>{JSON.stringify(topArtists)}</p>*/

  return (
    <div>
      <Head>
        <title>Dashboard</title>
      </Head>


      <main className="p-2 flex flex-col max-w-xs mx-auto my-4 text-center space-y-4">
        {user && (
          <>
            <h1 className="text-4xl">Welcome, {user.display_name}</h1>
            <p className="text-xl">Here is nostalgia waiting.</p>
            {data && <p>{data.name}</p>}
             <img style={{display: 'block', height: 300, width: 300,}} src={data && data.images[0].url}></img>
            <button onClick={handleFollowClick}
              className="px-4 py-2 rounded-full bg-gradient-to-tr from-indigo-600 to-purple-600 text-white font-bold hover:opacity-75 focus:outline-none focus:shadow-outline"
            >
              {isPressed ? 'Followed' : "Follow"}
            </button>

            <button
              onClick={async () => {
                logout()
                await mutate(null) // optimistically update the data and revalidate
                router.push('/')
              }}
            >
              Logout
            </button>
          </>
        )}
      </main>
    </div>
  )
}
