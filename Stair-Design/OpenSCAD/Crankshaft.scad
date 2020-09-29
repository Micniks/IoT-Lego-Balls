//ball_dia = 10;

// ---------------CHANGEABLE VARIABLES---------------

//Step Stats
step_width = 20;
step_amounts = 4;

//Main Bar
bar_r = 5;
start_bar_l = 60;
end_bar_l = 10;
indent_dis = bar_r*1.2;

//Joint Bar
joint_bar_r = bar_r;

// ---------------STATIC VARIABLES---------------

//Joint
joint_cube = [bar_r*8, bar_r*2, bar_r*2];
joint_l = step_width - joint_cube[1];

//End Main Bar
joint_amounts = step_amounts > 0 ? step_amounts+1 : step_amounts;
bar_end_dis=  end_bar_l/2+start_bar_l/2 + joint_amounts*joint_cube[1] + step_amounts*joint_l;;


// ---------------STARTING SHAPES---------------

//Start Bar
difference(){
    //Main Bar
    rotate(a = [90,0,0])cylinder(r=bar_r, h=start_bar_l, $fn=60, center=true);
    
    //Indents
    k = indent_dis;
    for(i = [[k,k],[-k,k],[k,-k],[-k,-k]]){
        translate([i[0], 0, i[1]])
            rotate(a = [90,0,0])cylinder(r=bar_r, h=start_bar_l*2, $fn=60, center=true);
    }
}

//End Bar
difference(){
    //Main Bar
    translate([0,bar_end_dis,0])
        rotate(a = [90,0,0])cylinder(r=bar_r, h=end_bar_l, $fn=60, center=true);
    
    //Indents
    k = indent_dis;
    for(i = [[k,k],[-k,k],[k,-k],[-k,-k]]){
        translate([i[0], bar_end_dis, i[1]])
            rotate(a = [90,0,0])cylinder(r=bar_r, h=end_bar_l*2, $fn=60, center=true);
    }
}

//Joints Cubes
if(step_amounts > 0){
    for(i = [0 : step_amounts]){
        translate([0, start_bar_l/2+joint_cube[1]/2+step_width*i, 0])
            cube(joint_cube, center=true);
    }
}

//Joint Bars
if(step_amounts > 0){
    for(i = [1 : step_amounts]){
        side = i%2 == 0 ? bar_r*3 : -bar_r*3;
        translate([side, start_bar_l/2+step_width*i-joint_l/2, 0])
            rotate(a = [90,0,0])cylinder(r=joint_bar_r, h=joint_l, $fn=60, center=true);
    }
}
