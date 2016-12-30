diameter = 58;
width = 3;
height = 2;
screw = 4;
screwHolder = 10 + width;

$fn = 50;
part = 0;

module screwSupport(right) {
    difference() {     
        cube([screwHolder, width, height]);

        translate([screwHolder / 2 + (right * width / 2), width * 2, height / 2]) rotate([90, 0, 0]) cylinder(d = screw, h = width * 4);
    }
}

if(part == 0) {
    union() {
        difference() {
            cylinder(d = diameter + width, h = height);
            cylinder(d = diameter, h = height);

            translate([-diameter, 0, 0]) cube([diameter * 2, (diameter + width), height]);
        }

        //translate([-(diameter / 2 + screwHolder), 0, 0]) screwSupport(-1);
        //translate([diameter / 2, 0, 0]) screwSupport(1);
    }
}