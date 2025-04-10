`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2025 10:49:02
// Design Name: 
// Module Name: register8bit
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


module register8bit (
    input clk,          // Clock signal
    input rst,          // Synchronous reset
    input [7:0] d,      // Data input
    output reg [7:0] q  // Data output
);
    
    always @(posedge clk) begin
        if (rst)
            q <= 8'b0;  // Reset register to 0
        else
            q <= d;     // Load new data
    end
    
endmodule

