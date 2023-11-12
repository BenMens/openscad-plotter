module pin() {
    if ($componentMode == 0) {
        cylinder(15, 7.5, 7.5);
    } else if ($componentMode == 1) {
        translate([0, 0, 5])
            cylinder(30, 3.5, 3.5);

        translate([0, 0, -5])
            cylinder(30, 2.1, 2.1);
    }
}
