"use client"

import { useEffect } from "react";
import { Button } from "./ui/button";
import { Card } from "./ui/card";
import Scheduler from "./ui/scheduler";
import { ScrollArea } from "./ui/scroll-area";

import { logout, checkCookie} from "@/auth/admin-auth";
import { useRouter } from "next/navigation";

const testData = [
  "Something",
  "Something",
  "Something",
  "Something",
  "Something",
  "Something",
  "Something",
  "Something",
  "Something",
  "Something",
  "Something",
  "Something",
];

export default function VenuesDashboard() {
  const days: Date[] = [
    new Date("2024-01-20"),
    new Date("2024-01-21"),
    new Date("2024-01-19"),
  ];

  const router = useRouter();
  const initFunction = async () => {
      const test = await checkCookie().then((response => 
          {
              if (!response) {
                  router.push("/login")
              }
          }
          ))
  }

  useEffect(() =>{
     initFunction();
  },[])

  const conductingLogout = async () => {
   router.push("/")
  }
  const adminLogout = () => {    
    conductingLogout(); 
  }
  const gigRegister = () => {   
    
}

  return (
    <div className="p-40  h-dvh w-full">
      <div className=" h-full w-full flex ">
        <div className=" basis-1/4 px-4 py-8">

        </div>
        <div className=" basis-1/4 px-4 py-8">

        </div>
        <div className=" basis-1/4 px-4 py-8">

        </div >
        <div className=" basis-1/4 px-4 py-8 flex flex-col">
        <div className="basis-1/4">
            <div>Hello Kekw</div>
            <Button onClick={gigRegister}>Gig register</Button>
            <Button onClick={logout}>Log out</Button>
        </div>
        <div className="grow">
            <Scheduler/>
        </div>
        
        </div>
      </div>
    </div>
  );
}
