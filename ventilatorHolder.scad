screwDiam = 4 + 2*0.4;
height = 2;
length = 25;
width = 7;
radius = 2;

$fn = 50;

difference() {
        minkowski() {
            cube([length, width, height], center = true);
            
            cylinder(r=radius,h=1);
        }

        minkowski() {
            cube([length - screwDiam * 3 - 4, width / 2 - 2, height], center = true);
            
            cylinder(r=radius,h=1);
        }

    translate([(length / 2) - screwDiam/2, 0 ,  0]) cylinder(d = screwDiam, h = height + 2, center = true);
    translate([(-length / 2) + screwDiam/2, 0 ,  0])cylinder(d = screwDiam, h = height + 2, center = true);
}