`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2020 10:55:46 AM
// Design Name: 
// Module Name: top_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_tb(
);
reg clk_tb, rst_tb, enable_tb, upd_tb;
reg [4:0] SW_tb;
wire [6:0] SEG_tb;
wire [7:0] AN_tb;
wire dp_tb;
 
top U0(
  .clk(clk_tb),
  .rst(rst_tb),
  .enable(enable_tb),
  .upd(upd_tb),
  .SW(SW_tb),
  .SEG(SEG_tb),
  .AN(AN_tb),
  .dp(dp_tb)
  );
 
initial 
begin
clk_tb <= 1;
rst_tb <= 1;
SW_tb <= 5'b00011;
enable_tb <= 0;
upd_tb <= 0;
#10
SW_tb <= 5'b00011;
enable_tb <= 1;
upd_tb <= 0;
rst_tb <= 0;
#1000  $finish;
end
 
always begin 
#5 clk_tb = ~clk_tb;
end
 
endmodule
