// Parametric capsule holder with module (base, middle, high)

baseHeight = 20; // height of the base

edgeSize = 70; // size of the capsule holder
edgeRadius = 12; // radius of the minkowski
edgeDepth = 3; // Width of the wall

railSpace = 44; // Space between the two rails
railWidth = 2; // Width of the wall
railInner = 2.3; // inner space between the outer wall and the inner wall (holding the capsule)
railLength = 3; // length of the holding part
shaft = 6.8;

$fn=100;

// Use 1 for base, 2 for middle module, 3 for upper module
draw = 3;

// Defines the outer edge
module outerEdge(edgeHeight) { 
    minkowski() {
        cube([
        edgeSize - (2 * edgeRadius), 
        edgeSize - (2 * edgeRadius),
        edgeHeight], 
        center = true);
        
        cylinder(r=edgeRadius,h=1);
    };
}

// Defines the inner edge
module innerEdge(edgeHeight) {
    minkowski() {
        cube([
        edgeSize - (2 * edgeRadius) - edgeDepth, 
        edgeSize - (2 * edgeRadius) - edgeDepth,
        baseHeight], 
        center = true);
        
        cylinder(r=edgeRadius,h=1);
    }
}

// defines the L part of the rail, add a bottom bar for the base
module rail(baseRail) {
       translate([-1 * railSpace / 2, 0, 0])  
        union() {
            cube([railWidth, railInner + railWidth, baseHeight + 1]);
            translate([railWidth, railInner, 0]) cube([railLength, railWidth, baseHeight + 1]);
        }
        if(baseRail == true) {
            translate([-1 * railSpace / 2]) cube([railSpace / 2, railInner, 2]);
        }
}

// defines the two part of the rail
module oneRail(baseRail) {
    translate([0, edgeSize/2, 0])  rail(baseRail);
    mirror([1, 0, 0]) translate([0, edgeSize/2, 0])  rail(baseRail);    
}

// defines the 4 rail (one on each face
module addRail(baseRail) {
    oneRail(baseRail);
    rotate([0, 0, 90]) oneRail(baseRail);
    rotate([0, 0, 180]) oneRail(baseRail);
    rotate([0, 0, 270]) oneRail(baseRail);
}

// defines pilar to maintain central shaft
module pilar() {
    translate([5, -3, 0]) cube([edgeSize / 2 - 5, 6, 3]);
    rotate([0, 0, 90]) translate([5, -3, 0]) cube([edgeSize / 2 - 5, 6, 3]);
    rotate([0, 0, 180]) translate([5, -3, 0]) cube([edgeSize / 2 - 5, 6, 3]);
    rotate([0, 0, 270]) translate([5, -3, 0]) cube([edgeSize / 2 - 5, 6, 3]);    
}

module shaftEle() {
    union() {   
        difference() {
            cube([10, 10, baseHeight + 1], center = true);
            if(draw == 1) {
                translate([0, 0, baseHeight / 2]) cube([shaft, shaft, baseHeight / 2], center = true);
            } else {                
                translate([0, 0, -1 * baseHeight / 2]) cube([shaft, shaft, baseHeight / 2], center = true);
            }
        }
        
        if(draw != 1) { 
            translate([0, 0, (baseHeight + 1 ) / 2]) 
                cube([shaft - 0.8, shaft - 0.8, (baseHeight / 2) - 1.2], center = true);
        }
    }
}

// Defines the base
if(draw == 1 || draw == -1) {
    union() {
        translate([0, 0, baseHeight / 2])
        difference() {
            outerEdge(baseHeight);
            translate([0, 0, 2]) innerEdge(baseHeight);
        }
        
        translate([0, 0, (baseHeight + 1) / 2]) shaftEle();
        
        addRail(baseRail = true);
    }
}

if(draw == 2 || draw == -1)
{    
    translate([0, 0, baseHeight]) union() {
        translate([0, 0, baseHeight / 2])
        difference() {
            outerEdge(baseHeight);
            innerEdge(baseHeight);            
        }
        
        pilar();
        
        translate([0, 0, (baseHeight + 1) / 2])  shaftEle();
        
        addRail(baseRail = false);
    }
}

if(draw == 3 || draw == -1)
{    
    translate([0, 0, baseHeight * 2]) union() {
        translate([0, 0, baseHeight / 2])
        difference() {
            outerEdge(baseHeight);
            translate([0, 0, 2]) innerEdge(baseHeight);            
        }
        
        translate([0, 0, (baseHeight + 1) / 2]) shaftEle();
        
        addRail(baseRail = false);
    }
}

if(draw == 4)
{    
        union() {
            difference() {
                cube([10, 10, baseHeight + 1], center = true);
                translate([0, 0, -1 * baseHeight / 2]) cube([shaft, shaft, baseHeight / 2], center = true);                
            }
            
            translate([0, 0, (baseHeight + 1 ) / 2]) cube([shaft - 0.8, shaft - 0.8, (baseHeight / 2) - 1.2], center = true);
        }
}