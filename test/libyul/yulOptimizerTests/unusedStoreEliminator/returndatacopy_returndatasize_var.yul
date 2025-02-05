{
  let s := returndatasize()
  returndatacopy(0,0,s)
}
// ====
// VMMachineAndVersion: >homestead
// ----
// step: unusedStoreEliminator
//
// {
//     {
//         let s := returndatasize()
//         let _1 := 0
//         let _2 := 0
//     }
// }
