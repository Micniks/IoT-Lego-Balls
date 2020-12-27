difference() {
    //frame
    cube([85,55,35], center=true);
    //hole
    translate([-20,0,5]) {    
        cube([40.1,50,30], center=true);
    }
    //bottleneck
    linear_extrude(height = 40, center = true, convexity = 10, twist = 0){
      polygon(points=[[0,28],[45,28],[45,10]], paths=[[0,1,2]]);
      polygon(points=[[0,-28],[45,-28],[45,-10]], paths=[[0,1,2]]);
    }
    
    translate([0,0,15]){
    linear_extrude(height = 40, center = true, convexity = 10, twist = 0){
      polygon(points=[[0,25],[45,7.5], [45,-7.5], [0,-25]], paths=[[0,1,2,3]]);
      }
    }
    
    //side holes
    //front
    translate([-35,100,2.5]) {
        rotate([90,0,0]) {
        cylinder(200,1.5,1.5, $fn=100);
        }    
    }
    //Back holes
    translate([-5,100,2.5]) {
        rotate([90,0,0]) {
        cylinder(200,1.5,1.5, $fn=100);
        }
    }
}

//Ramp
difference(){
    translate([-85/2,55/2,-4.5])
        rotate([90,0,0])
            linear_extrude(height = 55){
                polygon(points=[[0,0],[0,15], [110,0], [110,-1], [0,-1], [0,0]]);
            }
    //bottleneck
    linear_extrude(height = 20, center = true, convexity = 10, twist = 0){
      polygon(points=[[0,28],[45,28],[45,10]], paths=[[0,1,2]]);
      polygon(points=[[0,-28],[45,-28],[45,-10]], paths=[[0,1,2]]);
    }
    
    //side holes
    for(side_x_value = [-35, -5]){
        translate([side_x_value,100,2.5]) {
            rotate([90,0,0]) {
                cylinder(200,1.5,1.5, $fn=100);
            }    
        }
    }
    
    //front sides
    x = 40/2 + 9;
    for(side = [x,-x]){
        translate([60,side,0])    
            cube([31,40,50], center=true);    
    }
}
    
translate([55,0,0]) {
    difference(){
        //end channel
        cube([25,22,35], center=true);
        //cutout cube for channel
        translate([0,0,15]){
            cube([30,17,40], center=true);
        }
        //censor hole
        translate([0,0,2])
            rotate([90,0,0])
                cylinder(200,4,4, $fn=100, center=true);
        
    }
    //censor holder plate
    translate([0,25,-21.25]){
        cube([25,30,2.5], center=true);
        translate([-12.5,-16.5,-1.25]){
            cube([25,2.5,17]);
        }    
        translate([10,-15,-1.25]){
            cube([2.5,30,22]);
        } 
    }
    translate([0,-25,-6.25]){
        cube([25,30,2.5], center=true);
        translate([10,-15,-1.25]){
            cube([2.5,30,7]);
        }    
    }
}