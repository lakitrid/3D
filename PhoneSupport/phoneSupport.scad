

phoneHeight = 10;
phoneLength = 150;
phoneWidth = 50;
phoneR = 2.5;

module phone() {
    translate([phoneR, 0, phoneR])
    {
        rotate([90, 0, 0])
        {
            hull() {
                translate([0,phoneLength - phoneR, 0])
                {
                    cylinder(r=phoneR, h=phoneWidth, center=true);
                }
                cylinder(r=phoneR, h=phoneWidth, center=true);
            }
        }
    }
}

module support() {

}

support();

//phone();