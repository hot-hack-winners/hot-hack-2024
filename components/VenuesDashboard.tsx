import { Calendar } from "@/components/ui/calendar"
import { Button } from "./ui/button";
import { Card } from "./ui/card";

export default function VenuesDashboard() {
    const days: Date[] = [new Date("2024-01-20"),new Date("2024-01-21"),new Date("2024-01-19")]
  return (
    <div>
      <Card> 
        <div>
            
          <div>
            <div>Name of Venues</div>
            <Button>Create gig</Button>
          </div>
          <div>
            <div>
                <Calendar
                    mode="multiple"
                    selected={days}
                />
            
            </div>
           
            <div>
                Gig list
            </div>

          </div>
          
          <div>Suggested Artist</div>
          
        </div>
        </Card> 
    </div>
  );
}
