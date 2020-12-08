`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2020 11:04:12 PM
// Design Name: 
// Module Name: ssd_gen
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
//`define an_control 8'b00000000

`define dp_off   1'b1 
`define initial_digit 8'b11111111


module ssd_gen(
                input [31:0] SW,
                input clk,
                input rst,
                output reg [6:0] a_to_g,
                output reg [7:0] an,
                output wire dp
              );
              
assign dp  = `dp_off; 

wire [2:0] s;
wire [7:0] aen;
reg [19:0] clkdiv; 
reg [3:0] digit;
assign s = clkdiv[19:17]; 
assign aen = `initial_digit; 



// clock divider 
    always@(posedge clk or posedge rst)
        begin 
            if (rst)
                clkdiv <= 0;
            else 
                clkdiv <= clkdiv+1; 
        end 
        
// digit select :ancode 
            always@(aen, s)
                begin 
                    an = 8'b11111111; 
                    if(aen[s] == 1)
                        an[s] = 0;
                end 
            
            // 4-to-1 Mux: mux4x1 
            always@(s, SW)
               begin 
                case(s)
                    0: digit = SW[3 : 0]; 
                    1: digit = SW[7 : 4];
                    2: digit = SW[11: 8];
                    3: digit = SW[15:12]; 
                    4: digit = SW[19:16];
                    5: digit = SW[23:20];
                    6: digit = SW[27:24];
                    7: digit = SW[31:28];
              default: digit = 4'bZZZZ;     
                endcase
              end 

// 7-segement decoder : hex7seg 

always@(digit)
    begin 
        case(digit)
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
              'hA: a_to_g = 7'b0001000;
              'hB: a_to_g = 7'b1100000;
              'hC: a_to_g = 7'b0110001;
              'hD: a_to_g = 7'b1000010;
              'hE: a_to_g = 7'b0110000;
              'hF: a_to_g = 7'b0111000;
              
          default: a_to_g = 7'bZZZZZZZ;
        endcase 
    end             

              
endmodule