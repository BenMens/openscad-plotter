use <pin.scad>
use <switch.scad>
use <fix.scad>
use <utils.scad>

$fn=100;


module frameY(switch = false) {
    translate([-80, -50]) {

        translate([4,4])
            frame2(switch);

        translate([30, 7.5, 0])
            pin();

        translate([160-30, 7.5, 0])
            pin();


        // translate([7, 40, 0]) {
        //     frameYFix(anti=true);
        // }

        // translate([123, 40, 0]) {
        //     fix(anti=true);
        // }
    }

    frameYFix(anti=true);
}


module frame2(switch = true) {
    if ($componentMode == 0) {
        minkowski() {
            cube([152, 42, 1]);
            
            cylinder(4, 4, 4);
        }

        if (switch) {
            translate([46, 2.5, 0]) 
                cube([20, 5, 16]);
        }

    } else if ($componentMode == 1) {
        translate([66, 5, -1])
            cube([20, 30, 50]);

        if (switch) {
            translate([46, -4.01, -15]) 
                cube([20, 6.51 , 24]);
        }
    }

    if (switch) {
        translate([46, 2.5, 5])
            rotate([90, 0, 0])
                switch();
    }

}

module frameYFix(anti = false) {
    translate([-80, -50]) {
        translate([7, 40, 0])
            fix(anti);

        translate([123, 40, 0])
            fix(anti);
    }
}


drawComponents() {
    frameY();
}