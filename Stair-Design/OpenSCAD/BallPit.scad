

difference()
{
difference()
{
cube([140,100,20],center = true);
translate([-25,-45,-5])    
cube([90,90,20]);

}


    //making the head
    translate([-30,0,8])
        rotate([0,0,90])
            linear_extrude(height = 25,center=true)
                polygon (points = [
                    [-45, -6],
                    [-9, 45],
                    [9, 45],
                    [45, -6]
                ]);
//Hole for spinner
translate([-15,0,-15])
cylinder(15,6,6);

//Cutting away material at the corners
translate([-95,38,-15])
rotate([0,0,-55])
cube([30,80,30]);

translate([-38,-78,-15])
rotate([0,0,55])
cube([30,80,30]);

}