// ---------------CHANGEABLE VARIABLES---------------

//Step Stats
step_width = 25;
step_length_x = 20;

//Bars
bar_r = 5;
joint_bar_r = bar_r*0.6;

//Joint
joint_cube = [bar_r*6, bar_r*2, bar_r*2];
joint_l = step_width+joint_cube[1]*1.1;

//Cube
cube_length = bar_r*2;

//Ball bearing in diameter
bearing = 6.95;

//Indents
indent_dis_joint = joint_bar_r*1.3;


// ---------------MODULE SHAPES---------------

module small_bar(c, x_offset, y_offset, z_offset, length, rotation, hole){
    difference(){
        // Checking if the radius should be a for a hole or a bar
        // radius = hole ? joint_bar_r*1.05 : joint_bar_r; // ORIGINAL
        radius = hole ? joint_bar_r*1.01 : joint_bar_r; // THIGHTER
        
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
    indent_dis = hole ? indent_dis_joint*1.02 : indent_dis_joint;
    k = indent_dis;
    x_push = offset_push[0];
    y_push = offset_push[1];
    z_push = offset_push[2];
    for(j = [[0,k,k],[0,-k,k],[0,k,-k],[0,-k,-k]]){
        translate([x_offset+j[x_push], y_offset+j[y_push], z_offset+j[z_push]])
        color(c)rotate(a = rotation)cylinder(r=joint_bar_r, h=length*2, $fn=60, center=true);
    }
}

// ---------------OBEJCT CODE---------------


//Red-Green cube
difference(){
    union(){
    // Red Cube
    translate([0, 0, joint_cube[2]*3])
        color("red")cube([cube_length, step_width-joint_cube[1]-1, bar_r*10], center=true);
    //Green cube - Hvis den skal beefes op, fjern 0.5 i cube_length og sæt *2 i -bar_r
    translate([-bar_r*1.5, 0, joint_cube[2]*3])
        color("green")cube([cube_length*0.5, step_width-joint_cube[1]-1, bar_r*5], center=true);
    }    
    //Indents
    for(h = [joint_cube[2],joint_cube[2]*4, joint_cube[2]*5]){
        small_bar("yellow", bar_r*7, 0, h, joint_l*2, [90,0,90], hole = true);
    }
    translate([-bar_r, 0, 0]) //sæt evt -bar_r*2 hvis hul skal være i grøn cube kun, men så skal bredden på grøn beefes lidt op
        cylinder(d=bearing+0.1, h=joint_l*10, $fn=60, center=true);
}


//Grey Cube
difference(){
    translate([cube_length/2+bar_r,0,joint_cube[2]*4.5])
        color("grey")cube([bar_r*2, step_width-joint_cube[1]-1, joint_cube[2]*2], center=true);
    for(h = [joint_cube[2]*4, joint_cube[2]*5]){
        small_bar("yellow", 0, 0, h, joint_l*2, [90,0,90], hole = true);
    }
}
       