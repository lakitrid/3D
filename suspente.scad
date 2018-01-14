nbsuspente = 10;

epaisseur = 4;
diamInt = 6;
hauteurCentre = 10;
hauteur = 5;
hauteurSupport = 2;

deportR = 50;

diamSupport = 30;
diamIntCentre = 8;
armLength = deportR - diamSupport / 2 - diamInt / 2;
armIntLength = diamSupport / 2 - diamIntCentre / 2;

cable = 5;
intAngle = 52;
extAngle = 55;

$fn = 50;

module support() {
    difference() {
        cylinder(d = diamInt + epaisseur, h = hauteur);

        cylinder(d = diamInt, h = hauteur);
    }
}

module cable(zAngle) {
    translate([0,0,hauteur])
        rotate([-10,0,zAngle])
            cube([cable, cable, hauteur * 4], center = true);
}

module center() {
    difference() {
        cylinder(d = diamSupport + epaisseur, h = hauteurSupport);

        cylinder(d = diamSupport, h = hauteurSupport);
    }

    difference() {
        cylinder(d = diamIntCentre + epaisseur, h = hauteurCentre);

        cylinder(d = diamIntCentre, h = hauteurCentre);
    }

    for(i = [0:4]) {
        rotate([0, 0, 360 / 4 * i])
            translate([armIntLength / 2 + (diamIntCentre) / 2, 0, hauteurSupport / 2]) 
                cube([armIntLength, epaisseur, hauteurSupport], center = true);
    }
}

module arm() {
    translate([armLength / 2 + (diamSupport) / 2, 0, hauteurSupport / 2]) cube([armLength, epaisseur, hauteurSupport], center = true);
}

difference() {
    union()  {
        center();

        for(i = [0:nbsuspente - 1]) {
            translate([cos(360 / nbsuspente * i) * deportR, sin(360 / nbsuspente * i) * deportR, 0]) support();

            
            rotate([0, 0, 360 / nbsuspente * i]) arm();
        }
    }

    translate([diamIntCentre / 2 * cos(intAngle), diamIntCentre / 2 * sin(intAngle), 0]) cable(intAngle);
    translate([diamSupport / 2 * cos(extAngle), diamSupport / 2 * sin(extAngle), 0]) cable(extAngle);
}