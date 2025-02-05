contract C {
    function f() public returns (uint) {
        return block.chainid;
    }
}
// ====
// VMMachineAndVersion: >=istanbul
// ----
// f() -> 1
// f() -> 1
// f() -> 1
