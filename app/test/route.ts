'use server'
import { NextResponse } from "next/server";
import { Admin } from "@/server/admins";
import executeQuery from "@/lib/db";
import { getAllAdmins, registerAdmin, getAdminByID } from "@/server/admins";
import { addOrgnisation, getAllOrganisations } from "@/server/organisations";
import { addVenue, getAllVenues } from "@/server/venues";
import { getAllGigs, addGig, getCurrentVenueGig } from "@/server/gigs";
import { addScan } from "@/server/scans";
import { addAttendee, getAllAttendees, getAttendeeByID } from "@/server/attendees";
import { addArtist, getAllArtists } from "@/server/artists";
import { addFavorite, submitScan } from "@/server/favorites";

export async function GET() {
    const response = await submitScan("7jy3rLJdDQY21OgRLCZ9sD",
        "a2e67853-b74f-11ee-afca-025a69a1f11b",
        "BQD3eHtnlg-jTo02qDW1EwlW7WSB_2CiquvYzICo2CUKrtJwXVZrPdYoS42SGxd_3smzdHNAi6kSha2Bm_v-SXGNru35Fa6jUBdNeeJ3-BWrEY83n4Ht2qFEc0dMlsWSeyiQ138aH5CwuGo6kY5P3escHPTNKMabZP6-6RJjToKllCvBaaSVLWYQZEl8GAHs_JB0ckkzylewVmK90pTaR5-gNqrzun4eggZiw1-1T_8V4DmUbkpbEO-Qcaoy-A6EOsloGutVJvoAqsoqzlE",
    )

    return NextResponse.json(response)
}