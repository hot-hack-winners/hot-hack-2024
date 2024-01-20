import useUser from '../auth/use-user'
import Head from 'next/head'
import { useRouter } from 'next/navigation'
import { useEffect } from 'react'
import { logout } from '../auth/spotify'
import useTopArtists from '../auth/useTopArtists'

export function DashboardComponent() {



  async function fetchTopArtists() {
    const accessToken = 'BQBh07KQ576PZ26jRL93IZrocYvnEIjlMSeTJuJnXps_UdXY_zW7XGh7W2R4Rbyf_EQsW2Cz2-Gm74N_x-ZpQR12RQOxaymh_WM69aTsSK_L0BnX4ZZ13fs16-jSyVkriPeDBxQDKzs78c1FnWey6psikAKXisc7EUhNyLsjbXI7gbwS9GceSerT'; // Your actual token
  
    try {
      const response = await fetch('https://api.spotify.com/v1/me/top/artists', {
        headers: {
          'Authorization': `Bearer ${accessToken}`
        }
      });
  
      if (!response.ok) {
        throw new Error(`Error: ${response.status}`);
      }
  
      const data = await response.json();
      console.log(data);
      return data; // Contains the user's top artists
    } catch (error) {
      console.error('There was an error fetching the top artists:', error);
    }
  }
  
    
  

  const router = useRouter()
  const { user, loggedOut, mutate } = useUser()
  const { topArtists, isLoading, isError } = useTopArtists() 
  useEffect(() => {
    if (loggedOut) {
      mutate(null, false).then(() => router.replace('/'))
    }
  }, [loggedOut, mutate])


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
            <p className="text-xl">This is your dashboard.</p>
            <button onClick={fetchTopArtists} >click me </button>
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