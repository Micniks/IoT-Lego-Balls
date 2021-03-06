// ---------------PRINT FOLLOWING PARTS---------------
show_all = false; // Will force all parts to be shown at once.
print_single = true;

print_start_bar = false; //Color = Yellow
print_joint_cubes = false; //Color = Cyan
print_joint_bars = false; //Color = Blue
print_end_bar = false; //Color = Yellow
print_step_bar_joints = false; //Color = Green
print_lifting_joint_bars = false; //Color = Orange
print_slider_bar_joint = false; //Color = Red
print_step_holder_joint = false; //Color = Grey
print_support_base_front = false; //Color = Lime
print_support_base_back = true; //Color = Lime
print_support_base_step = true; //Color = Purple
print_support_bars = false; //Color = Pink

// For simulating the step from other file
print_step_box = false;

print_singles = show_all ? false : print_single; //Will reduce the amount of steps to 1 if true, and only print one model of each type.

// ---------------CHANGEABLE VARIABLES---------------
//Step Stats
step_width = 20;
step_length_x = 20;
step_amount = 4;

//Main Bar
bar_r = 5;
start_bar_l = 30;
end_bar_l = 10;

//Joint Bar
joint_bar_r = bar_r*0.6;

// ---------------STATIC VARIABLES---------------

//Amount of steps
step_amounts = print_singles ? 1 : step_amount;

//Joint
joint_cube = [bar_r*6, bar_r*2, bar_r*2];
joint_l = step_width+joint_cube[1]*1.1;

//End Main Bar
joint_amounts = step_amounts > 0 ? step_amounts+1 : step_amounts;
bar_end_dis = end_bar_l/2 + start_bar_l/2 + joint_cube[1]+ (step_width*step_amounts);

//Indents
indent_dis_main = bar_r*1.2;
indent_dis_joint = joint_bar_r*1.3;

//Step-Bar-Joint
step_bar_joint_h = joint_cube[2]*2;

//Other
y_length = bar_end_dis + end_bar_l*2;
step_support_width = step_width-0.3;

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

// ---------------SETTING SHAPES---------------

//Start Bar, Color = Yellow
if(show_all ? true : print_start_bar){
    difference(){
        //Main Bar
        rotate(a = [90,0,0])cylinder(r=bar_r, h=start_bar_l, $fn=100, center=true);
        difference(){
            translate([0,5/2 -start_bar_l/2,0])
                rotate(a = [90,0,0])cylinder(d=5, h=5*1.1,, $fn=100, center=true);
            translate([0,5/2 -start_bar_l/2,2.5])
                cube([8,20,1], center=true);
            translate([0,5/2 -start_bar_l/2,-2.5])
                cube([8,20,1], center=true);
        }
        //Indents
        /*
        k = indent_dis_main;
        for(i = [[k,k],[-k,k],[k,-k],[-k,-k]]){
            translate([i[0], 0, i[1]])
                rotate(a = [90,0,0])cylinder(r=bar_r, h=start_bar_l*2, $fn=60, center=true);
        }
        */
    }
}

//End Bar, Color = Yellow
if(show_all ? true : print_end_bar){
    difference(){
        //Main Bar
        translate([0,bar_end_dis,0])
            rotate(a = [90,0,0])cylinder(r=bar_r, h=end_bar_l, $fn=100, center=true);
    
        //Indents
        /*
        k = indent_dis_main;
        for(i = [[k,k],[-k,k],[k,-k],[-k,-k]]){
            translate([i[0], bar_end_dis, i[1]])
                rotate(a = [90,0,0])cylinder(r=bar_r, h=end_bar_l*2, $fn=60, center=true);
        }
        */
    }
}

