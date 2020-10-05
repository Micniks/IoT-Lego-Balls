//cube dimensions


$fn = 100;

make_lowerpart(20,20,40);


module make_lowerpart(cube_lengthX,cube_widthY,cube_heightZ)
{



 difference()
{
    //Making the buttom cube
    translate([0,-cube_widthY/2,-5])
    cube([cube_lengthX,cube_widthY,cube_heightZ]);
    
    //making the hole in buttomsection
    rotate(a=90, v=[0,1,0])
    cylinder(cube_lengthX,3,3);
 }   


    //making the body cylinder
    translate([cube_lengthX/2,0,cube_heightZ-5])
    cylinder(20,cube_widthY/2,cube_widthY/2);



 
 B = 40;
 b = 20;
 h = 15;
 
 
 difference()
 {
 
    //making the head
    translate([cube_lengthX/2,-cube_widthY/2,cube_heightZ + 22])
    rotate([270,0,0])
    linear_extrude(height = cube_lengthX)
    polygon (points = [
       [-B/2, -h/2],
       [-b/2, h/2],
       [b/2, h/2],
       [B/2, -h/2]
    ]); 

    translate([0,-cube_widthY/2,cube_heightZ+18])
    rotate([25,0,0])
    cube([cube_lengthX,cube_widthY+20,20]);
 }

}






