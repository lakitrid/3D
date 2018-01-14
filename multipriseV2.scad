diameter = 58;
outerdiam = 8;
width = 4;
screw = 4;
screwHolder = 10 + width;
scratchHeight = 20;
height = 10;
heightHolder = scratchHeight+6;

$fn = 50;

module screwSupport(right, supHeight) {
    difference() {     
        cube([width, supHeight, heightHolder]);
        translate([width / 2, supHeight - 16, scratchHeight / 2 + 3]) 
            rotate([0, 0, 30 * right])
                cube([width * 2, 3, scratchHeight], center = true);
    }
}

holderHeight = diameter / 2 + 30 + 9 + width;

union() {
    translate([-diameter / 2, 0, 0]) cube([diameter, width, height]);

    translate([-(diameter / 2 + width), 0, 0]) screwSupport(-1, holderHeight);
    translate([diameter / 2, 0, 0]) screwSupport(1, holderHeight);

    translate([0, holderHeight, 0]) difference() {
        cylinder(h = heightHolder, d = diameter + outerdiam);
        
        cylinder(h = heightHolder, d = diameter);
        
        translate ([-(diameter + outerdiam) /2, -(diameter + outerdiam) - 15, 0]) cube([(diameter + outerdiam), diameter + outerdiam, heightHolder]);
        
        translate ([-(diameter + outerdiam) /2, 15, 0]) cube([(diameter + outerdiam), diameter + outerdiam, heightHolder]);
    }
}