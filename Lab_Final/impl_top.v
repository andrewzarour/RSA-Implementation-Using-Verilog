`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2020 11:47:37 AM
// Design Name: 
// Module Name: impl_top
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


module impl_top (
input               clk     , // Top level system clock input.
input               sw_0    , // Slide switches.
//input               sw_1    , // Slide switches.
input   wire        uart_rxd, // UART Recieve pin.
//input RD_EN,
//input WR_EN,
//input [2:0] main_ptr,
//output  wire        uart_txd, // UART transmit pin.
 output wire [6:0]  a_to_g,
   output wire [7:0] AN,
   output DP,
output  wire [7:0]  led,
output wire [31:0] INP_FULL,
output reg flag
);
 
// Clock frequency in hertz.
parameter CLK_HZ = 100000000;
parameter BIT_RATE =   9600;
parameter PAYLOAD_BITS = 8;
 
wire [PAYLOAD_BITS-1:0]  uart_rx_data;
wire        uart_rx_valid;
wire        uart_rx_break;
 
//wire        uart_tx_busy;
//wire [PAYLOAD_BITS-1:0]  uart_tx_data;
//wire        uart_tx_en;
 
//reg  [PAYLOAD_BITS-1:0]  led_reg;
//assign      led = led_reg;
 
// ------------------------------------------------------------------------- 
 
//assign uart_tx_data = uart_rx_data;
//assign uart_tx_en   = uart_rx_valid;
 
//always @(posedge clk) begin
//    if(!sw_0) begin
//        led_reg <= 8'hF0;
//    end else if(uart_rx_valid) begin
//        led_reg <= uart_rx_data[7:0];
//    end
//end
 
 
// ------------------------------------------------------------------------- 
 
//
// UART RX
uart_rx #(
.BIT_RATE(BIT_RATE),
.PAYLOAD_BITS(PAYLOAD_BITS),
.CLK_HZ  (CLK_HZ  )
) i_uart_rx(
.clk          (clk          ), // Top level system clock input.
.resetn       (sw_0         ), // Asynchronous active low reset.
.uart_rxd     (uart_rxd     ), // UART Recieve pin.
.uart_rx_en   (1'b1         ), // Recieve enable
.uart_rx_break(uart_rx_break), // Did we get a BREAK message?
.uart_rx_valid(uart_rx_valid), // Valid data recieved and available.
.uart_rx_data (uart_rx_data )  // The recieved data.
);
 
ascii2dec U1(
            .clk(clk),
            .rst(sw_0),
            .a_in(uart_rx_data),
            .out(led)
            );
            
wire [31:0] endp;
ascii2dec U2(
            .clk(clk),
            .rst(sw_0),
            .a_in(uart_rx_data),
            .out(endp)
            );
assign INP_FULL = endp;
            
ssd_gen U3(
.SW(uart_rx_data),
.a_to_g(a_to_g),
.clk(clk),
.rst(sw_0),
.an(AN),
.dp(DP)
);
 
// wire buf_empty, buf_full;
// wire [3:0] fifo_c;
// wire [7:0] buf_out;
// reg [31:0] big_op;
// reg [3:0] counter;
// reg big_f;
 
// fifo U2 (
//            .clk(clk),
//            .rst(sw_0),
//            .buf_in(uart_rx_data),
            
//            .buf_out(buf_out),
//            .buf_empty(buf_empty),
//            .buf_full(buf_full),
//            .fifo_counter(fifo_c)
//            );

//memory U2 (
//        .clk(clk),
//        .rst(sw_0),
//        .wr(WR_EN),
//        .rd(RD_EN),
//        .addr_wr(main_ptr),
//        .addr_rd(main_ptr),
//        .data_in(uart_rx_data),
//        .data_out(buf_out),
//        .buf_full(buf_full),
//        .buf_empty(buf_empty)
        
//        );
        
    
//    reg f1 =0, f2=0, f3=0, f4=0, f5=0, f6=0, f7=0, f0 = 0;
        
    always @(posedge clk)
    begin
        //flag <= (f0&f1&f2&f3&f4&f5&f6&f7);
        flag <= 1;
    end
            
//    always @ (posedge clk)
//    begin
//    if(RD_EN == 1)
//    begin
//      case(main_ptr)
//        0 : 
//        begin
//          INP_FULL[31:28] <= buf_out[3:0];
//          f0 <= 1;
//        end
        
//        1 :
//        begin
//          INP_FULL[27:24] <= buf_out[3:0];
//          f1 <= 1;
//        end
        
//        2 :
//        begin
//          INP_FULL[23:20] <= buf_out[3:0];
//          f2 <= 1;
//        end
        
//        3 :
//        begin
//          INP_FULL[19:16] <= buf_out[3:0];
//          f3 <= 1;
//        end
        
//        4 :
//        begin
//          INP_FULL[15:12] <= buf_out[3:0];
//          f4 <= 1;
//        end
        
//        5 :
//        begin
//          INP_FULL[11:8] <= buf_out[3:0];
//          f5 <= 1;
//        end
        
//        6 :
//        begin
//          INP_FULL[7:4] <= buf_out[3:0];
//          f6 <= 1;
//        end
        
//        7 :
//        begin
//          INP_FULL[3:0] <= buf_out[3:0];
//          f7 <= 1;
//        end
//      endcase  
//    end
      
//    end
            

            
 
 
endmodule
