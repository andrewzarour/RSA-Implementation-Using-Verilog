`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2020 08:14:56 PM
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
input               rst,
input               sw_1    , // Slide switches.
input   wire        uart_rxd, // UART Recieve pin.
 output wire [6:0]  a_to_g,
   output wire [7:0] AN,
   output DP,
//output  wire        uart_txd, // UART transmit pin.
output wire [7:0] led2
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

reg  [PAYLOAD_BITS-1:0]  led_reg;
assign      led = led_reg;

// ------------------------------------------------------------------------- 

//assign uart_tx_data = uart_rx_data;
//assign uart_tx_en   = uart_rx_valid;

always @(posedge clk) begin
    if(!sw_0) begin
        led_reg <= 8'hF0;
    end else if(uart_rx_valid) begin
        led_reg <= uart_rx_data[7:0];
        
    end
end


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

ssd_gen U1(
.SW(uart_rx_data),
.a_to_g(a_to_g),
.clk(clk),
.rst(rst),
.an(AN),
.dp(DP)
);

mux_binary U3(
.clk(clk),
.a_in(uart_rx_data),
.rst(rst),
.out(led2)
);



endmodule
