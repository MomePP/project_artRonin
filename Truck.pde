import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.unfolding.providers.*;
import de.fhpotsdam.unfolding.data.*;
import de.fhpotsdam.unfolding.marker.*;

class Truck{

    Location loc_orig;
    Location loc_dest;

    ScreenPosition screenPos_origin;
    ScreenPosition screenPos_dest;

    float lat_origin;
    float long_origin;
    float lat_dest;
    float long_dest;
    float duration_time;
    float duration_dist;
    float speed;
    color c;
    float xpos;
    float ypos;

    Truck(float _lati_o,float _long_o,float _lati_d,float _long_d,float _duration ){
        loc_orig = new Location(_lati_o,_long_o);
        loc_dest = new Location(_lati_d,_long_d);
        lat_origin = _lati_o;
        long_origin = _long_o;
        lat_dest = _lati_d;
        long_dest = _long_d;
        duration_time = _duration;
        c = color(random(0, 255),random(0, 255), random(0, 255), 150);
    }
    public void update(int time_minus) {
        screenPos_origin = map.getScreenPosition(loc_orig); 
        screenPos_dest = map.getScreenPosition(loc_dest);
        duration_dist = dist(screenPos_origin.x, screenPos_origin.y, screenPos_dest.x, screenPos_dest.y);
        // duration_dist = dist(lat_origin, long_origin, lat_dest, long_dest);
        // https://andrew.hedges.name/experiments/haversine/
    }
    public void display(){     
        fill(c);
        noStroke();
        // println("duration_dist: "+duration_dist);
        println("duration_time: "+duration_time);

        ellipse(screenPos_origin.x, screenPos_origin.y, 20, 20);
    }

    public void calSpped() {
        speed = duration_dist / duration_time;
    }

}
