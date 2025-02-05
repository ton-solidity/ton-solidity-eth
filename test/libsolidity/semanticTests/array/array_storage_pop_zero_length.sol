contract C {
    uint[] storageArray;
    function popEmpty() public {
        storageArray.pop();
    }
}
// ====
// VMMachineAndVersion: >=petersburg
// ----
// popEmpty() -> FAILURE, hex"4e487b71", 0x31
