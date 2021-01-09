/*
Motor mål
--------------------
Diameter: 32.08 mm
Pin: 7.5 mm offset fra center
Huller: 38 mm i mellem
Huller Diameter = 3 mm
Holder tykkelse: 8 mm

Base Width: 55 mm
Base whole distance: 30 mm
*/
motorDiameter = 32.08+1;

baseWidth = 40;
baseLength = 65;
baseThick = 13;

motorMountWidth = 50;
motorMountLength = 15;
motorMountThick = 8;

baseCutOutWidth =  baseWidth-10;
baseCutOutLength = baseLength-15;

holeWidth = 40;


/*
difference(){
    cube([baseWidth,baseLength,baseThick]);
    translate([5,baseLength/2-(baseCutOutLength/2),0]){
        cube([baseCutOutWidth,baseCutOutLength,baseThick*2]);
    }    
}
*/

translate([baseWidth,baseLength/2-(motorMountWidth/2),0]){    
            difference(){
            union(){
            cube([motorMountLength,motorMountWidth,baseThick]);
            translate([motorMountLength,0,0])
            cube([motorMountThick,motorMountWidth,motorMountWidth]);
            }
            translate([motorMountLength,0,0]){
            translate([0,motorMountWidth/2-(motorDiameter/2),28]){    
                cube([motorMountThick,motorDiameter,99]);
            }   
                rotate([0,90,0]){
                    translate([-17 - baseThick,motorMountWidth/2,-20]){
                        cylinder(46,d=motorDiameter, $fn=60);
                        for(side = [holeWidth/2,-(holeWidth/2)]){
                            translate([0,side,20]){
                                cylinder(h=10,d=4, $fn=60);
                            }
                        }    
                    }
                }
            }      
    }    

}    

/*
for(postion = [[0,55+5,0], [0,-2.5,0], [30,-2.5,0],[30,55+5,0]]){
    translate(postion){
        difference(){
        cube([7.5,7.5,115]);
        translate([3.75,10,110]){
        rotate([90,0,0]) {
          cylinder(20,1.5,1.5, $fn=100);
          }   
        }
      }
    }
}    
*/   


/*-------------GraveYard-------------*/

/*
translate([-27.5,0,0]){
 cube([25,10,5], center=true);
    
 translate([-17.5,0,0]){
    cube([10,50,5], center=true);   
 }   
}

translate([-15,-28.5,-5]) {
    difference(){
    %cube([5,5,legHeight]);
    translate([0,0,holeInLeg]){
        rotate([90,0,0]) {
            cylinder(20,1.5,1.5, $fn=100, center=true);
            } 
        }
    }
}  
translate([-12.5,26.5,legHeight/2]) {
    difference(){
    cube([5,5,legHeight], center=true);
    translate([0,0,holeInLeg]){
        rotate([90,0,0]) {
            cylinder(20,1.5,1.5, $fn=100, center=true);
            } 
        }
    }
}  
translate([12.5,-26.5,legHeight/2]) {
    difference(){
    cube([5,5,legHeight], center=true);
    translate([0,0,holeInLeg]){
        rotate([90,0,0]) {
            cylinder(20,1.5,1.5, $fn=100, center=true);
            } 
        }
    }
}  
translate([12.5,26.5,legHeight/2]) {
    difference(){
    cube([5,5,legHeight], center=true);
    translate([0,0,105*0.5]){
        rotate([90,0,0]) {
            cylinder(20,1.5,1.5, $fn=100, center=true);
            } 
        }
    }
    
}*/