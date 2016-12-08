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
        
        translate([0, 25, 0]) {
            difference() {
                union() {
                    cube([HEIGHT, 50, CLIP_H], center = true);
                    
                    translate([-HEIGHT, 24, -7.5]) cube([HEIGHT + 4, 2, CLIP_H + 15], center = true);
                    translate([-HEIGHT - 2, 18, -7.5]) cube([HEIGHT, 5, CLIP_H + 15], center = true);                    
                    translate([-HEIGHT - 2, 22, -7.5]) cube([HEIGHT, 5, CLIP_H + 15], center = true);
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

