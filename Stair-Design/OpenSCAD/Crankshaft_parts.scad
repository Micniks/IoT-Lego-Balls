//ball_dia = 10;

// ---------------PRINT FOLLOWING PARTS---------------
print_start_bar = true;
print_joint_cubes = true;
print_joint_bars = true;
print_end_bar = true;

// ---------------CHANGEABLE VARIABLES---------------
//Step Stats
step_width = 20;
step_amounts = 4;

//Main Bar
bar_r = 5;
start_bar_l = 60;
end_bar_l = 10;

//Joint Bar
joint_bar_r = bar_r*0.6;

// ---------------STATIC VARIABLES---------------

//Joint
joint_cube = [bar_r*8, bar_r*2, bar_r*2];
joint_l = step_width+joint_cube[1]*1.1;

//End Main Bar
joint_amounts = step_amounts > 0 ? step_amounts+1 : step_amounts;
bar_end_dis = end_bar_l/2 + start_bar_l/2 + joint_cube[1]+ (step_width*step_amounts);

//Indents
indent_dis_main = bar_r*1.2;
indent_dis_joint = joint_bar_r*1.3;

// ---------------STARTING SHAPES---------------

//Start Bar
if(print_start_bar){
    difference(){
        //Main Bar
        rotate(a = [90,0,0])cylinder(r=bar_r, h=start_bar_l, $fn=60, center=true);
    
        //Indents
        k = indent_dis_main;
        for(i = [[k,k],[-k,k],[k,-k],[-k,-k]]){
            translate([i[0], 0, i[1]])
                rotate(a = [90,0,0])cylinder(r=bar_r, h=start_bar_l*2, $fn=60, center=true);
        }
    }
}

//End Bar
if(print_end_bar){
    difference(){
        //Main Bar
        translate([0,bar_end_dis,0])
            rotate(a = [90,0,0])cylinder(r=bar_r, h=end_bar_l, $fn=60, center=true);
    
        //Indents
        k = indent_dis_main;
        for(i = [[k,k],[-k,k],[k,-k],[-k,-k]]){
            translate([i[0], bar_end_dis, i[1]])
                rotate(a = [90,0,0])cylinder(r=bar_r, h=end_bar_l*2, $fn=60, center=true);
        }
    }
}

//Joints Cubes
if(step_amounts > 0){
    for(i = [0 : step_amounts]){
        //y_offset = start_bar_l/2+step_width*i-joint_cube[1]/2;
        y_offset = start_bar_l/2 + (step_width)*(i-1) + joint_l/2 - 0.5;
        startbar_printing = i != 0 || (i == 0 && print_start_bar);
        endbar_printing = i != step_amounts || (i == step_amounts && print_end_bar);
        if(print_joint_cubes && startbar_printing && endbar_printing){
            difference(){
                translate([0, start_bar_l/2+joint_cube[1]/2+step_width*i, 0])
                    cube(joint_cube, center=true);
                for(side = [bar_r*3, -bar_r*3]){
                    difference(){
                        translate([side, y_offset, 0])
                            rotate(a = [90,0,0])cylinder(r=joint_bar_r*1.05, h=joint_l*10, $fn=60, center=true);
                        //Indents
                        k = indent_dis_joint*1.03;
                        for(j = [[k,k],[-k,k],[k,-k],[-k,-k]]){
                            translate([side+j[0], y_offset, 0+j[1]])
                                rotate(a = [90,0,0])cylinder(r=joint_bar_r, h=joint_l*10, $fn=60, center=true);
                        }
                    }
                }
            }
        }
        
//Joint Bars
        if(i != 0 && print_joint_bars){
            side = i%2 == 0 ? bar_r*3 : -bar_r*3;
            difference(){
                translate([side, y_offset, 0])
                    rotate(a = [90,0,0])cylinder(r=joint_bar_r, h=joint_l, $fn=60, center=true);
                //Indents
                k = indent_dis_joint;
                for(j = [[k,k],[-k,k],[k,-k],[-k,-k]]){
                    translate([side+j[0], y_offset, 0+j[1]])
                        rotate(a = [90,0,0])cylinder(r=joint_bar_r, h=joint_l*2, $fn=60, center=true);
                }
            }
        }
    }
}
