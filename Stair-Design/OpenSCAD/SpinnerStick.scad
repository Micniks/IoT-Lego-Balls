$fn=100;
cylinder(2,6,6);


difference(){
        translate([0,0,0]) {
            cylinder(20, 4.5, 4.5);
        }
        k = 4.5;
        for(i = [[k,k],[-k,k],[k,-k],[-k,-k]]){
            translate([i[0], i[1], -1])
                cylinder(60, 3, 3);
        }
}
difference(){
        translate([0,0,-45]) {
            cylinder(45, 3, 3);
        }
        k = 3.5;
        for(i = [[k,k],[-k,k],[k,-k],[-k,-k]]){
            translate([i[0], i[1], -48])
                cylinder(50, 3, 3);
        }
}