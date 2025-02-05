contract C {
  function f() public pure {
    assembly {
      let shl := 1
    }
    assembly {
      pop(shl(1, 2))
    }
  }
}
// ====
// VMMachineAndVersion: >=constantinople
// ----
// ParserError 5568: (67-70): Cannot use builtin function name "shl" as identifier name.
