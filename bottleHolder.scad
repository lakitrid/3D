innerDiam=32;
rim=4;

innerInnerDiam=23;

height=6;
mediumHeight=20;

$fn=100;

difference() {
    union() {
        translate([0, 0, rim / 2]) difference() {
            cylinder(d = innerDiam + rim, h=height);

            cylinder(d=innerDiam, h=height);
        }

        cylinder(d = innerDiam + rim, h=rim / 2);

        translate([0, 0, rim / 2])  cylinder(d = rim, h=1.2);
    }

    translate([innerDiam / 2 - rim, 0, 0]) 
        cylinder(d=rim, h=rim);
}
