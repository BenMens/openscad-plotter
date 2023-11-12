// #############################################################################
// Pilar with hole
// #############################################################################
module pilar(height, bottomWidth, topWidth, holeSize, pinHeight=20) {

    if ($componentMode == 0) {
        $fn = 50;

        translate([0, 0, height / 2])
        difference() {

            cylinder(height, bottomWidth/2, topWidth/2, true);

            translate([0, 0, (height - pinHeight) / 2 + 0.01])
                cylinder(pinHeight, holeSize/2, holeSize/2,true);
        }
    }    
}


// #############################################################################
// Pilar with pin
// #############################################################################
module pilarWithPin(height, bottomWidth, topWidth, pinSize, pinHeight=3) {
  if ($componentMode == 0) {
    $fn = 50;

    translate([0, 0, height / 2])
      cylinder(height, bottomWidth / 2, topWidth / 2, true);

    translate([0, 0, height + pinHeight / 2])
      cylinder(pinHeight, pinSize / 2, pinSize / 2,true);
  }
}


// pilar(8, 6, 6, 3);

// translate([10, 0, 0])
//   pilarWithPin(8, 6, 6, 4);

// $componentMode = 0;

// cube([20, 20, 2]);

// translate([10, 10, 2])
//   pilarWithPin(4, 4, 4, 3);
//    pilar(7, 6.8, 6.8, 2.8);

