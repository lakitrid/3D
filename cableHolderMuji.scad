fente = 2;

hauteur = 10;
largeur = 15;
cableHauteur = 7;
epaisseur = 4;

union() {
    cube([largeur, epaisseur, hauteur]);
    translate([0, epaisseur + fente, 0]) cube([largeur, epaisseur, hauteur]);
    translate([-epaisseur, 0, 0]) cube([epaisseur,  epaisseur * 2 + fente, largeur * 2]);
    translate([-(2*epaisseur) - cableHauteur, 0, 0]) cube([epaisseur,  epaisseur * 2 + fente, largeur * 2]);    
    translate([-epaisseur - cableHauteur, 0, 0]) cube([cableHauteur, epaisseur * 2 + fente, epaisseur]);
}