contract C {
    uint transient x;
    function f() public returns (uint) {
        x = 10;
        delete x;
        return x;
    }
}
// ====
// VMMachineAndVersion: >=cancun
// ----
// f() -> 0
