diameter = 58;
outerdiam = 7;
width = 10;
height = 10;
screw = 4;
nut = 6;
screwHolder = 14;

$fn = 50;
part = 0;

module screwSupport(right, supHeight, bigger) {
    difference() {     
        cube([screwHolder, supHeight, height]);

        if(part == 0) {
            translate([screwHolder / 2 + (right), supHeight * 2, height / 2]) rotate([90, 0, 0]) cylinder(d = screw, h = supHeight * 4);
            translate([screwHolder / 2 + (right), width/4, height / 2]) rotate([90, 0, 0]) cylinder(d = nut, h = width / 2, $fn = 6);
        } else 
        {
            translate([screwHolder / 2 + (right), supHeight * 2, height / 2]) rotate([90, 0, 0]) cylinder(d = screw, h = supHeight * 4);
        }

        if(bigger == 1) {
            translate([right * outerdiam / 2, 0, 0]) cube([screwHolder, supHeight - width, height]);
        }
    }
}

if(part == 0) {
    union() {
        difference() {
            cylinder(d = diameter + outerdiam, h = height);
            cylinder(d = diameter, h = height);

            translate([-diameter, 0, 0]) cube([diameter * 2, (diameter + width), height]);
        }

        translate([-(diameter / 2 + screwHolder), 0, 0]) screwSupport(-1, width / 2);
        translate([diameter / 2, 0, 0]) screwSupport(1, width / 2);
    }
}


holderHeight = diameter / 2 + 30;

if(part == 1) {
    union() {
        translate([-diameter / 2, 0, 0]) cube([diameter, width, height]);

        translate([-(diameter / 2 + screwHolder), 0, 0]) screwSupport(-1, holderHeight + 4, 1);
        translate([diameter / 2, 0, 0]) screwSupport(1, holderHeight + 4, 1);
    }
}