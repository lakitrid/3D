height = 6;
innerHeight = 5;
width = 10;
innerLength = 5;
rimLength = 4;
lengthHolder = 30;
HolderHeight = 5;
rimHolderHeight = 5;
rimHolderLength = 3;

footHeight = 20;
footLength = 5;


union(){
    cube([innerLength, height + innerHeight, width]);

    translate([innerLength, 0, 0]) {
        cube([rimLength + lengthHolder + rimHolderLength, HolderHeight, width]);
    }

    translate([innerLength + rimLength, HolderHeight, 0]) {
        cube([footLength, footHeight + (height - HolderHeight), width]);
    }

    translate([lengthHolder + innerLength + rimLength - 1, -1 * rimHolderHeight, 0]) {
        cube([rimLength, rimHolderHeight, width]);
    }

    translate([innerLength + rimLength + footLength, HolderHeight, 0]) {
        difference() {
            cube([footHeight - 5, footHeight - 5, width]);
            translate([footHeight - 5, footHeight - 5, 0]) cylinder(r=footHeight - 6, h=width, $fn= 50);
        }
    }
}