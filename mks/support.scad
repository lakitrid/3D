betweenScrew = 87;
size = 95;

difference()
{
    union() {
        cube([size + 15, 10, 5]);

        translate([5, 0, 5])
        rotate([0, -90, 0]) {
            difference() {
                cube([10, 10, 5]);

                translate([5, 5, 0]) cylinder(r=2.5, h=10, center=true, $fn=100);
            }
        }
    }

    translate([15, 5, 0]) cylinder(r=2.5, h=10, center=true, $fn=100);
    translate([15+87, 5, 0]) cylinder(r=2.5, h=10, center=true, $fn=100);
}