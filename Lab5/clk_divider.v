`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2020 06:29:28 PM
// Design Name: 
// Module Name: clk_divider
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


module clk_divider(
                    input clk,
                    input rst,
                    input [4:0] SW, 
                    output reg clk_div
                    );
                    
                    reg [31:0] count; 
                  

                    always@(posedge clk or posedge rst)
                        begin 
                            if (rst)
                                count <= 0;
                            else 
                                count <= count + 1; 
                        end 
                            always@(posedge clk or posedge rst)
                                begin 
                                if (rst)
                                    clk_div <= 1'b0;
                                 else 
                                    begin 
                                  case (SW)
                                    0:  clk_div <= count[0]; 
                                    1:  clk_div <= count[1]; 
                                    2:  clk_div <= count[2]; 
                                    3:  clk_div <= count[3]; 
                                    4:  clk_div <= count[4]; 
                                    5:  clk_div <= count[5]; 
                                    6:  clk_div <= count[6]; 
                                    7:  clk_div <= count[7]; 
                                    8:  clk_div <= count[8]; 
                                    9:  clk_div <= count[9]; 
                                    10: clk_div <= count[10]; 
                                    11: clk_div <= count[11]; 
                                    12: clk_div <= count[12]; 
                                    13: clk_div <= count[13]; 
                                    14: clk_div <= count[14]; 
                                    15: clk_div <= count[15]; 
                                    16: clk_div <= count[16]; 
                                    17: clk_div <= count[17]; 
                                    18: clk_div <= count[18]; 
                                    19: clk_div <= count[19]; 
                                    20: clk_div <= count[20]; 
                                    21: clk_div <= count[21]; 
                                    22: clk_div <= count[22]; 
                                    23: clk_div <= count[23]; 
                                    24: clk_div <= count[24]; 
                                    25: clk_div <= count[25]; 
                                    26: clk_div <= count[26]; 
                                    27: clk_div <= count[27]; 
                                    28: clk_div <= count[28]; 
                                    29: clk_div <= count[29]; 
                                    30: clk_div <= count[30]; 
                                    31: clk_div <= count[31]; 
                                 default: clk_div <= 1'bZ; 
                                  endcase 
                                  end 
                                end 


endmodule
