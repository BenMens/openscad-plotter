use <motor.scad>
use <pin.scad>
use <switch.scad>
use <fix.scad>
use <utils.scad>

$fn=100;

module frameX(motor=true, switch=true) {
    
    translate([-5, 0, 0]) {
        if ($componentMode == 0) {
            
            difference() {
                cube([5, 80, 160]);

                translate([-5, 15, 100])
                    cube([20, 20, 30]);
            }

            translate([-42, 55, 0])
                cube([45, 5, 160]);

            if (motor == true) {
                translate([-42, 35, 92.5])
                    cube([45, 5, 45]);

                translate([-42, 35, 89])
                    cube([45, 20, 5]);

                translate([-42, 35, 136.5])
                    cube([45, 20, 5]);
            }

            if (switch) {
                translate([-6, 6.5, 50]) 
                    cube([7, 5, 20]);
            }

        } else if ($componentMode == 1) {
            if (switch) {
                translate([-6, -0.01 ,50]) 
                    cube([20, 6.51, 20]);
            }
        }

        if (switch) {
            translate([-6, 0, 50])
                rotate([-90, -90, 0])
                    switch();
        }

        translate([-15, 7.5, 140])
            rotate([0, 90, 0])
                pin();

        translate([-15, 7.5, 90])
            rotate([0, 90, 0])
                pin();

        if (motor) {
            translate([-21.5, 40, 115]) 
                rotate([0,0,90])
                    motor();
        }

    }

    frameXFix(anti=true);

}


module frameXFix(anti = false) {
    translate([-5, 0, 0]) {
        translate([0, 40, 10])
            rotate([90, 180, 90])
                fix(anti);

        translate([-45, 55, 10])
            rotate([-90, 0, 0])
                fix(anti, cutRight=3);
    }
}

drawComponents() {
    frameX();
}