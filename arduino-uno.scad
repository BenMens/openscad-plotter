use <utils.scad>
use <pilars.scad>

$fn = 100;

// #############################################################################
// Helpers
// #############################################################################
function milToMM(l) = (l * 2540) / 100000;

// #############################################################################
// Arduino UNO
// #############################################################################

module arduinoUno() {

    if ($componentMode == 0) {

        translate([milToMM(600), milToMM(2000), 0])
            pilarWithPin(7, 4, 4, 3);

        translate([milToMM(2600), milToMM(1400), 0])
            pilar(7, 6.8, 6.8, 2.8);

        translate([milToMM(2600), milToMM(300), 0])
            pilar(7, 6.8, 6.8, 2.8);

        translate([milToMM(550), milToMM(100), 0])
            pilar(7, 6.8, 6.8, 2.8);

    } else if ($componentMode == 2) {
        translate([0, 0, 7])
            %cube([milToMM(2700), milToMM(2100), 1]);

        translate([milToMM(-250), milToMM(1275) , 8])
            %cube([milToMM(625), milToMM(500), 10.9]);

    }
}


difference() {
    cube([milToMM(2700) + 2, milToMM(2100) + 2, 2]);

    translate([0, 0, -1 ]) {

        translate([6, 0, 0]) {
            translate([0, 6, 0])
                cylinder(4, 2, 2);

            translate([0, milToMM(2100) -4, 0])
                cylinder(4, 2, 2);
        }

        translate([milToMM(2700) - 10, 0, 0]) {
            translate([0, 6, 0])
                cylinder(4, 2, 2);

            translate([0, milToMM(2100) - 4, 0])
                cylinder(4, 2, 2);
        }

    }

}

translate([1, 1, 2])
drawComponents() {
    arduinoUno();
}
