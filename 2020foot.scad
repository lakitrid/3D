/*
    Level Foot for 2020 aluminium frame
*/

// Select the part to render, 1 = foot holder, 2 = foot, -1 = All
draw = 2;

Width = 3;
HolderLength = 40;
FrameHeight = 20;
screw = 4;

lowHolderLength = 20;
lowHolderWidth = 15;
lowHolderHeight = 6;

nut = 8;
nutHeight = 2;

footBottomDiam = 20;
footTopDiam = 12;
footHeight = 12;

footScrewShaft = 6;
lowerShaftguard = 4;

$fn = 50;

// Render the foot holder
if(draw == 1 || draw == -1)
{
    union() {    
        difference() {
            cube([HolderLength, FrameHeight, Width]);
            
            translate([HolderLength / 8, FrameHeight / 2, 0]) cylinder(d = screw, h = Width);
            translate([(HolderLength / 8) * 7, FrameHeight / 2, 0]) cylinder(d = screw, h = Width);
        }
        
        translate([(HolderLength / 2) - (lowHolderLength / 2), lowHolderHeight, Width]) 
        {
            rotate([90, 0, 0])     
                difference() {    
                    cube([lowHolderLength, lowHolderWidth, lowHolderHeight]); 
                                       
                    translate([lowHolderLength / 2, lowHolderWidth / 2, 0]) cylinder(d = screw, h = lowHolderHeight);
                    
                    translate([lowHolderLength / 2, lowHolderWidth / 2, -1 * lowHolderHeight + nutHeight]) cylinder(d = nut, h = lowHolderHeight, $fn = 5);
                    
                    translate([lowHolderLength / 2, lowHolderWidth / 2, lowHolderHeight - nutHeight]) cylinder(d = nut, h = lowHolderHeight, $fn = 5);
                }               
                
            translate([Width, -1, -1])
                support();
                
            translate([lowHolderLength, -1, -1])
                support();
        }
    }
}

module support() {
    rotate([0, -90, 0]) 
        difference() {
            cube([lowHolderLength - lowHolderHeight, FrameHeight - lowHolderHeight, Width]);
            translate([lowHolderLength - lowHolderHeight, lowHolderLength - lowHolderHeight, 0]) cylinder(r = lowHolderLength - lowHolderHeight - 1, h = lowHolderHeight);
        }    
}

// render the foot
if(draw == 2 || draw == -1) 
{
    translate([-20, 0, footHeight / 2]) {
        union() {
            difference() {
                cylinder(d1 = footBottomDiam, d2 = footTopDiam, h = footHeight, center = true);

                translate([0, 0, -footScrewShaft / 2]) 
                    cylinder(d = screw + lowerShaftguard, h = footHeight - footScrewShaft, center = true);

                translate([0, 0, footHeight / 2 - footScrewShaft / 2]) 
                    cylinder(d = screw, h = footScrewShaft, center = true);

                translate([0, 0, footHeight / 2 - nutHeight / 2]) 
                    cylinder(d = nut, h = nutHeight, $fn = 5, center = true);
            }
        }
    }
}