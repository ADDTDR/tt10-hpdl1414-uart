/*
 * Copyright (c) 2025 Andrew Tudoroi
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_hpdl1414_uart_atudoroi (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);


pmod_1414 pmod_1414 (
		.CLK_i(clk),      //-- 12 Mhz
		// Data lines 
		.HPDL_D0(uo_out[0]),
		.HPDL_D1(uo_out[1]),
		.HPDL_D2(uo_out[2]),
		.HPDL_D3(uo_out[3]),
		.HPDL_D4(uo_out[4]),
		.HPDL_D5(uo_out[5]),
		.HPDL_D6(uo_out[6]),
		// Place address line 
		.HPDL_A0(uio_out[0]),
		.HPDL_A1(uio_out[1]),
		// Write enable lines 
		.HPDL_WR1(uio_out[2]),
		.HPDL_WR2(uio_out[3]),
		.HPDL_WR3(uio_out[4]),
		.HPDL_WR4(uio_out[5]),
		// Serial connections 
		.UART_TX(uio_out[6]),
		.UART_RX(uio_in[3]),
		.RESET_N(rst_n)

);


 assign uio_oe = 8'b1111_1110;
  // // All output pins must be assigned. If not used, assign to 0.
  // assign uo_out  = ui_in + uio_in;  // Example: ou_out is the sum of ui_in and uio_in
  // assign uio_out = 0;
  // assign uio_oe  = 0;
  assign uo_out[7] = 1'b0;
  assign uio_out[7] = 1'b0;


  // // List all unused inputs to prevent warnings
  wire _unused = &{ena,  ui_in, uio_in[2:0], uio_in[7:4], 1'b0};
 

endmodule
