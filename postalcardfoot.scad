footLength = 30;
footWidth = 20;
footHeight = 4;

HolderDiam = 4;
HolderHeight = 20;

$fn = 50;

module holder() {
    union() {
        difference() {
            cube([footWidth, HolderDiam + 3, HolderDiam]);

            translate([0, 3 / 2, HolderDiam/ 2]) cube([footWidth, HolderDiam, HolderDiam]);

            translate([0, (HolderDiam + 3)/ 2, HolderDiam / 2]) rotate([0, 90, 0]) cylinder(d=HolderDiam, h=footWidth);
        }

        translate([0, HolderDiam + 3, 0]) cube([footWidth, 4, HolderHeight]);
    }
}

union() {
    cube([footWidth, footLength, footHeight]);

    translate([0, footLength/ 6, footHeight]) holder();
}

