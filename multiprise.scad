Width = 4;
HoldLength = 60;
Height = 2;

LowHeight = 20;

bottomHoldLength = 70;

hangerHeight = 26;

stripWidth = 58;
stripHeight = 38;
stripHolderLength = 10;

union() {
    cube([HoldLength, Width, Height], center = true);

    translate([HoldLength / 2 - Width / 2, LowHeight / 2 + Width / 2, 0]) {
        cube([Width, LowHeight, Height], center = true);

        translate([-(bottomHoldLength / 2 + Width / 2), LowHeight / 2 - Width / 2, 0]) {
            cube([bottomHoldLength, Width, Height], center = true);
            
            translate([-(bottomHoldLength / 2 - Width / 2), hangerHeight / 2 + Width / 2, 0]) {
                cube([Width, hangerHeight, Height], center = true);
                
                translate([0, (hangerHeight / 2 + Width / 2), 0]) {
                    cube([stripWidth, Width, Height], center = true);

                    translate([(stripWidth / 2 - Width / 2), (stripHeight / 2 + Width / 2), 0]) {
                        cube([Width, stripHeight, Height], center = true);
                        
                        translate([-(stripHolderLength / 2 - Width / 2), stripHeight / 2 + Width / 2, 0]) {
                            cube([stripHolderLength, Width, Height], center = true);
                        }
                    }

                    translate([-(stripWidth / 2 - Width / 2), (stripHeight / 2 + Width / 2), 0]) {
                        cube([Width, stripHeight, Height], center = true);
                        
                        translate([(stripHolderLength / 2 - Width / 2), stripHeight / 2 + Width / 2, 0]) {
                            cube([stripHolderLength, Width, Height], center = true);
                        }
                    }
                }
            }
        }
    }
}