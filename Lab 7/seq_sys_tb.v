`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2020 04:22:14 PM
// Design Name: 
// Module Name: seq_sys_tb
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


module seq_sys_tb(

    );
    
    reg clk, rst;
    reg wr, rd; // read enable
    reg [2:0] addr_wr, addr_rd; // address read    //switch (sw[9] ~ sw[11]) 
    reg [3:0] data_in; // data-bus input  //switch (sw[5] ~ sw[8])
    //wire [3:0] data_out; 
    wire end_OPtb;

//    memory U1 (
//                .clk(clk),
//                .rst(rst),
//                .wr(wr),
//                .rd(rd),
//                .addr_wr(addr_wr),
//                .addr_rd(addr_rd),
//                .data_in(data_in),
//                .data_out(data_out)
//    );
    
    seq_system U1 (
                .clk(clk),
                .rst(rst),
                .INP(data_in),
                .WR_EN(wr),
                .RD_EN(rd),
                .main_ptr(addr_wr),
                .end_OP(end_OPtb)
    );
    
initial 
begin
clk <= 1;
rst <= 1;
wr <= 0;
rd <= 0;
data_in <= 4'b0000;
addr_wr <= 0;
addr_rd <= 0;

#10

rst <= 0;
wr <= 1;
rd <= 0;
data_in <= 4'b0011;
addr_wr <= 3'b000;
addr_rd <= 3'b000;

#10

rst <= 0;
wr <= 1;
rd <= 0;
data_in <= 4'b0111;
addr_wr <= 3'b001;
addr_rd <= 3'b000;

#10

rst <= 0;
wr <= 1;
rd <= 0;
data_in <= 4'b1111;
addr_wr <= 3'b010;
addr_rd <= 3'b000;

#10

rst <= 0;
wr <= 1;
rd <= 0;
data_in <= 4'b0000;
addr_wr <= 3'b011;
addr_rd <= 3'b000;

#10

rst <= 0;
wr <= 1;
rd <= 0;
data_in <= 4'b1001;
addr_wr <= 3'b100;
addr_rd <= 3'b000;

#10

rst <= 0;
wr <= 1;
rd <= 0;
data_in <= 4'b1011;
addr_wr <= 3'b101;
addr_rd <= 3'b000;

#10

rst <= 0;
wr <= 1;
rd <= 0;
data_in <= 4'b1101;
addr_wr <= 3'b110;
addr_rd <= 3'b000;

#10

rst <= 0;
wr <= 1;
rd <= 0;
data_in <= 4'b0010;
addr_wr <= 3'b111;
addr_rd <= 3'b000;

#20
addr_wr <= 3'b000;

wr <= 0;
rd <= 1;
#20

rd <= 1;
addr_wr <= 3'b001;
#20
rd <= 1;
addr_wr <= 3'b010;
#20
rd <= 1;
addr_wr <= 3'b011;
#20
rd <= 1;
addr_wr <= 3'b100;
#20
rd <= 1;
addr_wr <= 3'b101;
#20
rd <= 1;
addr_wr <= 3'b110;
#20
rd <= 1;
addr_wr <= 3'b111;
#20
rd <= 0;


#1000  $finish;
end
 
always begin 
#5 clk = ~clk;
end

    
endmodule
