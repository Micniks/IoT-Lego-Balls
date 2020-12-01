//cube dimensions


// ---------------CHANGEABLE VARIABLES---------------
//Step head
step_height = 15;
step_width = 20;
step_number = 1;
step_inc_height = 10;   

step_increasement = step_number*step_height;

B = 40;
b = 20;

//Cube
cube_height = 40;

// ---------------STATIC VARIABLES---------------
$fn = 100;
make_lowerpart(step_width,step_width,cube_height);

module small_bar(c, x_offset, y_offset, z_offset, length, rotation, hole){
    difference(){
        // Checking if the radius should be a for a hole or a bar
        // radius = hole ? joint_bar_r*1.05 : joint_bar_r; // ORIGINAL
        radius = hole ? 3*1.01 : 3; // THIGHTER
        
        // Making the main bar
        translate([x_offset, y_offset, z_offset])
            color(c)rotate(a = rotation)cylinder(r=radius, h=length, $fn=60, center=true);
        
        // Checking which axis the indents should be along, 
        // and sending is as the offset_push variable when making the indents in the bar.
        if(rotation[0] == 0 && rotation[1] == 0){
            indents(c, x_offset, y_offset, z_offset, length, rotation, hole, offset_push=[1,2,0]);
        } else if(rotation[0] == rotation[2]){
            indents(c, x_offset, y_offset, z_offset, length, rotation, hole, offset_push=[0,1,2]);
        } else {
            indents(c, x_offset, y_offset, z_offset, length, rotation, hole, offset_push=[1,0,2]);
        }
    }
}

module indents(c, x_offset, y_offset, z_offset, length, rotation, hole, offset_push){
    // The Indents on the side
    indent_dis = hole ? 3*1.3*1.02 : 3*1.3;
    k = indent_dis;
    x_push = offset_push[0];
    y_push = offset_push[1];
    z_push = offset_push[2];
    for(j = [[0,k,k],[0,-k,k],[0,k,-k],[0,-k,-k]]){
        translate([x_offset+j[x_push], y_offset+j[y_push], z_offset+j[z_push]])
        color(c)rotate(a = rotation)cylinder(r=3, h=length*2, $fn=60, center=true);
    }
}


module make_lowerpart(cube_lengthX,cube_widthY,cube_heightZ){
    difference(){
        //Making the buttom cube
        cube([cube_lengthX,cube_widthY,cube_heightZ+step_increasement], center=true);
    
        //making the hole in buttomsection
        translate([0,0,-(cube_heightZ/2)+16-step_increasement/2])
            small_bar("yellow", 0, 0, 0, 40, [0,90,0], hole = true);
        
        //making the hole in buttomsection
        translate([0,0,-(cube_heightZ/2)+6-step_increasement/2])
            small_bar("yellow", 0, 0, 0, 40, [0,90,0], hole = true);
    } 
    
 difference(){
    //making the head
    translate([0,0,cube_heightZ/2+step_height/2+step_increasement/2])
        rotate([270,0,0])
            linear_extrude(height = cube_lengthX,center=true)
                polygon (points = [
                    [-B/2, -step_height/2],
                    [-b/2, step_height/2],
                    [b/2, step_height/2],
                    [B/2, -step_height/2]
                ]); 

    translate([0,-cube_widthY/2,cube_heightZ-6+step_increasement/2])
        rotate([25,0,0])
            cube([cube_lengthX,cube_widthY+20,20], center=true);
 }
}



// ---------------OTHER PARTS---------------

//making the body cylinder
    //translate([cube_lengthX/2,0,cube_heightZ-5])
        //color("green")cylinder(20,cube_widthY/2,cube_widthY/2);
