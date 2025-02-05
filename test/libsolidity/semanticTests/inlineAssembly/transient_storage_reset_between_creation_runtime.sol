contract C {
    constructor() {
        uint x;
        assembly {
            tstore(0, 42)
            x := tload(0)
        }
        assert(x == 42);
    }

    function f() public returns (uint x) {
        assembly {
            x := tload(0)
            if eq(x, 42) {
                revert(0, 0)
            }
        }
    }
}
// ====
// VMMachineAndVersion: >=cancun
// ----
// constructor() ->
// f() -> 0
