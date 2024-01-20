import useSWR from 'swr'
import { fetchWithToken } from '../auth/spotify'

export default function useTopArtists() {
  const { data, error } = useSWR(
    'https://api.spotify.com/v1/me/top/artists',
    fetchWithToken,
  )

  return {
    topArtists: data?.items,
    isLoading: !error && !data,
    isError: error
  }
}
