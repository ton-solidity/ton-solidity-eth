contract C {
    function f() public pure {
        uint returndatasize;
        returndatasize;
        assembly {
            let x := returndatasize
        }
    }
}
// ====
// VMMachineAndVersion: >=byzantium
// ----
// ParserError 7104: (137-151): Builtin function "returndatasize" must be called.
