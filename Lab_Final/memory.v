`timescale 1ns / 1ps

module memory(
 clk, // clock input
 rst,
 wr, // write enable
 rd, // read enable
 addr_wr, // address write   //switch (sw[9] ~ sw[11])
 addr_rd, // address read    //switch (sw[9] ~ sw[11]) 
 data_in, // data-bus input  //switch (sw[5] ~ sw[8])
 data_out, // data-bus output
 buf_empty,
 buf_full
);

parameter DATA_WIDTH = 8;   //(sw[5] ~ sw[8])
parameter ADDR_WIDTH = 3;  //(sw[9] ~ sw[11])
parameter RAM_DEPTH = 1 <<ADDR_WIDTH;

//-------------- Input Ports ------------//
input clk, rst;
input wr, rd;
input [ADDR_WIDTH-1:0] addr_wr, addr_rd;
input [DATA_WIDTH-1:0] data_in;
//----------- Output Ports ------------//
output [DATA_WIDTH-1:0] data_out;
output reg buf_empty, buf_full;
//------------ Internal Variables ----------//
reg [DATA_WIDTH-1:0] data_out;
reg [DATA_WIDTH-1:0] mem
[0:RAM_DEPTH-1];

reg [2:0] counter;


always @(counter)
begin
   buf_empty = (counter== 0);
   #10 buf_full = (counter== 3'b111);

end

always @(posedge clk or posedge rst)
begin
   if( rst )
       counter <= 0;

   else if( (!buf_full && wr) && ( !buf_empty && rd ) )
       counter <= counter;

   else if( !buf_full && wr )
       counter <= counter + 1;

   else if( !buf_empty && rd )
       counter <= counter - 1;

   else
      counter <= counter;
end

// Memory Write Block
// Write Operation:
always @(posedge clk)
begin : MEM_WRITE
if (wr) begin
mem[addr_wr] = data_in;
end
end
// Memory Read Block
// Read OperationL:
always @(posedge clk)
begin : MEM_READ
if (rd) begin
data_out = mem[addr_rd];
end
end


endmodule