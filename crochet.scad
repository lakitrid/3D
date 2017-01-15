width = 8;

height = 31 + 3;
length = 16;
innerHeight = 3;

holderHigh = 35;
holderReturn = 15;
holderSecure = 6;

screw = 4;



union()  {
    difference()  {
        cube([height + innerHeight, length + innerHeight * 2, width]);

        translate([0, innerHeight, 0]) cube([height, length, width]);

        //translate([innerHeight + 1, 0, width / 2]) rotate([-90, 0 ,0]) cylinder(d = screw, h = length + innerHeight * 2, $fn = 50);
    }

    translate([-(holderHigh), 0, 0]) {
        union() {
            cube([holderHigh, innerHeight, width]);

            translate([0, innerHeight, 0]) {
                union() {
                    cube([innerHeight, length + innerHeight + 10, width]);

                    translate([0, holderReturn + innerHeight + 10, 0]) {
                        union() {
                            cube([holderReturn + innerHeight, innerHeight, width]);

                            translate([holderReturn, -(holderSecure), 0]) cube([innerHeight, holderSecure, width]);
                        }
                    }
                }
            }
        }
    }
}