//Support Core, Color = Lime
if(show_all ? true : print_support_base_front){
    //Start Bar Holder
    y_length = step_width*2+0.3;
    translate([0,0,-joint_l])
            color("lime")cube([bar_r*3,y_length,bar_r*2], center=true);
    translate([0, y_length/4+(step_width-0.3)/2+10.2, -joint_l])
        color("lime")cube([10+1, 5+1,bar_r*2], center=true);
    translate([0, y_length/4+(step_width-0.3)/2+5, -joint_l])
        color("lime")cube([5+1 ,10,bar_r*2], center=true);
    difference(){
        translate([0,0,bar_r/2-(joint_l/2)])
            color("lime")cube([bar_r*4,bar_r,joint_l+bar_r*2*1.5], center=true);
        translate([0,0,0])
            rotate(a = [90,0,0])cylinder(r=bar_r*1.05, h=bar_r*2, $fn=60, center=true);
        translate([0,0,(bar_r*4/2)])
            rotate(a = [90,0,0])cube([(bar_r*1.05)*2,bar_r*4,bar_r*10], center=true);
    }
    echo(joint_l+bar_r);
}
if(show_all ? true : print_support_base_back){
    
    //End Bar Holder
    y_length = step_width+0.3;
    
    difference(){
        union(){
            translate([0,bar_end_dis,bar_r/2-(joint_l/2)])
                color("lime")cube([bar_r*4,bar_r,joint_l+bar_r*2*1.5], center=true);
            translate([0,bar_end_dis,-joint_l])
                color("lime")cube([bar_r*3,y_length,bar_r*2], center=true);
        }
        translate([0,bar_end_dis,0])
            rotate(a = [90,0,0])cylinder(r=bar_r*1.05, h=bar_r*2, $fn=60, center=true);
        translate([0,bar_end_dis,(bar_r*4/2)])
            rotate(a = [90,0,0])cube([(bar_r*1.05)*2,bar_r*4,bar_r*10], center=true);
        /*
        translate([0, bar_end_dis-0.2, -joint_l])
            cube([10,5,bar_r*2.5], center=true);
        translate([0, bar_end_dis-5.2, -joint_l])
            %cube([5,10,bar_r*2.5], center=true);
        translate([-5, bar_end_dis-0.2, -joint_l+6.2])
            rotate([90,0,0])linear_extrude(height = 5, center=true)
                polygon (points = [[0, 0],[10, 0],[5, 12]]);
        */
    }
        
}

