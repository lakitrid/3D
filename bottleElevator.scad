bottleInnerDiamH = 60;
bottleInnerDiamL = 54;
holderThickness = 4;
holderHigh = 7;

stickDiam = 7;
circlepos = bottleInnerDiamH / 2 + stickDiam / 2 + holderThickness / 2;

$fn = 50;

module mainCyl() {
    difference() {
        cylinder(d=bottleInnerDiamH + holderThickness, h=holderHigh);

        cylinder(d1=bottleInnerDiamL, d2=bottleInnerDiamH, h=holderHigh);
    }
}

module stickHolder(angle) {
    translate([circlepos * sin(angle),circlepos * cos(angle),0])
    difference() {
        cylinder(d=stickDiam + holderThickness, h=holderHigh);

        cylinder(d=stickDiam, h=holderHigh);
    }
}

union() {
    mainCyl();

    stickHolder(45);
    stickHolder(135);
    stickHolder(-45);
    stickHolder(-135);
}
