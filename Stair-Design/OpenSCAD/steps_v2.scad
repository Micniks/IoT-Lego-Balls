//cube dimensions


// ---------------CHANGEABLE VARIABLES---------------
//Step head
step_height = 15;
step_width = 20;
step_number = 0;

B = 40;
b = 20;

//Cube
cube_height = 40;


// ---------------STATIC VARIABLES---------------
$fn = 100;
make_lowerpart(step_width,step_width,cube_height+(step_height*step_number));


module make_lowerpart(cube_lengthX,cube_widthY,cube_heightZ){

    difference(){
        //Making the buttom cube
        cube([cube_lengthX,cube_widthY,cube_heightZ], center=true);
    
        //making the hole in buttomsection
        translate([0,0,-(cube_heightZ/2)+14])
            rotate(a=90, v=[0,1,0])
                cylinder(h=cube_lengthX*2,r=3.1, center=true);
        
        //making the hole in buttomsection
        translate([0,0,-(cube_heightZ/2)+4])
            rotate(a=90, v=[0,1,0])
                cylinder(h=cube_lengthX*2,r=3.1, center=true);
    } 
 

 
 difference(){
    //making the head
    translate([0,0,cube_heightZ/2+step_height/2])
        rotate([270,0,0])
            linear_extrude(height = cube_lengthX,center=true)
                polygon (points = [
                    [-B/2, -step_height/2],
                    [-b/2, step_height/2],
                    [b/2, step_height/2],
                    [B/2, -step_height/2]
                ]); 

    translate([0,-cube_widthY/2,cube_heightZ-6])
        rotate([25,0,0])
            cube([cube_lengthX,cube_widthY+20,20], center=true);
 }

}


// ---------------OTHER PARTS---------------

//making the body cylinder
    //translate([cube_lengthX/2,0,cube_heightZ-5])
        //color("green")cylinder(20,cube_widthY/2,cube_widthY/2);
