import { useEffect, useState } from "react";
import { Gig, getGigByID } from "@/server/gigs";

export default function GigCard({uuid}:{uuid:string}) {
    
    const [gig, setGig] = useState<Gig>({
        uuid: "",
        venue_uuid: "",
        spotify_playlist_id: "",
        start_time: "",
        end_time: "",
    });
    useEffect(() => {
        getGigByID(uuid).then((data) => {
            setGig(data);
            console.log(data)
        });
    }, [])
    
    return (

    <div>
        <h1>Gig: {gig.venue_uuid}</h1>
    </div>
  );
}