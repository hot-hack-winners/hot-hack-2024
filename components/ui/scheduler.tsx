"use client";
import React from "react";
import FullCalendar from "@fullcalendar/react";
import dayGridPlugin from "@fullcalendar/daygrid"; // a plugin!

import { Card } from "@/components/ui/card";

export default function Scheduler() {
  return (
    <Card className="h-full w-full p-3">
      <FullCalendar
        height={"100%"}
        plugins={[dayGridPlugin]}
        initialView="dayGridMonth"
      />
    </Card>
  );
}
