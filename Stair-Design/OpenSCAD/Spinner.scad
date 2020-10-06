$fn=100;
cylinder_height = 20;
cylinder_width = 8;



difference() {
    union() {
    cylinder(cylinder_height, cylinder_width, cylinder_width);
    translate([0,0,6]) {
        //trekant dims
        rotate(-90,[0,1,0]) {
            cylinder(30,9,9,$fn=3);
        }
    }
    //trekant spids
    translate([-30,0,1.5]) {
        cylinder(13.5,7.8,0, $fn=4); 
    }    
}    


    //hul i cylinder
    difference(){
        translate([0,0,-1]) {
            cylinder(30, 5, 5);
        }
        k = 5;
        for(i = [[k,k],[-k,k],[k,-k],[-k,-k]]){
            translate([i[0], i[1], -1])
                cylinder(60, 3, 4);
        }
    }
}



/*    
translate([-3,0,5]) {
    rotate(-90,[0,1,0]) {
        cylinder(50,10,10,$fn=3);
        }
}
*/
    
  
    
    
