'use client';

import { beginLogin } from '@/auth/spotify'
import useUser from '@/auth/use-user'

//import Nav from 'components/nav'
import { useRouter } from 'next/navigation'
import { useEffect } from 'react'
import Head from 'next/head'

export default function Home() {

  return (
    <div className="homepage">
      <h1>this will be the brochure page</h1>
    </div>
  )
}
