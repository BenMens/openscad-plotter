module switch() {

    if ($componentMode == 1) {
        translate([5, 3, -7]) {
            cylinder(20, 1.23, 1.23);

            translate([10, 0, 0])
                cylinder(20, 1.4, 1.4);
        }
    } if ($componentMode == 2) {
        cube([20, 11, 6.5]);

        translate([3, 11, 0])
            rotate([0, 0, 15])
                cube([27, 1, 6.5]);
    }
}