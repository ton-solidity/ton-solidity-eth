contract C {
    uint transient x;
}
// ====
// VMMachineAndVersion: <cancun
// ----
// DeclarationError 7985: (17-33): Transient storage is not supported by EVM versions older than cancun.
