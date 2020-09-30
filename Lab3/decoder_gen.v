`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2020 11:29:24 PM
// Design Name: 
// Module Name: decoder_gen
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


module decoder_gen (
    input inp1_,
    input inp2_,
    input inp3_,
    input inp4_,
    
    output [15:0] op_
    );
    
    wire [3:0] op0_;
    
    wire en1 = 1'b1;
    
    decoder U0 (
                    .inpA(inp4_),
                    .inpB(inp3_),
                    .op(op0_),
                    .en(en1)
                    );
                    
    decoder U1 (
                    .inpA(inp2_),
                    .inpB(inp1_),
                    .op(op_[3:0]),
                    .en(op0_[0])
                    );
    
    decoder U2 (
                    .inpA(inp2_),
                    .inpB(inp1_),
                    .op(op_[7:4]),
                    .en(op0_[1])
                    );

    decoder U3 (
                    .inpA(inp2_),
                    .inpB(inp1_),
                    .op(op_[11:8]),
                    .en(op0_[2])
                    );    

    decoder U4 (
                    .inpA(inp2_),
                    .inpB(inp1_),
                    .op(op_[15:12]),
                    .en(op0_[3])
                    );    

endmodule
