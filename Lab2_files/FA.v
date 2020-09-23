`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2020 05:48:39 PM
// Design Name: 
// Module Name: FA
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


module FA(
    input A,
    input B,
    input cin,
    output wire sum,
    output wire cout
    );
    
    wire t1, s1, s2, s3, s4;
    
    xor(T1,A,B);
    xor(sum,T1,cin);
    and(s1,A,B);
    and(s2,cin,B);
    and(s3,cin,A);
    or(s4,s1,s2);
    or(cout,s4,s3);
    
endmodule
