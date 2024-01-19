"use client";

import * as React from "react";

import { Button } from "@/components/ui/button";
import {
  Card,
  CardContent,
  CardDescription,
  CardFooter,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";

import { zodResolver } from "@hookform/resolvers/zod";
import { useForm } from "react-hook-form";
import { Input } from "@/components/ui/input";
import * as z from "zod";
import { Checkbox } from "@/components/ui/checkbox";
import {
  Form,
  FormControl,
  FormDescription,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form";

const FormSchema = z.object({
  items: z.array(z.string()).refine((value) => value.some((item) => item), {}),
});

const items = [
  { id: "sabrina_carpenter", label: "Sabrina Carpenter" },
  { id: "min", label: "MIN" },
  { id: "momoland", label: "MOMOLAND" },
  { id: "kennen", label: "Kennen" },
  { id: "abba", label: "ABBA" }
];

export default function PostLoginCard() {
  const form = useForm<z.infer<typeof FormSchema>>({
    resolver: zodResolver(FormSchema),
    defaultValues: {
      items: items.map((item) => item.id),
    },
  });

  function onSubmit(data: z.infer<typeof FormSchema>) {
    console.log(data);
  }

  return (
    <div className="bg-white h-dvh flex w-screen justify-center items-center bg-gray-100">
      <Card className="w-[350px] border-gray-200 bg-gray-100 shadow-2xl">
        <CardHeader>
          <CardTitle className="text-justify ">
            Thank you for checking-in Something Cool Anevue
          </CardTitle>
          <CardDescription className="text-justify ">
            Please continue if you prefer these checked artists to be present in
            the avenue in the future
          </CardDescription>
        </CardHeader>
        <CardContent>
          <Form {...form}>
            <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-8">
              <FormField
                control={form.control}
                name="items"
                render={() => (
                  <FormItem>
                    {items.map((item) => (
                      <FormField
                        key={item.id}
                        control={form.control}
                        name="items"
                        render={({ field }) => {
                          return (
                            <FormItem
                              key={item.id}
                              className="flex flex-row items-start space-x-3 space-y-0"
                            >
                              <FormControl>
                                <Checkbox
                                  checked={field.value?.includes(item.id)}
                                  onCheckedChange={(checked) => {
                                    return checked
                                      ? field.onChange([
                                          ...field.value,
                                          item.id,
                                        ])
                                      : field.onChange(
                                          field.value?.filter(
                                            (value) => value !== item.id
                                          )
                                        );
                                  }}
                                />
                              </FormControl>
                              <FormLabel className="font-normal">
                                {item.label}
                              </FormLabel>
                            </FormItem>
                          );
                        }}
                      />
                    ))}
                    <FormMessage />
                  </FormItem>
                )}
              />
              <div>
                <Button variant="outline" className="bg-slate-800 text-slate-100" type="submit">
                  I wanna see them!
                </Button>

              </div>
            </form>
          </Form>
        </CardContent>
      </Card>
    </div>
  );
}
