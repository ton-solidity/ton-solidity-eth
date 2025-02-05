contract C {
    int transient x;
    function f() public returns (int) {
        ++x;
        ++x;
        --x;
        x++;
        x--;
        return x;
    }
}
// ====
// VMMachineAndVersion: >=cancun
// ----
// f() -> 1
