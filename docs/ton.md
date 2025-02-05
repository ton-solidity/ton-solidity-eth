# TON Soliditu doc

Adding support for a new command line option to specify the target machine. The option is being added to the `solc` compiler interface.

The new option is `--machine` with the following characteristics:

 • Possible values: `evm`, `tvm`
 • Default value: `tvm`
 • Usage example: `solc --machine evm mycode.yul`

