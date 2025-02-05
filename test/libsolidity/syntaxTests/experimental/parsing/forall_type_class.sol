pragma experimental solidity;

forall (A, B)
class Self: C {}
// ====
// VMMachineAndVersion: >=constantinople
// ----
// ParserError 5709: (45-50): Expected a function definition.
