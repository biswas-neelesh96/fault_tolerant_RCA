module lut(
    input wire [2:0] addr,  // 4-bit address input
    output reg [3:0] data   // 8-bit output data
);

always @(*) begin
    case (addr)
        3'b000: data = 4'b0000;
        3'b001: data = 4'b0101;
        3'b010: data = 4'b0101;
        3'b011: data = 4'b0110;
        3'b100: data = 4'b1001;
        3'b101: data = 4'b1010;
        3'b110: data = 4'b1010;
        3'b111: data = 4'b1111;
        default: data = 4'b0000; // Default case
    endcase
end

endmodule
