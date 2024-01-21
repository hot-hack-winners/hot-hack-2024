import { Calendar } from "@/components/ui/calendar"
import { Button } from "./ui/button";
import { Card } from "./ui/card";
import { Artist, getAllArtists, getArtistByID } from "@/server/artists";
import { Scan, getAllScans } from "@/server/scans";
import { Gig, getAllGigs } from "@/server/gigs";
import { useEffect, useState } from "react";

export default function VenuesDashboard() {
  const [artists, setArtists] = useState<Artist[]>([]);
  const [scans, setScans] = useState<Scan[]>([]);
  const [gigs, setGigs] = useState<Gig[]>([]);

  useEffect(() => {
    getAllArtists().then((data) => {
      setArtists(data);
    });
    getAllScans().then((data) => {
      setScans(data);
    });
    getAllGigs().then((data) => {
      setGigs(data);
    });
  }, []);

  
  return (
    <div className="h-dvh w-screen border">
        <Card className="border ">
        Something
      </Card>
    </div>
  );
}
