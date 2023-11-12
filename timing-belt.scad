use <utils.scad>

module timingBeldEnd1() {
    if ($componentMode == 0) {
        difference () {
            color("lime")
            union() {
                translate([-9.8, 0, 0.2])
                    cube([19.6, 5, 29.6]);

                translate([-11, 5, -1])
                    cube([22, 15, 32]);
            }

            translate([-8, -13, 2])
                cube([16, 30, 26]);
        }
    }
}

module timingBeldEnd2(anti = false) {
    if ($componentMode == 0 && !anti) {
        color("red")
        difference() {
            translate([-9.8, -10, 2.2])
                cube([19.6, 22, 12]);

            translate([-5, -13, 1.2])
                cube([10, 22, 14]);
        }
    } else if ($componentMode == 1) {
        if (anti) {
            translate([-10, -3.4, 2])
                cube([20, 20.4, 12.4]);
        }

        translate([0, 21, 8.2])
            rotate([90, 0, 0])
                cylinder(15, 1.6, 1.6);

        translate([-11, -4, 8.2])
            rotate([0, 90, 0])
                cylinder(22, 1.6, 1.6);
                
    }

}