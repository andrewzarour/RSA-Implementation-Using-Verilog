`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2020 06:17:26 PM
// Design Name: 
// Module Name: FA_gen
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


module FA_gen #(parameter SIZE = 16)(
    input [SIZE-1:0] A_,
    input [SIZE-1:0] B_,
    output [SIZE-1:0] ans_,
    input [SIZE-1:0] carry_
    
    );
    
    genvar j;
    generate
    for(j = 0; j<SIZE; j=j+1)
        begin
        if(j==0)
          FA U1 (
                .A(A_[0]),
                .B(B_[0]),
                .cin(1'b0),
                .sum(ans_[0]),
                .cout(carry_[0])
                );
        else
          FA U1 (
                .A(A_[j]),
                .B(B_[j]),
                .cin(carry_[j-1]),
                .sum(ans_[j]),
                .cout(carry_[j])
                );
        end
    endgenerate
endmodule
