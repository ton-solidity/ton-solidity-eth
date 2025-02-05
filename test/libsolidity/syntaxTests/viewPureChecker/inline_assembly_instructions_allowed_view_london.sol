contract C {
    function f() public view {
        assembly {
            pop(difficulty())
        }
    }
}
// ====
// VMMachineAndVersion: <=london
// ----
