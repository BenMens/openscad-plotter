use <utils.scad>
use <frame-x.scad>
use <frame-y.scad>
use <switch.scad>
use <fix.scad>
use <motor.scad>
use <plane-y.scad>
use <plane-x.scad>
use <timing-belt.scad>
use <paper-plane.scad>

$fn=100;

xFrame = true;
yMotor = true;
yFrame = true;
 
//***************************************************************
// Motor
//***************************************************************

if (yMotor) {
    drawComponents() {
        translate([-35, -35, 0])
            rotate([0, 0, 180])
                motorHoder();
    }
}


 

//***************************************************************
// X frame
//***************************************************************

if (xFrame)  {
    translate([0, 100, 0]) {

        drawComponents() {
            translate([-100, 7.5, 90])
                slider2();
        }

        drawComponents() {
            translate([-100, 7.5, 140])
                slider2();
        }

        translate([-95, 0, 0]) {
            drawComponents() 
                frameX();

            drawComponents() 
                frameXFix();
        }
        

        translate([95, 0, 0])
        mirror([1, 0, 0]) {

            drawComponents() 
                frameX(motor = false, switch = false);
            
            drawComponents() 
                frameXFix();
        }


        translate([-75, 7.5, 115])
            rotate([-90, 0, 0]) 
                drawComponents() {
                    planeX();
                    timingMountX1();
                    timingMountX2();
                }

        translate([95, 25, 100]) 
        rotate([0, 0, -90])
        drawComponents() {

            drawComponents() {
                timingBeldEnd1();

                translate([0, 0, 7])
                    timingBeldEnd2(anti = true);
            }

            drawComponents() {
                translate([0, 0, 7])
                    timingBeldEnd2();
            }
        }
    }
}   


//***************************************************************
// Y frame
//***************************************************************
if (yFrame) {

    drawComponents()
        translate([-50, 5, 42.5])
            slider1();
        
    drawComponents()
        translate([50, 5, 42.5])
            slider1();


    rotate([-90, 0, 0]) {
        drawComponents() {
            frameY(switch = true);
        }

        drawComponents()
            frameYFix();
    }

    translate([0, 230, 0]) 
        rotate([90, 180, 0]) {
            drawComponents()
                frameY();

            drawComponents()
                frameYFix();

            }

    drawComponents()
        translate([0, 60 + $t * 120, 42.5])
            rotate([180, 0, 0])
                planeY();

    drawComponents() {
        translate([0, 60 + $t * 120, 42.5])
            rotate([180, 0, 0])
                timingMountY();
    }


    color("lime", 0.5)
    translate([0, 170, 55])
        rotate([-180, 0, 0])
        drawComponents()
            paperPlane();


    drawComponents()
        translate([0, 225, 11]) {

            drawComponents() {
                timingBeldEnd1();

                translate([0, 0, 6])
                    timingBeldEnd2(anti = true);
            }

            drawComponents() {
                translate([0, 0, 6])
                    timingBeldEnd2();
            }
        }

}



%color("brown")
   translate([-150, -65, -16])
       cube([300, 300, 16]);

module slider1() {
    if ($componentMode == 2) {
        color("gray")
        rotate([-90, 0, 0])
            cylinder(210, 6.35/2, 6.35/2); 

        color("blue")
            translate([0, -10, 0])
                rotate([-90, 0, 0])
                    cylinder(240, 2.1, 2.1); 
    }
}

module slider2() {
    if ($componentMode == 2) {
        color("gray")
        rotate([-90, 0, -90]) 
            cylinder(200, 6.35/2, 6.35/2);

        color("blue")
            translate([-20, 0, 0])
                rotate([-90, 0, -90])
                    cylinder(240, 2.1, 2.1); 
    }
}




