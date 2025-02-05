{
    {
        let mcopy := 1
    }

    {
        function mcopy() {}
        mcopy()
    }
}
// ====
// VMMachineAndVersion: >=cancun
// ----
// ParserError 5568: (20-25): Cannot use builtin function name "mcopy" as identifier name.
