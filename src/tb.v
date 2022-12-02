`default_nettype none
`timescale 1ns/1ps

/*
this testbench just instantiates the module and makes some convenient wires
that can be driven / tested by the cocotb test.py
*/

module tb (
    // testbench is controlled by test.py
    input latch,
    input blank,
    input [3:0] data,
    input decimal_in,
    output [6:0] segments,
    output decimal
   );

    // this part dumps the trace to a vcd file that can be viewed with GTKWave
    initial begin
        $dumpfile ("tb.vcd");
        $dumpvars (0, tb);
        #1;
    end

    // wire up the inputs and outputs
    wire [7:0] inputs = {2'b0, decimal_in, data[3], data[2], data[1], data[0], blank, latch};
    wire [7:0] outputs;
    assign segments = outputs[6:0];
    assign decimal = outputs[7];

    // instantiate the DUT
    rglenn_hex_to_7_seg rglenn_hex_to_7_seg(
        .io_in  (inputs),
        .io_out (outputs)
        );

endmodule
