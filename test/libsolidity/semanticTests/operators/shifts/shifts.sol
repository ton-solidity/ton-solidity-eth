contract C {
    function f(uint x) public returns (uint y) {
        assembly { y := shl(2, x) }
    }
}
// ====
// VMMachineAndVersion: >=constantinople
// ----
// f(uint256): 7 -> 28
