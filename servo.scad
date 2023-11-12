use <utils.scad>

$fn = 100;


module servo() {
    printMargin = $componentMode == 2 ? 0  : 0.8;
    printMargin_2 = $componentMode == 2 ? 0  : 0.4;

    if ($componentMode == 1) {
        translate([11.75 - 5, 0, -26]) {
            translate([-14.25, 0, 7])
                cylinder(8, 1, 1);

            translate([14.25, 0, 7])
                cylinder(8, 1, 1);

        }
    } else if ($componentMode == 2) {

        difference() {
            union() {
                translate([0, 0, -8.5])
                    cylinder(8.5, 3.7 / 2, 3.7 / 2);
                
                translate([0, 0, -10])
                    cylinder(5, 5, 5);

                translate([6, 0, -10])
                    cylinder(4.2, 2.5, 2.5);

                translate([-(32 - 23.5)/2 - 5, -5, -13.7])
                    cube([32, 10, 2]);
            }

            translate([11.75 - 5, 0, -26]) {
                translate([-14.25, 0, 7])
                    cylinder(8, 1, 1);

                translate([14.25, 0, 7])
                    cylinder(8, 1, 1);

            }

        }

    }

    if ($componentMode == 2 || $componentMode == 1) {
         translate([-5, 0, -8.5])
            translate([-printMargin_2, -5 - printMargin_2, -18])
                cube([23.5 + printMargin, 10 + printMargin, 18]);

    }
}


drawComponents() {
    servo();

    if ($componentMode == 0) {
        translate([-13 ,-7, -28])
            cube([40, 1, 20]);

        translate([-13 ,-6, -16.7])
            cube([40, 11, 3]);

    }
}


