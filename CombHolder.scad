HolderLength = 100;
HolderWidth = 30;
HolderHeight = 40;
HolderThick = 2;

cylDiam = 4;
cylLength = 8;
cylInterval = 80;
cylFromFront = 10;
cylFromTop = 10;

bottomEmptyCount = 8;
backEmptyCount = 3;
sideEmptyCount = 1;
bottomEmptyW = (HolderLength - 2 * HolderThick) / (bottomEmptyCount + 4);
bottomEmptyL = (HolderWidth - 4 * HolderThick);
bottomSpace = ((HolderLength - 2 * HolderThick) / bottomEmptyCount) / 4;
sideEmptyL = HolderHeight - 4 * HolderThick;

sideEmptyW = (HolderWidth - 2 * HolderThick) / (sideEmptyCount + 1);

module empty(width, length) {
    linear_extrude(h = HolderThick, center = true)
        resize([width, length]) circle(d=10, $fn= 50);
}

module box() {
    difference() {
        cube([HolderLength, HolderWidth, HolderHeight], center = true);
        
        translate([0, 0, HolderThick / 2]) cube([HolderLength - HolderThick, HolderWidth - HolderThick, HolderHeight - HolderThick], center = true);
        
        for(i= [1: bottomEmptyCount]) {
            translate([-(HolderLength) / 2 - bottomSpace + ((HolderLength - 2 * HolderThick) / bottomEmptyCount) * i, 0, -HolderHeight / 2]) empty(bottomEmptyW, bottomEmptyL);
        }
        
        for(i= [1: backEmptyCount]) {
            translate([(HolderLength / backEmptyCount) * i - HolderLength / 2 - HolderLength / (backEmptyCount * 2), 0, 0])
                rotate([90, 0, 0]) 
                    empty(bottomEmptyW, sideEmptyL);
        }
        
        for(i= [1: sideEmptyCount]) {
            translate([0, 0, 0])
                rotate([0, 90, 0]) 
                    empty(sideEmptyL, sideEmptyW);
        }
    }
}

module token() {
    rotate([90, 0, 0]) cylinder(d = cylDiam, h = cylLength, $fn = 50, center = true);
}

union() {
    translate([0,0,0]) box();
    translate([HolderLength / 2 - cylFromFront,HolderWidth / 2 + cylLength / 2, HolderHeight/ 2 - cylFromTop]) { 
        token();
        translate([-cylInterval,0,0]) token();
    }
}