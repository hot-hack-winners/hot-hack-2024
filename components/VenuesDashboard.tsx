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
    <div className="p-20 bg-black h-screen w-full">
      <div className="flex flex-col h-full w-full rounded-md border border-gray-500">
        <div className="flex items-center justify-between p-8 border-b border-gray-700">
          <h1 className="text-8xl font-bold text-white">Dashboard</h1>
          <div>
            <Button onClick={() => {}}>Gig Register</Button>
            <Button onClick={logout}>Log Out</Button>
          </div>
        </div>
        
        <div className="flex flex-grow p-8 space-x-8">
          <ScrollArea className="flex flex-col basis-1/4">
            <h2 className="text-lg font-semibold text-white mb-4">Artists</h2>
            {artists.slice(0, 20).map((artist) => (
              <Card key={artist.uuid} className="mb-4">
                <div className="text-white">{artist.name}</div>
              </Card>
            ))}
          </ScrollArea>

          <ScrollArea className="flex flex-col basis-1/4">
            <h2 className="text-lg font-semibold text-white mb-4">Scans</h2>
            {scans.map((scan) => (
              <Card key={scan.uuid} className="mb-4">
                <div className="text-white">{scan.attendees_uuid}</div>
              </Card>
            ))}
          </ScrollArea>

          <ScrollArea className="flex flex-col basis-1/4">
            <h2 className="text-lg font-semibold text-white mb-4">Gig List</h2>
            {gigs.map((gig) => (
              <GigCard key={gig.uuid} uuid={gig.venue_uuid} className="mb-4" />
            ))}
          </ScrollArea>

          <div className="flex flex-col basis-1/4 p-4 rounded-md border border-gray-800">
            <Scheduler />
          </div>
        </div>
      </div>
    </div>
  );
}