//For Each Step
if(step_amounts > 0){
    for(i = [0 : step_amounts]){
        y_offset = start_bar_l/2 + (step_width)*(i-1) + joint_l/2 - 0.5;
        
//Joints Cubes, Color = Cyan
        startbar_printing = i != 0 || (i == 0 && (show_all ? true : print_start_bar));
        endbar_printing = i != step_amounts || (i == step_amounts && (show_all ? true : print_end_bar));
        if((show_all ? true : print_joint_cubes) && startbar_printing && endbar_printing){
            difference(){
                translate([0, start_bar_l/2+joint_cube[1]/2+step_width*i, 0])
                    color("cyan")cube(joint_cube, center=true);
                for(side = [bar_r*2, -bar_r*2]){
                    small_bar("yellow", side, y_offset, 0, joint_l, [90,0,0], hole = true);
                }
            }
        }
        
//Joint Bars, Color = Blue
        if(i != 0 && (show_all ? true : print_joint_bars)){
            side = i%2 == 0 ? bar_r*2 : -bar_r*2;
            small_bar("blue", side, y_offset, 0, joint_l, [90,0,0], hole = false);
        }
        
//Step Bar Joints, Color = Green
        if(i != 0 && (show_all ? true : print_step_bar_joints)){
            side = i%2 == 0 ? bar_r*2 : -bar_r*2;
            difference(){
                translate([side, y_offset, joint_cube[2]/2])
                    color("green")cube([bar_r*2, step_width-joint_cube[1]-1, bar_r*4], center=true);
                //Upper Hole
                difference(){
                    translate([side, y_offset, joint_cube[2]])
                        rotate(a = [90,0,90])cylinder(r=joint_bar_r*1.05, h=joint_l*10, $fn=60, center=true);
                }
                //Lower Hole
                difference(){
                    translate([side, y_offset, 0])
                        rotate(a = [90,0,0])cylinder(r=joint_bar_r*1.05, h=joint_l*10, $fn=60, center=true);
                }
            }
        }
//Lifting Joint Bars, Color = Orange
        if(i != 0 && (show_all ? true : print_lifting_joint_bars)){
            h_array = print_singles ? [joint_cube[2]] : [joint_cube[2], joint_cube[2]*4, joint_cube[2]*5];
            for(h = h_array){
                small_bar("orange", 0, y_offset, h, joint_l*2, [90,0,90], hole = false);
            }
        }
//Slider Bar Joint, Color = Red
        if(i != 0 && (show_all ? true : print_slider_bar_joint)){
            side_array_red = print_singles ? [bar_r*6.1] : [bar_r*6.1, -bar_r*6.1];
            for(side = side_array_red){
                difference(){
                    translate([side, y_offset, joint_cube[2]*3])
                        color("red")cube([bar_r*4, step_width-joint_cube[1]-1, bar_r*10], center=true);
                    //Indents
                    for(h = [joint_cube[2],joint_cube[2]*4, joint_cube[2]*5]){
                        small_bar("yellow", 0, y_offset, h, joint_l*2, [90,0,90], hole = true);
                    }
                    side_plus = side > 0 ? bar_r : -bar_r;
                    translate([side+side_plus, y_offset, 0])
                        cylinder(r=joint_bar_r*1.05, h=joint_l*10, $fn=60, center=true);
                }
            }
        }
// Step Holder Joint, Color = Grey
        if(i != 0 && (show_all ? true : print_step_holder_joint)){
            side_length = bar_r+step_length_x/2 + 0.5;
            side_array_grey = print_singles ?[side_length] : [side_length, -side_length];
            for(side = side_array_grey){
                difference(){
                    translate([side,y_offset,joint_cube[2]*4.5])
                        color("grey")cube([bar_r*2, step_width-joint_cube[1]-1, joint_cube[2]*2], center=true);
                    for(h = [joint_cube[2]*4, joint_cube[2]*5]){
                        small_bar("yellow", 0, y_offset, h, joint_l*2, [90,0,90], hole = true);
                    }
                }
            }
        }
        
// Support-base, Color = Purple
        if(i != 0 && (show_all ? true : print_support_base_step)){
            difference(){
                translate([0, y_offset, -joint_l])
                    color("purple")cube([(support_side_array[0]+bar_r)*2,step_support_width,bar_r*2], center=true);
                support_side_array = [bar_r*6.1+bar_r,-bar_r*6.1-bar_r];
                for(side = support_side_array){
                    small_bar("yellow", side, y_offset, -joint_l, joint_l*1.2, [0,0,0], hole = true);
                }
                translate([0, y_offset, -joint_l])
                    cube([10,5,bar_r*4], center=true);
                translate([0, y_offset-5, -joint_l])
                    cube([5,10,bar_r*4], center=true);
            }
            translate([0, y_offset+(step_width-0.3)/2+10.2, -joint_l])
                color("purple")cube([10 - 0.7, 5 - 0.7,bar_r*2], center=true);
            translate([0, y_offset+(step_width-0.3)/2+5, -joint_l])
                color("purple")cube([5 - 0.7,10,bar_r*2], center=true);
        }
// Support-bars, Color = Pink
        if(i != 0 && (show_all ? true : print_support_bars)){
            support_side_array = print_singles ? [bar_r*6.1+bar_r] : [bar_r*6.1+bar_r,-bar_r*6.1-bar_r];
            for(side = support_side_array){
                small_bar("pink", side, y_offset, 120/4, 120, [0,0,0], hole = false);
            }
        }
        // Simulate the cube of the step
        if(i != 0 && print_step_box){
            translate([0,y_offset,joint_cube[2]*3.5+15])
                cube([20,19,30], center=true);
        }
    }
    
}