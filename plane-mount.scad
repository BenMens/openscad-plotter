module planeMount(len = 20) {
    translate([0, -len/2 -1.2, 0])
    if ($componentMode == 0) {

        translate([-7.5, 0, -4])
            difference() {
                translate([0, 0, 2])
                    cube([15, len + 2.4, 4]);
                
                translate([7.5, 1, -4])
                    rotate([-90, 0, 0])
                        cylinder(len + 0.4 , 7.7, 7.7);
        }
    } else if ($componentMode == 1) {
        translate([11, (len + 2.4) / 2, -4])
            cylinder(len, 3, 3);

        translate([-11, (len + 2.4) / 2, -4])
            cylinder(len, 3, 3);
    }
}