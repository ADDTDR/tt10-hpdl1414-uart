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
		.HPDL_D0(uo[0]),
		.HPDL_D1(uo[1]),
		.HPDL_D2(uo[2]),
		.HPDL_D3(uo[3]),
		.HPDL_D4(uo[4]),
		.HPDL_D5(uo[5]),
		.HPDL_D6(uo[6]),
		// Place address line 
		.HPDL_A0(uio[0]),
		.HPDL_A1(uio[1]),
		// Write enable lines 
		.HPDL_WR1(uio[2]),
		.HPDL_WR2(uio[3]),
		.HPDL_WR3(uio[4]),
		.HPDL_WR4(uio[5]),
		// Serial connections 
		.UART_TX(uio[6]),
		.UART_RX(uio[7])

);

  // // All output pins must be assigned. If not used, assign to 0.
  // assign uo_out  = ui_in + uio_in;  // Example: ou_out is the sum of ui_in and uio_in
  // assign uio_out = 0;
  // assign uio_oe  = 0;

  // // List all unused inputs to prevent warnings
  // wire _unused = &{ena, clk, rst_n, 1'b0};

endmodule
