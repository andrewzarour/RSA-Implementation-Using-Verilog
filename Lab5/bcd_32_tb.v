`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2020 12:00:44 AM
// Design Name: 
// Module Name: bcd_32_tb
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


module bcd_32_tb();
                reg clk_tb;
                reg rst_tb;
                reg en_tb;
                reg upd_tb;
                wire [31:0] count_tb;
                
 bcd_32 U1(
 .clk(clk_tb),
 .rst(rst_tb),
 .en(en_tb),
 .upd(upd_tb),
 .count(count_tb)
 );
 
 initial begin 
 clk_tb = 1;
 rst_tb = 1;
 #5 rst_tb = 0;
 en_tb = 1;
 upd_tb = 1;
#100  $finish;
    end
    
always begin
#5 clk_tb =~ clk_tb;
end

endmodule
