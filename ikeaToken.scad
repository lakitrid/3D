diam = 6;
length = 10;

Holder = 10;
Thick = 6;
rim = 4;
rimHeight = 2;

$fn = 50;

union() {
    difference() {
        cube([Holder, Holder, Thick], center = true);
        
        translate([0, 0, 0])
            difference() {
                cube([Holder, Holder, rimHeight], center = true);
                cube([Holder - rim, Holder - rim, rimHeight], center = true);            
            }
    }
    
    translate([0, 0, Thick / 2 + length / 2])
        rotate([0, 0, 0])
            cylinder(d = diam, h=length, center = true);
}