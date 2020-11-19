`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2020 09:26:23 AM
// Design Name: 
// Module Name: ser_32to1
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


module ser_32to1(
    input wire clk,
    input rd_en,
    input wire [31:0] dataIn,
    output reg dataOut
    );

    reg [4:0] cnt = 5'b00000;
    always @(posedge clk)
    begin
      if(rd_en == 1) cnt <= cnt + 1;
    end

    always @(cnt) begin
      if(rd_en == 1)
      begin
      case (cnt)
        5'd0: dataOut = dataIn[0];
        5'd1: dataOut = dataIn[1];
        5'd2: dataOut = dataIn[2];
        5'd3: dataOut = dataIn[3];
        5'd4: dataOut = dataIn[4];
        5'd5: dataOut = dataIn[5];
        5'd6: dataOut = dataIn[6];
        5'd7: dataOut = dataIn[7];
        5'd8: dataOut = dataIn[8];
        5'd9: dataOut = dataIn[9];
        5'd10: dataOut = dataIn[10];
        5'd11: dataOut = dataIn[11];
        5'd12: dataOut = dataIn[12];
        5'd13: dataOut = dataIn[13];
        5'd14: dataOut = dataIn[14];
        5'd15: dataOut = dataIn[15];
        5'd16: dataOut = dataIn[16];
        5'd17: dataOut = dataIn[17];
        5'd18: dataOut = dataIn[18];
        5'd19: dataOut = dataIn[19];
        5'd20: dataOut = dataIn[20];
        5'd21: dataOut = dataIn[21];
        5'd22: dataOut = dataIn[22];
        5'd23: dataOut = dataIn[23];
        5'd24: dataOut = dataIn[24];
        5'd25: dataOut = dataIn[25];
        5'd26: dataOut = dataIn[26];
        5'd27: dataOut = dataIn[27];
        5'd28: dataOut = dataIn[28];
        5'd29: dataOut = dataIn[29];
        5'd30: dataOut = dataIn[30];
        5'd31: dataOut = dataIn[31];
        default: dataOut = 8'h00;
      endcase
      end
      else
      begin
        dataOut = 8'h00;
      end
    end
endmodule
