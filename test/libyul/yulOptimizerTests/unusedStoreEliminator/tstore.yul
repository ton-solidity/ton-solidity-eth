{
    let x := 5
    tstore(x, 10)
    sstore(x, 10)
    pop(mload(0))
    tstore(x, 10)
    sstore(x, 20)
}
// ====
// VMMachineAndVersion: >=cancun
// ----
// step: unusedStoreEliminator
//
// {
//     {
//         let x := 5
//         tstore(x, 10)
//         let _2 := 10
//         pop(mload(0))
//         tstore(x, 10)
//         sstore(x, 20)
//     }
// }
