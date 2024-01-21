'use server'

import { cookies } from "next/headers";
import { NextResponse } from 'next/server'
import type { NextRequest } from 'next/server'



export async function authenticate(formData: any) {
  try{
    cookies().set("admin","yes");
    return cookies().get("admin");
  }
  catch(err){
    return undefined;
  }
}

export async function checkCookie(){
  return cookies().get("admin");
}

export async function logout() {
  cookies().delete("admin")
  return undefined;
}