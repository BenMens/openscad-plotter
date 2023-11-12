include <utils.scad>

$fn = 100;


// #############################################################################
// 9V jack socket
// #############################################################################
module dcJackSocket() {
  	$fn = 100;

	if ($componentMode == 0) {

		cube([11.5, 18, 10.95]);

	} else if ($componentMode == 1) {

		translate([5.75, 1.75, 5.5])
			rotate([0, 180, 0]) {

				cube([9.51, 3.51, 11.01], true);

				translate([0, 7, 0.5]) {

					rotate([90, 0, 0])
						cylinder(13, 4.5, 4.5, true);

					translate([0, -10, 0])
						rotate([90, 0, 0])
							cylinder(12.1, 3.5, 3.5, true);

					translate([0, 0.624, -3])
						cube([9.5, 11.75, 6], true);
				}
			}
	}
}

module dcJackSocketMount() {
	if ($componentMode == 0) {

        translate([-5, -2, -3])
		    cube([11.5 + 10, 3, 20]);

        difference() {
            translate([-10, -2, -3])
                cube([11.5 + 20, 24, 3]);

            translate([-5, 10, -4])
                cylinder(10, 1.7, 1.7);

            translate([11.5 + 5, 10, -4])
                cylinder(10, 1.7, 1.7);


        }

	} else if ($componentMode == 1) {
    }
}

drawComponents() {
	dcJackSocket();
    dcJackSocketMount();
}
