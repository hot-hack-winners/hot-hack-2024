'use client'
import { completeLogin } from '../../auth/spotify'
import Head from 'next/head'
import { useRouter } from 'next/navigation'
import { useEffect } from 'react'


export default function Page() {
  const router = useRouter()

  useEffect(() => {
    completeLogin()
      .then(() => {
        router.push('/scan/1')
      })
      .catch((error) => {
        console.error(error)
        router.replace('/')
      })
  }, [])

  return (
    <div>
      <main className="p-2 flex flex-col max-w-xs mx-auto my-4 text-center space-y-4">
        <h1 className="text-4xl text-gray-600 animate-pulse">
          Logging you in...
        </h1>
      </main>
    </div>
  )
}