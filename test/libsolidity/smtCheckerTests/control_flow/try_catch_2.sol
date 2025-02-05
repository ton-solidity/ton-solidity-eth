contract C {
	function f() public {
		try this.f() {}
		catch (bytes memory x) {
			x;
		}
	}
}
// ====
// VMMachineAndVersion: >=byzantium
// SMTEngine: all
// ----
