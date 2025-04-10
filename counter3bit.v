`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2025 15:09:54
// Design Name: 
// Module Name: counter3bit
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


module counter3bit (
    input rst,    // Clock signal
    input clk,    // Asynchronous reset
    output reg [2:0] count  // 3-bit counter output
);

 always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 3'b001; // Initialize to state 1
        else begin
            case (count)
                3'b001: count <= 3'b010;
                3'b010: count <= 3'b100;
                3'b100: count <= 3'b110;
                3'b110: count <= 3'b000;
                3'b000: count <= 3'b011;
                3'b011: count <= 3'b101;
                3'b101: count <= 3'b111;
                3'b111: count <= 3'b001;
                default: count <= 3'b001;
            endcase
        end
    end

endmodule
