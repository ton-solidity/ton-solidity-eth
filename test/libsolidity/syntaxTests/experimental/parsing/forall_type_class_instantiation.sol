pragma experimental solidity;

type T;

class Self: C {}

forall (A, B)
instantiation T: C {}
// ====
// VMMachineAndVersion: >=constantinople
// ----
// ParserError 5709: (72-85): Expected a function definition.
