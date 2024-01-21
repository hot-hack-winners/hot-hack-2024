"use client";

import { useEffect } from "react";
import { Button } from "./ui/button";
import { Card } from "./ui/card";
import Scheduler from "./ui/scheduler";
import { ScrollArea } from "./ui/scroll-area";

import { useState } from "react";
import { logout, checkCookie } from "@/auth/admin-auth";
import { useRouter } from "next/navigation";
import { getAllGigs, Gig } from "@/server/gigs";
import { getAllArtists, Artist } from "@/server/artists";
import { getAllScans, Scan } from "@/server/scans";
import GigCard from "./GigCard";


export default function VenuesDashboard() {
  const days: Date[] = [
    new Date("2024-01-20"),
    new Date("2024-01-21"),
    new Date("2024-01-19"),
  ];

  const [artists, setArtists] = useState<Artist[]>([]);
  const [scans, setScans] = useState<Scan[]>([]);
  const [gigs, setGigs] = useState<Gig[]>([]);
  useEffect(() => {
    getAllArtists()
      .then((data) => {
        if ('error' in data) {
          console.error(data.error);
          return;
        }

        setArtists(data);
      });

    getAllScans()
      .then((data) => {
        if ('error' in data) {
          console.error(data.error);
          return;
        }

        setScans(data);
      });

    getAllGigs()
      .then((data) => {
        if ('error' in data) {
          console.error(data.error);
          return;
        }

        setGigs(data);
      });
  }, []);



  return (
    <div className="h-full w-full flex flex-col rounded-md border border-gray-500">
      <div className="flex-none p-4 border-b border-gray-700">
        <div className="text-8xl font-bold text-white">Dashboard</div>
        <div className="flex space-x-4 mt-4">
          <Button>Gig register</Button>
          <Button onClick={logout}>Log out</Button>
        </div>
      </div>
      
      <div className="flex-grow flex p-8 space-x-8">
        <div className="flex-auto px-4 py-8 max-h-full rounded-md border border-gray-800 overflow-auto">
          {artists.slice(0, 30).map((artist) => (
            <Card key={artist.uuid}>
              <div>{artist.name}</div>
            </Card>
          ))}
        </div>
        
        <div className="flex-auto px-4 py-8 max-h-full rounded-md border border-gray-800 overflow-auto">
          <div>Gig list</div>
          {gigs.map((gig) => (
            <GigCard key={gig.uuid} uuid={gig.venue_uuid}></GigCard>
          ))}
        </div>
        <div className="flex-auto px-4 py-8 flex flex-col rounded-md border border-gray-800">
          <Scheduler />
        </div>
      </div>
    </div>
  );
}
