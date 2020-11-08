

phoneHeight = 8.4 + 1.5;
phoneLength = 157;
phoneWidth = 76.9;
phoneR = 1.5;
baseheight = 20;
incr=10;
baseWidthFactor = 2;
baseThinFactor = 4;

module phone() {
    translate([phoneR, phoneWidth / 2, phoneR])
    {
        rotate([90, 10, 0])
        {
            $fn=50;

            hull() {
                hull() {
                    translate([0,phoneLength - phoneR, 0])
                    {
                        cylinder(r=phoneR, h=phoneWidth, center=true);
                    }
                    cylinder(r=phoneR, h=phoneWidth, center=true);
                }

                translate([phoneHeight - phoneR * 2,0,0])
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
    }
}


module support() {
    difference()
    {
        union() {
            cube([incr + phoneHeight * 1.5,phoneWidth , baseheight]);

            
            translate([incr + phoneHeight * 1.5,0,0]) cube([phoneLength / baseWidthFactor - (incr + phoneHeight * 1.5), phoneWidth, baseheight / 2]);

            translate([incr + phoneHeight / 2,0,baseheight]) cube([phoneHeight, phoneWidth, baseheight]);
        }

        translate([incr / 2, 0 ,baseheight /3]) {
            rotate([0, 0, 0])
            {
                phone();
            }
        }

        translate([incr * 4, - phoneWidth / baseThinFactor ,0]) baseThin();
        translate([incr * 4, phoneWidth - phoneWidth / baseThinFactor ,baseheight /3]) baseThin();
    }
}

module baseThin() {
    xTranslateBaseThin = (phoneLength / baseWidthFactor - (incr + phoneHeight * 1.5)) - 10;
    $fn = 100;

    translate([phoneWidth / baseThinFactor, phoneWidth / baseThinFactor, -baseheight /2]) {
        hull() {
            translate([xTranslateBaseThin,0,0])
            {
                cylinder(r=phoneWidth / baseThinFactor, h=baseheight);
            }

            cylinder(r=phoneWidth / baseThinFactor, h=baseheight);    
        }        
    }
}

support();