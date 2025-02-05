contract C {
    function f() public view returns (uint ret) {
        assembly {
            let tstore := sload(0)
            ret := tstore
        }
    }
}
// ====
// VMMachineAndVersion: >=cancun
// ----
// ParserError 5568: (98-104): Cannot use builtin function name "tstore" as identifier name.
