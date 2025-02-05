{
  for {} div(create(0, 1, 1), shl(msize(), 1)) {}
  {
  }
}
// ====
// VMMachineAndVersion: >byzantium
// ----
// step: expressionSimplifier
//
// {
//     {
//         for { } div(create(0, 1, 1), shl(msize(), 1)) { }
//         { }
//     }
// }
