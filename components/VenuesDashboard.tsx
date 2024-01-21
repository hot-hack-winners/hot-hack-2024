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
          console.log(data.error);
          return;
        }
        setArtists(data);
      });

    getAllScans()
      .then((data) => {
        if ('error' in data) {
          console.log(data.error);
          return;
        }
        setScans(data);
      });

    getAllGigs()
      .then((data) => {
        if ('error' in data) {
          console.log(data.error);
          return;
        }
        setGigs(data);
      });
  }, []);

  return (
    <div className="p-20 bg-black h-dvh w-full">
      <div className=" h-full w-full flex border flex-col  rounded-md border-gray-500">
        <div className="basis-1/6 h-full max-h-full flex p-8">
          <div className="text-8xl font-bold">Dashboard</div>
          <div className="basis-1/4">
            <div>Hello Kekw</div>
            <Button>Gig register</Button>
            <Button onClick={logout}>Log out</Button>
          </div>
        </div>
        <div className="basis-5/6 border border-gray-700 h-full w-full max-h-full flex p-8 space-x-8">
          <div className=" basis-1/4 px-4 py-8 max-h-full rounded-md border border-gray-800 overflow-scroll ">
            {artists.slice(0, 20).map((artist) => (
                <Card key={artist.uuid}>
                  <div>{artist.name}</div>
                </Card>
            ))}
          </div>

          <div className=" basis-1/4 px-4 py-8 max-h-full rounded-md border border-gray-800 ">
            {scans.map((scan) => (
              <Card key={scan.uuid}>
                <div>{scan.attendees_uuid}</div>
              </Card>
            ))}
          </div>
          <div className=" basis-1/4 px-4 py-8 max-h-full  rounded-md border border-gray-800 ">
            <div>Gig list</div>
            {gigs.map((gig) => (

                <GigCard key={gig.uuid} uuid={gig.venue_uuid}></GigCard>

            ))}
          </div>
          <div className=" basis-1/4 px-4 py-8 flex flex-col rounded-md border border-gray-800">
            <div className="grow">
              <Scheduler />
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
