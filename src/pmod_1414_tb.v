/*
 * Copyright (c) 2025 Andrew Tudoroi
 * SPDX-License-Identifier: Apache-2.0
 */

`timescale 1ns/1ps
`define DUMPSTR(x) `"x.vcd`"
module pmod_1414_tb();

parameter DURATION  = 10000;

reg CLK = 0;


always begin
    #41.667
    CLK =!CLK;
end

pmod_1414 UUT(
    .CLK(CLK)

);

initial begin

  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, pmod_1414_tb);

   #(DURATION) 
  $display("End of simulation");
  $finish;
end

endmodule


