import { Button } from "./ui/button";
import { Card } from "./ui/card";

export default function VenuesDashboard() {
  return (
    <div>
      <Card>
        <div>
          <div>
            <div>Name of Venues</div>
            <Button>Create gig</Button>
          </div>
          <div>Gig list</div>
          <div>Suggested Artist</div>
        </div>
      </Card>
    </div>
  );
}
