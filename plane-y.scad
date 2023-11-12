use <plane-mount.scad>
use <bushing.scad>
use <utils.scad>

$fn=100;

module planeY() {
    rotate([180, 0, 0])
    translate([0, 0, 7]) {

        translate([50, 0, 0]) {
            translate([0, 31, 0])
                planeMount();

            translate([0, -31, 0])
                planeMount();
        }

        translate([-50, 0, 0]) {
            translate([0, 31, 0])
                planeMount();

            translate([0, -31, 0])
                planeMount();
        }


        if ($componentMode == 0) {

            difference() {
                color("gray", 0.7)
                    translate([-70, -50, 2])
                        cube([140, 100, 3]);

                translate([0, -5, -5])
                    cylinder(20, 1.6, 1.6);

                translate([0, 5, -5])
                    cylinder(20, 1.6, 1.6);

                translate([60, 40, -5])
                    cylinder(20, 2, 2);

                translate([60, -40, -5])
                    cylinder(20, 2, 2);

                translate([-60, 40, -5])
                    cylinder(20, 2, 2);

                translate([-60, -40, -5])
                    cylinder(20, 2, 2);

                translate([-20, 0, -5])
                    cylinder(20, 2, 2);

                translate([20, 0, -5])
                    cylinder(20, 2, 2);            
            }
            
            translate([-20, -32, -8])
                difference() {
                    cube([20, 5, 10]);

                    translate([15, 8, 5])
                        rotate([90, 0, 0])
                            cylinder(10, 1.5, 1.5);

                    translate([5, 8, 5])
                        rotate([90, 0, 0])
                            cylinder(10, 1.5, 1.5);
                }

        } else if ($componentMode == 2) {

            translate([50, 0, -7]) {
                translate([0, -20, 0])
                    rotate([90, 0, 0])
                        color("black")
                            bushing();

                translate([0, 40, 0])
                    rotate([90, 0, 0])
                        color("black")
                            bushing();     
            }

            translate([-50, 0, -7]) {
                translate([0, -20, 0])
                    rotate([90, 0, 0])
                        color("black")
                            bushing();

                translate([0, 40, 0])
                    rotate([90, 0, 0])
                        color("black")
                            bushing();     
            }
        }
    }
}


module timingMountY() {
    #color("blue")
    if ($componentMode == 0) {
            difference() {
                translate([-10, -15, -9])
                    cube([20, 30, 25]);

                rotate([0, 90, 0])
                    translate([-10, 10, 0]) {
                        cylinder(8, 10, 10, center=true);
                        cylinder(22, 1.7, 1.7, center=true);
                    }

                rotate([0, 90, 0])
                    translate([-10, -10, 0]) {
                        cylinder(8, 10, 10, center=true);
                        cylinder(22, 1.7, 1.7, center=true);
                    }

                translate([0, 5, -20])
                cylinder(30, 3.9 / 2, 3.9/2 );

                translate([0, -5, -20])
                cylinder(30, 3.9 / 2, 3.9/2 );
            }
    } 
}

drawComponents() {
    // planeY();
    timingMountY();
}

