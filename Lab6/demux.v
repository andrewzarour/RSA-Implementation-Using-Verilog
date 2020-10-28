`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2020 09:36:14 PM
// Design Name: 
// Module Name: demux
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


module demux(
           input en,
           input [2:0] sel,
           output wire [7:0] out
    );
   not(seln0, sel[0]);
   not(seln1, sel[1]);
   not(seln2, sel[2]);
   and(out[0], seln0,seln1,seln2,en);
   and(out[1],sel[0], seln1, seln2,en);
   and(out[2],seln0,sel[1],seln2,en);
   and(out[3],sel[0],sel[1],seln2,en);
   
   and(out[4],seln0, seln1, sel[2],en);
   and(out[5], sel[0],seln1,sel[2],en);
   and(out[6], seln0, sel[1], sel[2],en);
   and(out[7], sel[0], sel[1], sel[2],en);
    
   
endmodule