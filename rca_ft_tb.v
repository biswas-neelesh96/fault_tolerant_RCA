`timescale 1ns / 1ps

module rca_ft_tb();
    
    // Inputs
    reg [3:0] a, b;
    reg c1, test;
    reg is0, is1, is2, is3, is4, is5;
    reg CS0, CS1, CS2, CS3, CS4;
    reg SS0, SS1, SS2, SS3;
    reg [4:0] A, B;
    
    // Outputs
    wire [3:0] s;
    wire cout;
    
    // Instantiate the module under test
    rca_ft uut (a,b,c1,test,is0,is1,is2,is3,is4,is5,CS0,CS1,CS2,CS3,CS4,SS0,SS1,SS2,SS3,A,B,s,cout);
    
    initial begin
        // Test case 1: Basic addition
        test = 1'b1;
        is0 = 0; is1 = 0; is2 = 0; is3 = 0; is4 = 0; is5 = 0;
        CS0 = 0; CS1 = 0; CS2 = 0; CS3 = 0; CS4 = 0;
        SS0 = 0; SS1 = 0; SS2 = 0; SS3 = 0;
        
        a = 4'b0001; b = 4'b0010; c1 = 1'b0; 
        A = 5'b00001; B = 5'b00010;
        #40;
        
        a = 4'b0001; b = 4'b0011; c1 = 1'b0;
        A = 5'b00001; B = 5'b00011;
        #40;
        
        a = 4'b1001; b = 4'b0011; c1 = 1'b0; 
        A = 5'b01001; B = 5'b00011;
        #40
        
        a = 4'b1001; b = 4'b1011; c1 = 1'b0;
        A = 5'b01001; B = 5'b01011;
        #40
        
        a = 4'b1100; b = 4'b1011; c1 = 1'b0;
        A = 5'b01100; B = 5'b01011;
        #40
        
        a = 4'b1100; b = 4'b0111; c1 = 1'b0;
        A = 5'b01100; B = 5'b00111;
        #40
        
        a = 4'b1000; b = 4'b0111; c1 = 1'b0; 
        A = 5'b01000; B = 5'b00111;
        #40
        
        a = 4'b1000; b = 4'b0110; c1 = 1'b0; 
        A = 5'b01000; B = 5'b00110;
        #40
        
                
        a = 4'b0001; b = 4'b0110; c1 = 1'b0; 
        A = 5'b00001; B = 5'b00110;
        #40
        
        a = 4'b0001; b = 4'b1110; c1 = 1'b0; 
        A = 5'b00001; B = 5'b01110;
        #40
        // End simulation
        $stop;
    end
    
endmodule
