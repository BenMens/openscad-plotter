use <utils.scad>

$fn = 100;

module fix(anti=false, width=30, cutLeft = 0, cutRight = 0) {
    if (!anti) {
        if ($componentMode == 0) {
            translate([cutRight, 0, -1])
                cube([width - cutLeft - cutRight, 10, 41]);

            translate([cutRight, -10, -5.2])
                cube([width - cutLeft - cutRight, 20, 5]);

            translate([cutRight, -10, 5.2])
                cube([width - cutLeft - cutRight, 20, 5]);

        } else if ($componentMode == 1) {
            translate([width / 2, 20, 20])
                rotate([90, 0, 0])
                    minkowski() {
                        cube([1, 10, 1]);
                        cylinder(width, 3, 3);
                    }
        }
    } else {
        if ($componentMode == 1) {
            translate([-0.2, -0.2, -2])
                cube([width + 0.4, width + 0.4, 10]);
        }
    }

    if ($componentMode == 1) {
        translate([7, -5, -6])
            cylinder(17, 1.7, 1.7);

        translate([width - 7, -5, -6])
            cylinder(17, 1.7, 1.7);
    }
}

// drawComponents()
//     fix();

// drawComponents()
//     fix(cutRight=3);

drawComponents()
    fix(cutLeft=3);