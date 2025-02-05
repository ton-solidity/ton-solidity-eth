contract C {
    uint public x;
    uint public transient x;
}
// ====
// VMMachineAndVersion: >=cancun
// ----
// DeclarationError 2333: (36-59): Identifier already declared.
