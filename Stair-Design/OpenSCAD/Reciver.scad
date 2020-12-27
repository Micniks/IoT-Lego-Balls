// ---------- PRINTS ----------

print_main = false;
print_step = true;

// ---------- VARIABLES ----------

step_amount = 0;

height = 100 + step_amount*10;
width = 65; // Minimum 40
thickness = 25;
top_towers = 20;

ramp_width = 20;
ramp_height = 15;
bottom_obstruction_width = 40; // Minimum 25
bottom_obstruction_height = 45; // Minimum 55

holder_length = 50;
holder_width = 50;
holder_height = height;
wall_thickness = 5;
bottom_thickness = 30;

connector_hole_position_length_diff = 10;
connector_hole_dia = 5;
connector_hole_height = 5;

step_height = 10;

ramp_bottom_infill_height = 5;
infill_height = height - bottom_obstruction_height - ramp_height - ramp_bottom_infill_height;

// ---------- SHAPES ----------

// MAIN BLOCK
if(print_main){
    //Ramp Structur
    difference(){
        //Main Block
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
    
        //Remove Infill above bottom hole
        translate([0,width/2-bottom_obstruction_width/2,bottom_obstruction_height])
            rotate([90,0,90])
                linear_extrude(height = thickness)
                    polygon (points = [[0, 0],[bottom_obstruction_width, 0],[bottom_obstruction_width/2, infill_height]]);
    }
    
    // Ball Holder
    difference(){
        //Main Cube
        translate([thickness, width/2 - holder_width/2, 0])
            cube([holder_length, holder_width, holder_height]);
    
        //Hole
        translate([thickness+wall_thickness/2, width/2 - holder_width/2 + wall_thickness/2, bottom_thickness])
            cube([holder_length-wall_thickness, holder_width-wall_thickness, holder_height]);
    
        //Entrance Hole
        translate([thickness,width/2-ramp_width/2,height-ramp_height])
            cube([wall_thickness, ramp_width, height]);
    
        //Connector Holes
        diff = connector_hole_position_length_diff;
        positions = [
            [diff,diff,0],
            [holder_length-diff,diff,0],
            [diff,holder_width-diff,0],
            [holder_length-diff,holder_width-diff,0]];
        for(position = positions){
            translate([thickness, width/2 - holder_width/2, 0])
                translate(position)
                    cylinder(d=connector_hole_dia+0.4, h=connector_hole_height*2, $fn=60);
        }
    }
}
// STEP BLOCK
if(print_step){
    x_offset = width+20;
    diff = connector_hole_position_length_diff;
    positions = [
        [x_offset+diff,diff,step_height],
        [x_offset+holder_length-diff,diff,step_height],
        [x_offset+diff,holder_width-diff,step_height],
        [x_offset+holder_length-diff,holder_width-diff,step_height]];

    difference(){
        //Main Block
        union(){
            translate([x_offset,0,0])
                cube([thickness,width,step_height]);
            translate([x_offset+thickness, width/2 - holder_width/2, 0])
                cube([holder_length, holder_width, step_height]);
        }
        //Bottom Hole
        translate([x_offset,width/2-bottom_obstruction_width/2,0])
            cube([thickness,bottom_obstruction_width,step_height]);
        //Connector Holes
        diff = connector_hole_position_length_diff;
        positions = [
            [x_offset+diff,diff,0],
            [x_offset+holder_length-diff,diff,0],
            [x_offset+diff,holder_width-diff,0],
            [x_offset+holder_length-diff,holder_width-diff,0]];
        for(position = positions){
            translate([thickness, width/2 - holder_width/2, 0])
                translate(position)
                    cylinder(d=connector_hole_dia+0.4, h=connector_hole_height+0.4, $fn=60);
        }
        //Small indents
        for(position = positions){
            translate(position)
                translate([thickness, width/2 - holder_width/2, 19]) // Was 18 on z-axis
                    sphere(r=10, $fn=100);
        }
    }

    //Pins in step block
    for(position = positions){
        translate([thickness, width/2 - holder_width/2, -connector_hole_height*.8])
            translate(position)
                cylinder(d=connector_hole_dia-0.4, h=connector_hole_height*1.8, $fn=60);
    }
}