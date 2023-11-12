use <plane-mount.scad>
use <bushing.scad>
use <utils.scad>

$fn=100;

module planeX() {

    translate([0, 0, -7.5])
    rotate([180, 0, 0]) {

        rotate([0, 0, 90])
            translate([0, 0, 0]) {
                translate([-25, 0, 0])
                    planeMount(30);

                translate([25, 0, 0])
                    planeMount(30);
            }


        if ($componentMode == 0) {

            difference() {
                color("gray", 0.7)
                    translate([-25, -50, 2])
                        cube([50, 100, 3]);

                translate([5, 7, 0])
                    cylinder(7, 1.6, 1.6);

                translate([-5, 7, 0])
                    cylinder(7, 1.6, 1.6);

                translate([0, -3, 0])
                    cylinder(7, 2, 2);

                translate([0, 45, 0])
                    cylinder(7, 1.6, 1.6);

                translate([0, -45, 0])
                    cylinder(7, 1.6, 1.6);

                translate([15, -3, 0])
                    cylinder(7, 1.6, 1.6);

                translate([15, 45, 0])
                    cylinder(7, 1.6, 1.6);

                translate([15, -45, 0])
                    cylinder(7, 1.6, 1.6);

                translate([-15, -3, 0])
                    cylinder(7, 1.6, 1.6);

                translate([-15, 45, 0])
                    cylinder(7, 1.6, 1.6);

                translate([-15, -45, 0])
                    cylinder(7, 1.6, 1.6);
            }
            
            translate([-10, -50, -8])
                difference() {
                        cube([5, 10, 10]);

                        translate([-0.1, 5, 5])
                            rotate([0, 90, 0])
                                cylinder(5.2, 1.5, 1.5);

                }

        } else if ($componentMode == 2) {
            translate([-15, -25, -7.5])
                rotate([0, 90, 0])
                    color("black")
                        bushing(30);

            translate([-15, 25, -7.5])
                rotate([0, 90, 0])
                    color("black")
                        bushing(30);
        }
    }
}



module timingMountX1(anti = false) {
    translate([0, -7 , -9.4])
    if ($componentMode == 0 && !anti) { 
        
        difference() {
            union() {
                translate([-10, -5, 0])
                    cube([20, 10, 10]);

                translate([-17, -6, 10])
                     cube([34, 12, 13]);
            }

            translate([5, 0, -0.01])
                cylinder(40, 1.7, 1.7);

            translate([-5, 0, -0.01])
                cylinder(40, 1.7, 1.7);

            translate([0, 0, 5]) {
                translate([5, 0, -0.01])
                    cylinder(40, 1.95, 1.95);

                translate([-5, 0, -0.01])
                    cylinder(40, 1.95, 1.95);                
            }

            translate([-12, 0, 17]) {
                translate([0, 0, -20])
                    cylinder(20, 1.95, 1.95);

            }

            translate([12, 0, 17]) {
                translate([0, 0, -20])
                    cylinder(20, 1.95, 1.95);

            }

        }
    } if ($componentMode == 1) { 
            translate([-12, 0, 17]) {
                translate([0, -7, -10])
                    cylinder(20, 1.7, 1.7);
            }

            translate([12, 0, 17]) {
                translate([0, -7, -10])
                    cylinder(20, 1.7, 1.7);

            }
    }

}

module timingMountX2() {
    translate([0, -7 , -9.4])
    if ($componentMode == 0) { 
        translate([-17, -6, 30])
                cube([34, 12, 3]);
    }
}

drawComponents() {
    planeX();
}

drawComponents() {
    timingMountX1();
}

drawComponents() {
    timingMountX1(anti = true);
    timingMountX2();
}