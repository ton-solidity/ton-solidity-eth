contract C {
    /// TransientDataLocation: storageLocation
    /// TransientVarName: name
    uint transient x;
    /// StorageDataLocation: storageLocation
    /// StorageVarName: name
    uint y;

}
// ====
// VMMachineAndVersion: >=cancun
// ----
// TransientDataLocation: transient
// TransientVarName: x
// StorageDataLocation: default
// StorageVarName: y
