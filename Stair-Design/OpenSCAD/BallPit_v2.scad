difference() {
    //frame
    cube([85,55,15], center=true);
    //hole
    translate([-20,0,5]) {    
        cube([40.1,50,20], center=true);
    }
    //bottleneck
    linear_extrude(height = 20, center = true, convexity = 10, twist = 0){
      polygon(points=[[0,28],[45,28],[45,10]], paths=[[0,1,2]]);
      polygon(points=[[0,-28],[45,-28],[45,-10]], paths=[[0,1,2]]);
    }
    
    translate([0,0,5]){
    linear_extrude(height = 20, center = true, convexity = 10, twist = 0){
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
translate([55,0,0]) {
    difference(){
        //end channel
        cube([25,22,15], center=true);
        //cutout cube for channel
        translate([0,0,5]){
            cube([30,17,20], center=true);
        }
        //censor hole
        rotate([90,0,0]) {
            cylinder(200,4,4, $fn=100, center=true);
        }
    }
    //censor holder plate
    translate([0,25,-21.25]){
        cube([20,30,2.5], center=true);
        translate([-10,-17,-1.25]){
            cube([22.5,2.5,17]);
        }    
        translate([10,-15,-1.25]){
            cube([2.5,30,22]);
        } 
    }
    translate([0,-25,-6.25]){
        cube([20,30,2.5], center=true);
        translate([10,-15,-1.25]){
            cube([2.5,30,7]);
        }    
    }
}











