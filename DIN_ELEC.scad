/*

DIN base from http://www.thingiverse.com/thing:101024

*/


CLIP_H = 5;
HOLE_DEPTH = 9;
HOLE_DIAMETER = 2.1;
HEIGHT = 2;
EMPTYLength = 35;
EMPTYWidth = 10;

module din_clip() {
	
    union() {
        difference() {
            linear_extrude(height=CLIP_H, center=true, convexity=5) {
                import(file="din_clip_01.dxf", layer="0", $fn=64);
            }
            
            translate([6, (EMPTYLength / 2) + 8 , 0]) {
                cube([ EMPTYWidth,  EMPTYLength, CLIP_H], center = true);
            }
        }
        
        translate([0, 24, 0]) {
            difference() {
                union() {
                    cube([HEIGHT, 48, CLIP_H], center = true);
                    
                    translate([-HEIGHT, 23, 0]) cube([HEIGHT + 4, 2, CLIP_H], center = true);
                    translate([0, 17, 0]) cube([HEIGHT, 10, CLIP_H], center = true);                    
                    translate([-HEIGHT - 2, 19, 0]) cube([HEIGHT, 10, CLIP_H], center = true);
                }
                /*union() {

                    translate([-HEIGHT, 38, 0]) {
                        rotate([0, 90, 0]) {
                            cylinder(h= HOLE_DEPTH, r = HOLE_DIAMETER / 2, $fn = 16);
                        }
                    }

                    translate([-HEIGHT, -38, 0]) {
                        rotate([0, 90, 0]) {
                            cylinder(h= HOLE_DEPTH, r = HOLE_DIAMETER / 2, $fn = 16);
                        }
                    }
                }*/
            }
        }
    }
}

din_clip();

