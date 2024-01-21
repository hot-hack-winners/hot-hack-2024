"use client";

import * as z from "zod";
import { zodResolver } from "@hookform/resolvers/zod";
import { useForm } from "react-hook-form";
import { Button } from "@/components/ui/button";
import {
  Form,
  FormControl,
  FormDescription,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form";
import { Input } from "@/components/ui/input";
import { authenticate, checkCookie} from "@/auth/admin-auth";
import { useRouter } from "next/navigation";
import { useEffect } from "react";



const formSchema = z.object({
  username: z.string().email(),
  password: z.string().min(2).max(50),
});

export default function LoginForm() {
  console.log("Soething")
    const router = useRouter();
    
    const initFunction = async () => {
        checkCookie().then((response => 
            {
                console.log(response)
                if (response) {
                    router.push("/dashboard")
                }
            }
            ))
    }
    useEffect(() =>{
      initFunction();
   },[])

  // 1. Define your form.
  const form = useForm<z.infer<typeof formSchema>>({
    resolver: zodResolver(formSchema),
    defaultValues: {
      username: "",
      password: "",
    },
  });

  const conductAuthentication = async (values: z.infer<typeof formSchema>) => {
    const response = await authenticate(values).then((response => console.log(response)))
  }

  // 2. Define a submit handler.
  function onSubmit(values: z.infer<typeof formSchema>) {
    // Do something with the form values.
    // ✅ This will be type-safe and validated.
    conductAuthentication(values);
    
    console.log(values);
  }
  return (
    <div>
      Login Form
      <Form {...form}>
        <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-8">
          <FormField
            control={form.control}
            name="username"
            render={({ field }) => (
              <FormItem>
                <FormLabel>Username</FormLabel>
                <FormControl>
                  <Input placeholder="example@gmail.com" {...field} />
                </FormControl>
                <FormDescription>
                  This is your public display name.
                </FormDescription>
                <FormMessage />
              </FormItem>
            )}
          />

          <FormField
            control={form.control}
            name="password"
            render={({ field }) => (
              <FormItem>
                <FormLabel>Username</FormLabel>
                <FormControl>
                  <Input type="password" placeholder="Super Secret Password" {...field} />
                </FormControl>
                <FormDescription>
                  This is your public display name.
                </FormDescription>
                <FormMessage />
              </FormItem>
            )}
          />
          <Button type="submit">Submit</Button>
        </form>
      </Form>
    </div>
  );
}
