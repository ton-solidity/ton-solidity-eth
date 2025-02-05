contract C {
    function f() public view returns (bytes32 ret) {
        assembly {
            ret := blobhash(1)
        }
    }
}
// ====
// VMMachineAndVersion: >=cancun
// ----
