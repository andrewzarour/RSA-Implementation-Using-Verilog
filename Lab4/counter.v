`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2020 07:08:23 PM
// Design Name: 
// Module Name: counter
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


module counter (
    input clk,
    input rst,
    input [4:0] mux_ctrl,
    output wire [6:0] SEG,
    output wire [7:0] AN,
    output wire dp,
    output reg [3:0] count
    
    
    );
    //reg [3:0] count;
    reg clk_div;
    reg [31:0] count_tmp;
    
    always@(posedge clk or posedge rst)
        begin
          if(rst)
            begin
              count_tmp <= 1'h0;
            end
          else
            count_tmp <= count_tmp +1;
        end
        
    always@(posedge clk)
      begin
        case(mux_ctrl)
        0: clk_div <= count_tmp[0];
        1: clk_div <= count_tmp[1];
        2: clk_div <= count_tmp[2];
        3: clk_div <= count_tmp[3];
        4: clk_div <= count_tmp[4];
        5: clk_div <= count_tmp[5];
        6: clk_div <= count_tmp[6];
        7: clk_div <= count_tmp[7];
        8: clk_div <= count_tmp[8];
        9: clk_div <= count_tmp[9];
        10: clk_div <= count_tmp[10];
        11: clk_div <= count_tmp[11];
        12: clk_div <= count_tmp[12];
        13: clk_div <= count_tmp[13];
        14: clk_div <= count_tmp[14];
        15: clk_div <= count_tmp[15];
        16: clk_div <= count_tmp[16];
        17: clk_div <= count_tmp[17];
        18: clk_div <= count_tmp[18];
        19: clk_div <= count_tmp[19];
        20: clk_div <= count_tmp[20];
        21: clk_div <= count_tmp[21];
        22: clk_div <= count_tmp[22];
        23: clk_div <= count_tmp[23];
        24: clk_div <= count_tmp[24];
        25: clk_div <= count_tmp[25];
        26: clk_div <= count_tmp[26];
        27: clk_div <= count_tmp[27];
        28: clk_div <= count_tmp[28];
        29: clk_div <= count_tmp[29];
        30: clk_div <= count_tmp[30];
        31: clk_div <= count_tmp[31];
        default: clk_div <= 1'hZ;
        endcase
      end
    
    segment_disp U1 (
                    .SW(count[3:0]),
                    //.clk_(clk),
                    //.rst_(rst),
                    .a_to_g(SEG),
                    .AN_(AN),
                    .dp_(dp)
                    );
    
    
    
    always@(posedge clk_div or posedge rst)
        begin
          if(rst)
            begin
              count <= 1'h0;
            end
          else if(count > 4'b1001)
            count <= 1'h0;
          else
            count <= count +1;
        end
endmodule
