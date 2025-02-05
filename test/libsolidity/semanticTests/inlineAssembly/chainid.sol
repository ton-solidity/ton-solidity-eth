contract C {
    function f() public returns (uint id) {
        assembly {
            id := chainid()
        }
    }
}
// ====
// VMMachineAndVersion: >=istanbul
// ----
// f() -> 1
