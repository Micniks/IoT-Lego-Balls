step_amount = 4;

//main cube
height = 100 + step_amount*10;
width = 80;
thickness = 25;
top_towers = 20;

ramp_width = 20;
ramp_height = 15;
bottom_obstruction_width = 25;
bottom_obstruction_height = 55;

holder_length = 50;
holder_width = 50;
holder_height = height;
wall_thickness = 5;

difference(){
    cube([thickness,width,height+top_towers]);
    
    //Ramp
    difference(){
        translate([0,width/2-ramp_width/2,height-ramp_height])
            cube([thickness,ramp_width,height]);
        translate([thickness,width/2-ramp_width/2,height-ramp_height])
            rotate([270,180,0])
                linear_extrude(height = ramp_width)
                    polygon (points = [[0, 0],[thickness, 0],[thickness, ramp_height]]);
    }
    
    //Bottom Hole
    translate([0,width/2-bottom_obstruction_width/2,0])
        cube([thickness,bottom_obstruction_width,bottom_obstruction_height]);
}
difference(){
    translate([thickness, width/2 - holder_width/2, 0])
        cube([holder_length, holder_width, holder_height]);
    translate([thickness+wall_thickness/2, width/2 - holder_width/2 + wall_thickness/2, wall_thickness])
        cube([holder_length-wall_thickness, holder_width-wall_thickness, holder_height]);
    translate([thickness,width/2-ramp_width/2,height-ramp_height])
        cube([wall_thickness, ramp_width, height]);
}