s_diff = 0.4;

difference(){
    cube([60,15,5], center=true);
    
    // The Hole
    translate([0,0,0])
        cube([10,5,6], center=true);
    translate([0,-5,0])
        cube([5,10,6], center=true);
    
    
    linear_extrude(3){
        translate([20,0])
            text(text="L", size=10, halign="center", valign = "center");
        }
    linear_extrude(3){
        translate([-18,0])
            text(text=str(s_diff), size=10, halign="center", valign = "center");
        }
    }
    
    // The Pin
    translate([0,15 + s_diff,0])
        cube([10 - s_diff, 5 - s_diff,5], center=true);
    translate([0,10,0])
        cube([5 - s_diff,10,5], center=true);