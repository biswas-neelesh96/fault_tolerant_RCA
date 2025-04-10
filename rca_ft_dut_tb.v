`timescale 1ns / 1ps

module rca_ft_dut_tb;
    // Testbench signals
    reg [3:0] a, b;
    reg init,clk;
    reg test;
    reg f1,f2;
    reg [2:0]lut_i;
    wire [3:0] s,cf,sf;
    wire cout;
    
    // Instantiate the DUT
    rca_ft_dut uut (a,b,init,clk,test,f1,f2,lut_i,s,sf,cf,cout);
    
    // Clock generation
 always #5 clk = ~clk;
 always #10 lut_i=lut_i+1;
    
    initial begin
        // Initialize inputs
        clk = 0;
        a = 4'b0000; b = 4'b0000;
        test = 1; f1 = 0; f2 = 0;
        lut_i=3'b000;
        init = 1;
        
        // Apply test vectors
        #10; init=0; a = 4'b0101; b = 4'b0011;  // Case 1: Simple addition
        #10; a = 4'b1111; b = 4'b0001;  // Case 2: Overflow case
        #10; a = 4'b1010; b = 4'b0101;  // Case 3: Another test case
        #10; a = 4'b1011; b = 4'b0101;  // Case 3: Another test case
        #10; a = 4'b1110; b = 4'b1101;  // Case 3: Another test case
        #10; a = 4'b0100; b = 4'b0001;  // Case 3: Another test case
        #10; a = 4'b0010; b = 4'b0100;  // Case 3: Another test case
        #10; init=1; a = 4'b1000; b = 4'b0001;  // Case 3: Another test case 
                                 // Case 4: Test mode enabled
        #10; init=0; f1 = 0; f2 = 1;                    // Case 5: Enable fault tolerance features
        
        #10; a = 4'b1111; b = 4'b0001;  // Case 2: Overflow case
        #10; a = 4'b1010; b = 4'b0101;  // Case 3: Another test case
        #10; a = 4'b1011; b = 4'b0101;  // Case 3: Another test case
        #10; a = 4'b1110; b = 4'b1101;  // Case 3: Another test case
        #10; a = 4'b0100; b = 4'b0001;   // Case 3: Another test case
        #10; a = 4'b0010; b = 4'b0100;   // Case 3: Another test case
        #10; a = 4'b1000; b = 4'b0001;  // Case 3: Another test case
        #20;
        $stop;
    end
    
endmodule
