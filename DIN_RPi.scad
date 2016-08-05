/*

DIN base from http://www.thingiverse.com/thing:101024

*/

CLIP_H = 8;
HOLE_DEPTH = 9;
HOLE_DIAMETER = 3;
HEIGHT = 2;
EMPTYLength = 35;
EMPTYWidth = 10;
TotalSize = 65;
Upper = 8;

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
        
        translate([0, TotalSize / 2 - Upper, 0]) {
            difference() {
                cube([HEIGHT, TotalSize, CLIP_H], center = true);
            
                union() {

                    translate([-HEIGHT, TotalSize / 2 - (2 + HOLE_DIAMETER / 2), 0]) {
                        rotate([0, 90, 0]) {
                            cylinder(h= HOLE_DEPTH, r = HOLE_DIAMETER / 2, $fn = 16);
                        }
                    }

                    translate([-HEIGHT, -TotalSize / 2 + (2 + HOLE_DIAMETER / 2), 0]) {
                        rotate([0, 90, 0]) {
                            cylinder(h= HOLE_DEPTH, r = HOLE_DIAMETER / 2, $fn = 16);
                        }
                    }
                }
            }
        }
    }
}

din_clip();

