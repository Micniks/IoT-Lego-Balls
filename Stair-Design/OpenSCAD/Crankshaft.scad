//ball_dia = 10;

//Main Bar
bar_r = 5;
bar_l = 60;
indent_dis = bar_r*1.2;

//Joint
joint_dis = 25;
joint_cube = [bar_r*8, bar_r*2, bar_r*2];

//Joint Bar

//Start Bar
difference(){
    //Main Bar
    rotate(a = [90,0,0])cylinder(r=bar_r, h=bar_l, $fn=60, center=true);
    
    //Indents
    translate([indent_dis, 0, indent_dis])
        rotate(a = [90,0,0])cylinder(r=bar_r, h=bar_l*2, $fn=60, center=true);
    translate([-indent_dis, 0, indent_dis])
        rotate(a = [90,0,0])cylinder(r=bar_r, h=bar_l*2, $fn=60, center=true);
    translate([indent_dis, 0, -indent_dis])
        rotate(a = [90,0,0])cylinder(r=bar_r, h=bar_l*2, $fn=60, center=true);
    translate([-indent_dis, 0, -indent_dis])
        rotate(a = [90,0,0])cylinder(r=bar_r, h=bar_l*2, $fn=60, center=true);
}

//Joints
translate([0, bar_l/2, 0])
    cube(joint_cube, center=true);
translate([0, bar_l/2+joint_dis, 0])
    cube(joint_cube, center=true);
translate([0, bar_l/2+joint_dis*2, 0])
    cube(joint_cube, center=true);
translate([0, bar_l/2+joint_dis*3, 0])
    cube(joint_cube, center=true);
translate([0, bar_l/2+joint_dis*4, 0])
    cube(joint_cube, center=true);

//Joint Bars
translate([bar_r*3, bar_l/2+joint_dis*4-joint_dis/2, 0])
    rotate(a = [90,0,0])cylinder(r=bar_r*0.8, h=joint_dis, $fn=60, center=true);
translate([-bar_r*3, bar_l/2+joint_dis*3-joint_dis/2, 0])
    rotate(a = [90,0,0])cylinder(r=bar_r*0.8, h=joint_dis, $fn=60, center=true);
translate([bar_r*3, bar_l/2+joint_dis*2-joint_dis/2, 0])
    rotate(a = [90,0,0])cylinder(r=bar_r*0.8, h=joint_dis, $fn=60, center=true);
translate([-bar_r*3, bar_l/2+joint_dis-joint_dis/2, 0])
    rotate(a = [90,0,0])cylinder(r=bar_r*0.8, h=joint_dis, $fn=60, center=true);
    
//End Bar
difference(){
    //Main Bar
    translate([0,bar_l*2.75,0])
        rotate(a = [90,0,0])cylinder(r=bar_r, h=bar_l, $fn=60, center=true);
    
    //Indents
    translate([indent_dis, bar_l*2.75, indent_dis])
        rotate(a = [90,0,0])cylinder(r=bar_r, h=bar_l*2, $fn=60, center=true);
    translate([-indent_dis, bar_l*2.75, indent_dis])
        rotate(a = [90,0,0])cylinder(r=bar_r, h=bar_l*2, $fn=60, center=true);
    translate([indent_dis, bar_l*2.75, -indent_dis])
        rotate(a = [90,0,0])cylinder(r=bar_r, h=bar_l*2, $fn=60, center=true);
    translate([-indent_dis, bar_l*2.75, -indent_dis])
        rotate(a = [90,0,0])cylinder(r=bar_r, h=bar_l*2, $fn=60, center=true);
}
