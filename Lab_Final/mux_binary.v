`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2020 12:48:10 AM
// Design Name: 
// Module Name: mux_binary
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


module mux_binary ( 
            input clk,
            input rst,
            input [7:0] a_in,
            output reg [7:0] out
    );
    
    always@(posedge clk or posedge rst)
    begin
        if(rst) out <= 8'h00;
        else
        begin
            case(a_in)
            8'h30: out <= 8'h00;
            8'h31: out <= 8'h01;
            8'h32: out <= 8'h02;
            8'h33: out <= 8'h03;
            8'h34: out <= 8'h04;
            8'h35: out <= 8'h05;
            8'h36: out <= 8'h06;
            8'h37: out <= 8'h07;
            8'h38: out <= 8'h08;
            8'h39: out <= 8'h09;
            8'h61: out <= 8'h0a;
            8'h62: out <= 8'h0b;
            8'h63: out <= 8'h0c;
            8'h64: out <= 8'h0d;
            8'h65: out <= 8'h0e;
            8'h66: out <= 8'h0f;
            default: out <= 8'hZZ;
            endcase
        end
        end
 endmodule
