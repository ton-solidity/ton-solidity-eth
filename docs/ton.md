# TON Solidity doc

Added support for a new command line option to specify the target machine. The option has been added to the `solc` compiler interface.

The new option is `--machine` with the following characteristics:

 • Possible values: `evm`, `tvm`
 • Default value: `tvm`
 • Usage example: `solc --machine evm mycode.yul`

The command line can then be used like:

```bash
solc --machine evm ...  # For EVM target
solc --machine tvm ...  # For TVM target (or just omit --machine since TVM is the default)
```
