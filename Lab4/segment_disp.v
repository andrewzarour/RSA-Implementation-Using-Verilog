`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2020 07:01:42 PM
// Design Name: 
// Module Name: segment_disp
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


`define an_control 8'b11111110
`define dp_off   1'b1 

module segment_disp(
                input [3:0] SW,
                //input clk_,
                //input rst_,
                output reg [6:0] a_to_g,
                output wire [7:0] AN_,
                output wire dp_
              );
              
assign AN_ = `an_control;  
assign dp_  = `dp_off; 





// 7-segement decoder : hex7seg 

always@(SW)
    begin 
        case(SW)
                0: a_to_g = 7'b0000001;
                1: a_to_g = 7'b1001111;
                2: a_to_g = 7'b0010010;
                3: a_to_g = 7'b0000110;
                4: a_to_g = 7'b1001100;
                5: a_to_g = 7'b0100100;
                6: a_to_g = 7'b0100000;
                7: a_to_g = 7'b0001111;
                8: a_to_g = 7'b0000000;
                9: a_to_g = 7'b0000100;
              1'hA: a_to_g = 7'b0001000;
              1'hB: a_to_g = 7'b1100000;
              1'hC: a_to_g = 7'b0110001;
              1'hD: a_to_g = 7'b1000010;
              1'hE: a_to_g = 7'b0110000;
              1'hF: a_to_g = 7'b0111000;
              
          default: a_to_g = 7'b0000001;
        endcase 
    end             

              
endmodule
