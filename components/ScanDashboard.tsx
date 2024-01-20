import useUser from '../auth/use-user'
import Head from 'next/head'
import { useRouter } from 'next/navigation'
import { useEffect, useState } from 'react'
import { logout } from '../auth/spotify'
import useTopArtists from '../auth/useTopArtists'
import useFollowPlaylist from '../auth/useFollowPlaylist'

export function ScanDashboard(playlistId : string) {
  const [isPressed, setIsPressed] =  useState(false)
  const { follow, data, isFollowing, error } = useFollowPlaylist(playlistId.playlistId);
  const router = useRouter()
  const { user, loggedOut, mutate } = useUser()
  const { topArtists, isLoading, isError } = useTopArtists() 
  useEffect(() => {
    if (loggedOut) {
      mutate(null, false).then(() => router.replace('/'))
    }
  }, [loggedOut, mutate])

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
            {data && <p>{data.description}</p>}
            <img href></img>
            <button onClick={handleFollowClick}>
             {isPressed ? 'Followed' : "Follow"}
          </button>
    

            <button
              className="px-4 py-2 rounded-full bg-gradient-to-tr from-indigo-600 to-purple-600 text-white font-bold hover:opacity-75 focus:outline-none focus:shadow-outline"
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