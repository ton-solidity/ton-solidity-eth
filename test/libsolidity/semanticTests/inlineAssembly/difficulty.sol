contract C {
    function f() public view returns (uint ret) {
        assembly {
            ret := difficulty()
        }
    }
}
// ====
// VMMachineAndVersion: <paris
// ----
// f() -> 200000000
