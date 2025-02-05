contract C {
    function f() public view returns (uint) {
        return block.prevrandao;
    }
}
// ====
// VMMachineAndVersion: <paris
// ----
// f() -> 200000000
