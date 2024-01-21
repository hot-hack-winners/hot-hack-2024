"use client";

import { useEffect } from "react";
import { Button } from "./ui/button";
import { Card } from "./ui/card";
import Scheduler from "./ui/scheduler";
import { ScrollArea } from "./ui/scroll-area";
import { useState } from "react";
import { logout, checkCookie } from "@/auth/admin-auth";
import { useRouter } from "next/navigation";
import { getAllArtists, Artist } from "@/server/artists";
import { getAllScans, Scan } from "@/server/scans";
import { getBestArtistForVenue, Favorite } from "@/server/favorites";

type FavoriteWithScore = Favorite & { score: number };


export default function VenuesDashboard() {
  const days: Date[] = [
    new Date("2024-01-20"),
    new Date("2024-01-21"),
    new Date("2024-01-19"),
  ];


  const test =  async () => {

    const data = await getBestArtistForVenue('a2e67853-b74f-11ee-afca-025a69a1f11b')
    return data;
  }

  const [artists, setArtists] = useState<Artist[]>([]);
  const [scans, setScans] = useState<Scan[]>([]);
  const [bestArtists, setbestArtists ] = useState<Favorite[]>([]);

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
    test()
    .then((data) =>  {
      if (data){
        if ('error' in data) {
          console.error(data.error);
          return;
        }
        setbestArtists(data);
  
        console.log(data)
  
      }
    });
  }, []);

  const formatScore = (score: number): string => {
    return new Intl.NumberFormat('en-US', { maximumFractionDigits: 2 }).format(score);
  };

  const scaleScore = (score: number, maxScore: number): number => {
    return Math.round((score / maxScore) * 100);
  };

  
  const maxScore = Math.max(...bestArtists.map(artist => artist.score));

  // Sort the artists by scaled score in descending order
  const sortedBestArtists = bestArtists.sort((a, b) => 
    scaleScore(b.score, maxScore) - scaleScore(a.score, maxScore)
  );

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
          <div className="text-2xl font-semibold mb-4">Best Artists by Rankings</div>
          {sortedBestArtists.map((bestArtist) => (
            <Card key={bestArtist.artist.name} className="mb-4">
              <div className="flex items-center justify-between">
                <div className="text-lg font-medium">{bestArtist.artist.name}</div>
                <div className="text-sm font-light">Score: {scaleScore(bestArtist.score, maxScore)}</div>
              </div>
            </Card>
          ))}
        </div>
        
        <div className="flex-auto px-4 py-8 flex flex-col rounded-md border border-gray-800">
          <Scheduler />
        </div>
      </div>
    </div>
  );

}
