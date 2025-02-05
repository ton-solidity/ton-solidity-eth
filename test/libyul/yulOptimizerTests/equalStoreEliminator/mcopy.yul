{
    calldatacopy(0, 0, 0x40)

    let _0 := 0
    let _32 := 32

    mcopy(_0, _32, _32) // Not redundant. Read/write between different areas.
}
// ====
// VMMachineAndVersion: >=cancun
// ----
// step: equalStoreEliminator
//
// {
//     calldatacopy(0, 0, 0x40)
//     let _0 := 0
//     let _32 := 32
//     mcopy(_0, _32, _32)
// }
