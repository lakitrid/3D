// Parametric capsule holder with module (base, middle, high)

baseHeight = 25; // height of the base

edgeSize = 70; // size of the capsule holder
edgeRadius = 12; // radius of the minkowski
edgeDepth = 3; // Width of the wall

railSpace = 40; // Space between the two rails
railWidth = 2; // Width of the wall
railInner = 2; // inner space between the outer wall and the inner wall (holding the capsule)
railLength = 2; // length of the holding part

draw = 3;

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

module oneRail(baseRail) {
    translate([0, edgeSize/2, 0])  rail(baseRail);
    mirror([1, 0, 0]) translate([0, edgeSize/2, 0])  rail(baseRail);    
}

module addRail(baseRail) {
    oneRail(baseRail);
    rotate([0, 0, 90]) oneRail(baseRail);
    rotate([0, 0, 180]) oneRail(baseRail);
    rotate([0, 0, 270]) oneRail(baseRail);
}

module pilar() {
    translate([5, -3, 0]) cube([edgeSize / 2 - 5, 6, 6]);
    rotate([0, 0, 90]) translate([5, -3, 0]) cube([edgeSize / 2 - 5, 6, 6]);
    rotate([0, 0, 180]) translate([5, -3, 0]) cube([edgeSize / 2 - 5, 6, 6]);
    rotate([0, 0, 270]) translate([5, -3, 0]) cube([edgeSize / 2 - 5, 6, 6]);    
}

// Defines the base
if(draw == 1) {
    union() {
        translate([0, 0, baseHeight / 2])
        difference() {
            outerEdge(baseHeight);
            translate([0, 0, 2]) innerEdge(baseHeight);
        }
        
        translate([0, 0, baseHeight / 2])
        difference() {
            cube([10, 10, baseHeight], center = true);
            translate([0, 0, baseHeight / 2]) cube([5, 5, baseHeight / 2], center = true);
        }
        
        addRail(baseRail = true);
    }
}

if(draw == 2)
{    
    union() {
        translate([0, 0, baseHeight / 2])
        difference() {
            outerEdge(baseHeight);
            innerEdge(baseHeight);            
        }
        
        pilar();
        
        translate([0, 0, baseHeight / 2])
        union() {
            difference() {
                cube([10, 10, baseHeight], center = true);
                translate([0, 0, -1 * baseHeight / 2]) cube([5, 5, baseHeight / 2], center = true);                
            }
            
            translate([0, 0, baseHeight / 2]) cube([5, 5, (baseHeight / 2) - 1], center = true);
        }
        
        addRail(baseRail = false);
    }
}

if(draw == 3)
{    
    union() {
        translate([0, 0, baseHeight / 2])
        difference() {
            outerEdge(baseHeight);
            translate([0, 0, 2]) innerEdge(baseHeight);            
        }
        
        translate([0, 0, baseHeight / 2])
        union() {
            difference() {
                cube([10, 10, baseHeight], center = true);
                translate([0, 0, baseHeight / 2]) cube([5, 5, baseHeight / 2], center = true);                
            }
        }
        
        addRail(baseRail = false);
    }
}