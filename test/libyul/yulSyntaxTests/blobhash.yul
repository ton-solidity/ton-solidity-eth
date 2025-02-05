{
    {
        let blobhash := 1
    }

    {
        function blobhash() {}
        blobhash()
    }
}

// ====
// VMMachineAndVersion: >=cancun
// ----
// ParserError 5568: (20-28): Cannot use builtin function name "blobhash" as identifier name.
