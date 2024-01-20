import useSWR from 'swr';
import { fetchWithToken } from '../auth/spotify'

export default function useFollowPlaylist(playlistId : string) {
  // This is only for getting data, not for updating/following.
  const { data, error } = useSWR(
    playlistId ? `https://api.spotify.com/v1/playlists/${playlistId}` : null,
    fetchWithToken
  );
  console.log(data)
  const follow = async () => {
    if (playlistId) {
      try {
        // Make a PUT request to follow the playlist
        await fetchWithToken(`https://api.spotify.com/v1/playlists/${playlistId}/followers`, 'PUT', { public: false });
        // Handle success here
      } catch (e) {
        // Handle errors here
        console.error(e);
      }
    }
  };

  return {
    follow,
    data,
    isFollowing: !!data, // This might need to be adjusted based on what your GET request returns
    error: error?.status === 401 ? 'Unauthorized' : error?.message,
  };
}
