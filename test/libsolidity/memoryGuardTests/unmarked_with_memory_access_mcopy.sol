contract C {
    constructor() {
        assembly {
            mcopy(1000, 2000, 1000)
        }
    }

    function copy() public {
        assembly {
            mcopy(1000, 2000, 1000)
        }
    }
}
// ====
// VMMachineAndVersion: >=cancun
// ----
// :C(creation) false
// :C(runtime) false
