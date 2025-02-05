{
  sstore(0, byte(0, shr(0x9, calldataload(0))))
}
// ====
// VMMachineAndVersion: >=constantinople
// ----
// step: expressionSimplifier
//
// { { sstore(0, 0) } }
