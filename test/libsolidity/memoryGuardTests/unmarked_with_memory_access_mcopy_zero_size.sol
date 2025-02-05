contract C {
    constructor() {
        assembly {
            mcopy(1000, 2000, 0)
        }
    }

    function copy() public {
        assembly {
            mcopy(1000, 2000, 0)
        }
    }
}
// ====
// VMMachineAndVersion: >=cancun
// ----
// :C(creation) false
// :C(runtime) false
