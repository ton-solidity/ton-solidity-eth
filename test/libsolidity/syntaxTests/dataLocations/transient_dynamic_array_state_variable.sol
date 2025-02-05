contract C {
	uint[] transient x;
}
// ====
// VMMachineAndVersion: >=cancun
// ----
// UnimplementedFeatureError 1834: Transient data location is only supported for value types.
