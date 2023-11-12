use <utils.scad>
use <plane-y.scad>

$fn = 100;

translate([0, 0, 13])
drawComponents() {
    planeY();
}

drawComponents() {
    paperPlane();
}

module paperPlane() {
    translate([-70, -70, -4])
        if ($componentMode == 0) {
            cube([140,140,3]);
        }

        translate([60, 40, 0])
            paperPlanePin();

        translate([60, -40, 0])
            paperPlanePin();

        translate([-60, 40, 0])
            paperPlanePin();

        translate([-60, -40, 0])
            paperPlanePin();

        translate([-20, 0, 0])
            paperPlanePin();

        translate([20, 0, 0])
            paperPlanePin();

}

module paperPlanePin() {
    translate([0, 0, -1])
        if ($componentMode == 0) {
            cylinder(3, 5, 5);

            cylinder(6, 1.8, 1.8);
        }
}
