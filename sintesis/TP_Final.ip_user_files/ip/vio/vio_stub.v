// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Sat Apr 27 16:15:52 2024
// Host        : CEO-LT3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub d:/CLP/tp_final/sintesis/TP_Final.srcs/sources_1/ip/vio/vio_stub.v
// Design      : vio
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "vio,Vivado 2018.1" *)
module vio(clk, probe_out0, probe_out1, probe_out2)
/* synthesis syn_black_box black_box_pad_pin="clk,probe_out0[0:0],probe_out1[0:0],probe_out2[11:0]" */;
  input clk;
  output [0:0]probe_out0;
  output [0:0]probe_out1;
  output [11:0]probe_out2;
endmodule
