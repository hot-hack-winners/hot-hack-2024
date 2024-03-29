
'use client';

import { beginLogin } from '@/auth/spotify'
import useUser from '@/auth/use-user'

//import Nav from 'components/nav'
import { useRouter } from 'next/navigation'
import { useEffect } from 'react'
import Head from 'next/head'

export function UserLogin(){
  const hostName = process.env.NEXT_PUBLIC_HOST_NAME;

return (

<div className="homepage">
<main className="p-2 flex flex-col max-w-xs mx-auto my-4 text-center space-y-4">
  <h1 className="text-4xl">Insert app name here</h1>
  <br />
  <button
    className="px-4 py-2 rounded-full bg-gradient-to-tr from-pink-600 to-purple-600 text-white font-bold hover:opacity-75 focus:outline-none focus:shadow-outline"
    onClick={async () => {
      await beginLogin()
    }}
  >
    Login with Spotify to continue
  </button>
</main>
</div>

)
}
