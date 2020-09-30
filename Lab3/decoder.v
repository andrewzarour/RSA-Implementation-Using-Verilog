`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2020 11:13:06 PM
// Design Name: 
// Module Name: decoder
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


module decoder (
    input inpA,
    input inpB,
    input en,
    output [3:0] op
    );
    
    wire notA, notB;
    not(notA, inpA);
    not(notB, inpB);
    and(op[0],notA,notB, en);
    and(op[1],inpA,notB, en);
    and(op[2],inpB,notA, en);
    and(op[3],inpB,inpA, en);
    
endmodule
