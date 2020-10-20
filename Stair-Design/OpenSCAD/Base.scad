difference() {
union() {
//Base cube
cube([121,90,10]);

//Extention cube for step
translate([60.5,140,5] ) {
    cube([35,130,10], center=true);   
}

//Column 1
cube([10, 10,80]);

//Column 2
translate([111,0,0]) {
    cube([10, 10,80]);
}

//Column 3
translate([0,80,0]) {
    cube([10, 10,75]);
}

//Column 4
translate([111,80,0]) {
    cube([10, 10,75]);
}

//End stabilizer cube
translate([60.5,197.5,20]) {
    cube([15,15,20], center=true);
}

}
//Hole in base
translate([15,15,-5]) {
    cube([90,60,20]);
}
//Hole for column 1 and 2
translate([-50,5,75]) {
    rotate([0,90,0]) {
    cylinder(200,2.5,2.5, $fn=100);
    }
    
}

//Hole for column 3 and 4
translate([-50,85,70]) {
    rotate([0,90,0]) {
    cylinder(200,2.5,2.5, $fn=100);
    }
    
}
//Holes in extention
translate([-50,100,5]) {
    rotate([0,90,0]) {
    cylinder(200,2.5,2.5, $fn=100);
    }
    
}

translate([-50,120,5]) {
    rotate([0,90,0]) {
    cylinder(200,2.5,2.5, $fn=100);
    }
    
}

translate([-50,140,5]) {
    rotate([0,90,0]) {
    cylinder(200,2.5,2.5, $fn=100);
    }
    
}

translate([-50,180,5]) {
    rotate([0,90,0]) {
    cylinder(200,2.5,2.5, $fn=100);
    }
    
}

//Hole in the end stabilizer cube
translate([60.5, 220, 25]) {
    rotate([90,0,0]) {
    cylinder(50,2.5,2.5, $fn=100);
    }
}

}
