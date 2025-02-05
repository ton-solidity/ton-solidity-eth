{
    sstore(0, balance(address()))
}
// ====
// VMMachineAndVersion: <istanbul
// ----
// step: expressionSimplifier
//
// {
//     { sstore(0, balance(address())) }
// }
