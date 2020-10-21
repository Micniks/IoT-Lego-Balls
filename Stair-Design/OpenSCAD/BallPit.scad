

difference()
{
difference()
{
cube([140,100,20],center = true);
translate([-25,-45,-4.5])    
cube([90,90,20]);

}


    //making the head
    translate([-30,0,8])
        rotate([0,0,90])
            linear_extrude(height = 25,center=true)
                polygon (points = [
                    [-45, -5.5],
                    [-9, 45],
                    [9, 45],
                    [45, -5.5]
                ]);
//Hole for spinner
translate([-15,0,-15])
cylinder(15,6,6, $fn=100);

//Cutting away material at the corners
translate([-95,38,-15])
rotate([0,0,-55])
cube([30,80,30]);

translate([-38,-78,-15])
rotate([0,0,55])
cube([30,80,30]);

//Making holes in the side to fit the baseplate
//Front holes
translate([-20,100,5]) {
    rotate([90,0,0]) {
    cylinder(200,2.5,2.5, $fn=100);
    }
    
}
//Back holes
translate([60,100,5]) {
    rotate([90,0,0]) {
    cylinder(200,2.5,2.5, $fn=100);
    }
    
}

}