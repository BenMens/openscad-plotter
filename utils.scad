module drawComponents() {
    difference() {
        union() {
            let ($componentMode = 0) {
                children();
            }
        }

        let ($componentMode = 1) {
            children();
        }
    }

    let ($componentMode = 2) {
        %children();
    }
}