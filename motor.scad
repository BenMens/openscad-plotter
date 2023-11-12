use <utils.scad>

$fn=100;

module motorHoder() {
    translate([-20, -25, 0])
    if ($componentMode == 0) {

        difference() {
            union() {
                difference() {
                    cube([45, 50, 46.3]);

                    translate([3, -1, 50])
                        rotate([0, 49, 0])
                            cube([80, 80, 60]);
                }

                translate([-20, 0, 0])
                    cube([80, 50, 4]);
            }

            translate([22.5, 25, -4])
                cylinder(10, 17, 17);

        }
    } else if ($componentMode == 1) {

        translate([-13, 10, -1])
            minkowski() {
                cube([5, 0.1, 1]);

                cylinder(10, 1.6, 1.6);
            }


        translate([-13, 40, -1])
            minkowski() {
                cube([5, 0.1, 1]);

                cylinder(10, 1.6, 1.6);
            }

        translate([48, 10, -1])
            minkowski() {
                cube([5, 0.1, 1]);

                cylinder(10, 1.6, 1.6);
            }

        translate([48, 40, -1])
            minkowski() {
                cube([5, 0.1, 1]);

                cylinder(10, 1.6, 1.6);
            }
    }

    translate([-15, 0, 25])
        motor();
}

module motor() {
    translate([0, -21, -21])
    if ($componentMode == 2) {
        %translate([-30, 21, 21])
            rotate([0, 90, 0])
                cylinder(30, 2.5, 2.5);

        %translate([0, 3, 39])
            rotate([0, 90, 0])
                    minkowski() {
                        cube([36, 36, 39]);
                        cylinder(1, 3, 3);

                    }
    } else if ($componentMode == 1) {
        translate([-6, 21, 21])
            rotate([0, 90, 0])
                cylinder(15, 12, 12);

        translate([-6, 21-31/2, 21-31/2])
            rotate([0, 90, 0])
                cylinder(15, 1.8, 1.8);

        translate([-6, 21-31/2, 21+31/2])
            rotate([0, 90, 0])
                cylinder(15, 1.8, 1.8);

        translate([-6, 21+31/2, 21-31/2])
            rotate([0, 90, 0])
                cylinder(15, 1.8, 1.8);

        translate([-6, 21+31/2, 21+31/2])
            rotate([0, 90, 0])
                cylinder(15, 1.8, 1.8);

        cube([45, 42.5, 42.4]);
    }  
}

drawComponents() {
    motorHoder();
}