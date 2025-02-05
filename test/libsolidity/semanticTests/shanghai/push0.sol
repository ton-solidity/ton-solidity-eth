contract C {
    function zero() external returns (uint) {
        return 0;
    }

}
// ====
// compileViaYul: also
// VMMachineAndVersion: >=shanghai
// ----
// zero() -> 0
