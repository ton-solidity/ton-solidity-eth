{
    let a := address()
    let ret := balance(a)
    sstore(a, ret)
}
// ====
// VMMachineAndVersion: >=istanbul
// ----
// step: expressionSimplifier
//
// {
//     {
//         let a := address()
//         sstore(a, selfbalance())
//     }
// }
