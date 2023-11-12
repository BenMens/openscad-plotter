use <utils.scad>
use <bushing.scad>
use <plane-x.scad>
use <servo.scad>

$fn = 100;


module penHolder1() {
    if ($componentMode == 0) {
        translate([0, -7.5, 0]) {
            difference() {
                union() {
                    translate([15, 0, 1])
                        bushing(9);

                    translate([-15, 0, 1])
                        bushing(9);

                    translate([-25, 6.5, 0])
                        cube([50, 4, 10]);    

                    difference() {
                        translate([-25, -7.5, 0])
                            cube([50, 15, 1]);    

                        translate([0, -9, -1])
                            cylinder(3, 10, 10);

                        translate([-2.5, 3.5, -1])
                            cube([5, 3, 4]);
                    }
                }

                translate([-15, 30, 5])
                    rotate([90, 0, 0])
                        cylinder(30, 1.95, 1.95);

                translate([15, 30, 5])
                    rotate([90, 0, 0])
                        cylinder(30, 1.95, 1.95);

            }
        }
    }
}

module penHolder2(anti=false) {
    if ($componentMode == 0 && !anti) {
        difference() {
            union() {
                translate([-15, -22, 0])
                    cube([30, 22, 20]);

                translate([-5, -32, 0])
                    cube([10, 32, 20]);

                translate([-5, -22, 0])
                    cylinder(20, 10, 10);
                    
                translate([5, -22, 0])
                    cylinder(20, 10, 10);

                // translate([-15, -32, 0])
                //     cube([30, 32, 20]);

            }

            translate([-6, -3.5, -0.01])
                cube([12, 5.01, 20.02]);


            translate([0, -27, -1])
                rotate([0, 0, 45])
                    cube([12, 12, 30]);

            translate([0, -7.5, -1]) {
                translate([15, 0, 0])
                    cylinder(22, 7.5, 7.5);

                translate([-15, 0, 0])
                    cylinder(22, 7.5, 7.5);
            }            

            translate([0, -22, 10])
                rotate([90, 0, 0])
                    cylinder(12, 1.95, 1.95);

        }

        translate([0, -7.5, 0]) {
            translate([15, 0, 0])
                bushing(20);

            translate([-15, 0, 0])
                bushing(20);

        }
    } else if ($componentMode == 1) {
        translate([0, 7, 15])
            rotate([90, 0, 0])
                cylinder(20, 0.5, 0.5);


        translate([0, 7, 5])
            rotate([90, 0, 0])
                cylinder(20, 0.5, 0.5);
    }
}

module penHolderAx() {
    color("blue") 
    if ($componentMode==0) {
        translate([-1.5, -3.5, 0])
            cube([3, 2, 89]);

        translate([0, 2.5, 89])
            rotate([90, 0, 0])
                cylinder(6, 2, 2);
    }

    penHolder2(anti = true);
}


module penHolderLiftDisk() {
    if ($componentMode == 0) {
        t= [ 
            for (a = [0 : 1 : 120]) [ speed(a) * sin(a), speed(a) * cos(a) ], 
            for (a = [120 : -1 : 0]) [ (speed(a) + thinkness(a)) * sin(a), (speed(a) + thinkness(a)) * cos(a) ], 
        ];


        translate([0, 2.5,117])
        rotate([90, 0, 0])
        difference() {
            cylinder(4, 22, 22);

            translate([0, 0, -1])
                    linear_extrude(6)
                        rotate([0, 180, 70])
                            polygon(t);

            // #translate([0, 0, -0.01])
            //     cylinder(3.01, 1.9, 1.7);

            // translate([0, 0, 2])
            //     cylinder(3, 1, 1);
        }
    }
}

module servoMount() {
        translate([0, 3.5 , 117])
        rotate([90, 0, 0])
        if ($componentMode == 1) {
        cylinder(4, 6.3/2, 6.3/2);

        translate([0, 0, -2])
            cylinder(8, 1, 1);

        linear_extrude(4)
            polygon([[-0.5, 6.3/2], [20, 2.3], [20, -2.3], [-0.5, -6.3/2] ]);
        
    }
}

function speed(t=0) = sin(t / 120 * 80 + 10) * 10;
function thinkness(t=0) = t / 120 * 5 + 5;

module diskMount() {

    translate([0, 2, 90])
    if ($componentMode == 0) {
        difference() {
            translate([-24.99, 4.5, -1])
                cube([49.98, 13 , 33]);

            translate([-25, -1.3, 10 ])
                cube([50, 12, 30]);

            translate([15, -1, 5])
                rotate([-90,0,0])
                    cylinder(30, 1.7, 1.7);

            translate([-15, -1, 5])
                rotate([-90,0,0])
                    cylinder(30, 1.7, 1.7);

            translate([15, 9, 5])
                rotate([-90,0,0])
                    cylinder(30, 1.9, 1.9);

            translate([-15, 9, 5])
                rotate([-90,0,0])
                    cylinder(30, 1.9, 1.9);
        }
    }

    translate([0, -1 ,117])
        rotate([90, 0, 0])
            servo();
}

module diskMount1() {
    translate([0, 2, 90])
    if ($componentMode == 0) {
        difference() {
            translate([-24.99, -11.5, -1])
                cube([49.98, 13 , 11]);

            translate([-17, -4.5, -1.05])
                cube([34, 10 , 11.1]);

            translate([-2.5, -6, -1.05])
                cube([5, 10 , 11.1]);

            translate([15, -14, 5])
                rotate([-90, 0, 0])
                    cylinder(30, 1.7, 1.7);

            translate([-15, -14, 5])
                rotate([-90,0,0])
                    cylinder(30, 1.7, 1.7);
   

        }
    }
}


drawComponents() {
    // translate([0, 16, 50])
    //     rotate([-90, 0, 0])
    //         planeX();

    // diskMount();
    // diskMount1();

    penHolderLiftDisk();

    servoMount();
}

// color("red")
// drawComponents()
//     penHolder1();


// color("red")
// drawComponents()
//     translate([0, 0, 52])
//         rotate([0, 180, 0])
//             penHolder1();

// drawComponents()
//     translate([0, 0, 11])
//         penHolder2();


// drawComponents() {
//     translate([0, 0, 11])
//         penHolderAx();
// }






