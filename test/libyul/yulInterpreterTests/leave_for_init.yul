{
  function f() -> x
  {
    for { leave x := 2 } eq(x, 0) { } {
    }
  }
  {
    let a := f()
    sstore(a, 7)
  }
}
// ====
// VMMachineAndVersion: >=constantinople
// ----
// Trace:
// Memory dump:
// Storage dump:
//   0000000000000000000000000000000000000000000000000000000000000000: 0000000000000000000000000000000000000000000000000000000000000007
// Transient storage dump:
