screw = 5;
screwholderDiam = 20;
height = 8;
holderLength = 50;
leglength = 60;

$fn = 50;

module holder() {
    difference() {
        union() {
            cylinder(d=screwholderDiam, h= height);
            translate([-screwholderDiam / 2, 0, 0]) cube([screwholderDiam, holderLength, height]);
        }

        cylinder(d=screw, h= height);
        translate([0, 0, height / 2]) cylinder(d=screw+4, h= height / 2);                
    }
}

module removeParts() {
    translate([screwholderDiam / 2, holderLength / 2 + screwholderDiam / 4, 0]) 
        resize(newsize=[screwholderDiam / 8*5, holderLength, height])
            cylinder(d=screwholderDiam, h= height);

    translate([-screwholderDiam / 2, holderLength / 2 + screwholderDiam / 4, 0]) 
        resize(newsize=[screwholderDiam / 8*5, holderLength, height])
            cylinder(d=screwholderDiam, h= height);

    color("red") translate([0, 0, height + height / 2]) cylinder(r=holderLength + leglength - screwholderDiam / 4, h = height, center = true);
}

module lidcore() {
    color("green") cube([screwholderDiam, screwholderDiam, height], center = true);

    color("orange") translate([leglength / 2 - screwholderDiam / 2, screwholderDiam, 0]) rotate([0, 0, 45]) lidLeg();
    color("blue") translate([-leglength / 2+ screwholderDiam / 2, screwholderDiam, 0]) rotate([0, 0, 135]) lidLeg();
}

module lidLeg() {
    union() {
        cube([leglength, screwholderDiam, height], center = true);

        translate([leglength / 2- screwholderDiam / 2, 0, height / 2]) 
            cube([screwholderDiam, leglength * 2, height * 2], center = true);
    }
}

difference() {
    union() {
        translate([0, holderLength + screwholderDiam / 2, height / 2]) lidcore();
        holder();
    }

    removeParts();
}