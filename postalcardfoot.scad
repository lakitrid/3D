footLength = 100;
footWidth = 20;
footHeight = 3;
radius = 3;
position = 30;

HolderDiam = 4;
HolderMargin = 4;
HolderHeight = 40;
Holderlength = 6;

$fn = 50;

module holder() {
    union() {
        cube([footWidth, HolderDiam + HolderMargin, HolderDiam]);

        translate([footWidth / 4, HolderDiam *2 + HolderMargin / 2 * 3 , 0]) 
            difference() {
                cube([footWidth / 2, footWidth, footWidth]);
                translate([footWidth /4, footWidth , sin(45) * footWidth]) 
                    rotate([45, 0, 0]) 
                        cube([footWidth / 2, footWidth, footWidth * 2], center = true);
            }

        rotate([-5, 0, 0]) 
            translate([0, HolderDiam + HolderMargin / 2, 0]) 
                cube([footWidth, Holderlength + HolderMargin / 2, HolderHeight]);
        translate([0, -radius, 0]) cube([footWidth, radius + HolderMargin / 2, HolderDiam + HolderMargin / 2]);

        
        rotate([-5, 0, 0]) 
            translate([0, -(radius + HolderMargin / 2), 0]) cube([footWidth, radius + HolderMargin / 2, HolderDiam *4]);
    }
}

module holderdiff() {
    translate([0, HolderMargin / 2, HolderDiam/ 2]) cube([footWidth, HolderDiam, HolderDiam]);

    translate([0, (HolderDiam + HolderMargin) / 2, HolderDiam / 2]) rotate([0, 90, 0]) cylinder(d=HolderDiam, h=footWidth);
        
    translate([(footWidth - HolderDiam - radius ) / 2, -1, 0])    
    minkowski() {
        translate([radius, radius, 0]) cube([HolderDiam - radius, HolderDiam, HolderHeight]);

        cylinder(r=radius,h=1);
    }
}

difference() {
    union() {
        minkowski() {
            translate([radius, radius, 0])cube([footWidth - radius * 2, footLength - radius * 2, footHeight]);

            cylinder(r=radius,h=1);
        }

        translate([0, position, footHeight]) holder();
    }
    
    translate([0, position, footHeight]) holderdiff();
}

