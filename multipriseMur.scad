diameter = 58;
outerdiam = 4;
width = 2;
height = 10;
screw = 4;
screwHolder = 12 + width;

$fn = 50;
part = 1;

module screwSupport(right, supHeight, bigger) {
    
    difference() { 
        color([1,0,0]) cube([screwHolder, supHeight, height]);

        translate([screwHolder / 2 + (right * (width / 2 + 1)), supHeight * 2, height / 2]) rotate([90, 0, 0]) cylinder(d = screw, h = supHeight * 4);

        if(bigger == 1) {
            translate([right * width * 2, 0, 0]) cube([screwHolder, supHeight - width, height]);
        }
    }
}

holderHeight = 39;

if(part == 1) {
    union() {
        translate([-diameter / 2, 0, 0]) cube([diameter, width, height]);

        translate([-(diameter / 2 + screwHolder), 0, 0]) screwSupport(-1, holderHeight, 1);
        translate([diameter / 2, 0, 0]) screwSupport(1, holderHeight, 1);
    }
}