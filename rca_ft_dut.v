`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2025 09:17:32
// Design Name: 
// Module Name: rca_ft
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


module rca_ft_dut(input [3:0]a,b,
              input init,clk,
              input test,
              input f1,f2,
              input [2:0]lut_i,
              output [3:0]s,cf,sf,
              output cout);
              
wire IS0,IS1,IS2,IS3,IS4,IS5;
wire CS0,CS1,CS2,CS3,CS4;
wire SS0,SS1,SS2,SS3;
wire [4:0]A,B;
wire c_1,a0,b0;
wire c1;
wire A21,C12;
wire a11,b11,a12,b12,a13,b13;
wire A0,A1,A2,A3,A4,B0,B1,B2,B3,B4;
TPGC tp0 (init,clk,A,B,c1);

mux2to1 t0 (c1,0,test,c_1);
mux2to1 t1 (A[0],a[0],test,A0);
mux2to1 t2 (B[0],b[0],test,B0);

mux2to1 m0 (a[1],a[0],IS0,a11);
mux2to1 m1 (b[1],b[0],IS1,b11);

mux2to1 m2 (a[2],a[1],IS2,a12);
mux2to1 m3 (b[2],b[1],IS3,b12);

mux2to1 m4 (a[3],a[2],IS4,a13);
mux2to1 m5 (b[3],b[2],IS5,b13);

mux2to1 t3 (A[1],a11,test,A1);
mux2to1 t4 (B[1],b11,test,B1);

mux2to1 t5 (A[2],a12,test,A21);
mux2to1 t6 (B[2],b12,test,B2);

mux2to1 t7 (A[3],a13,test,A3);
mux2to1 t8 (B[3],b13,test,B3);

mux2to1 t9 (A[4],a[3],test,A4);
mux2to1 t10 (B[4],b[3],test,B4);

fa f00 (A0,B0,c_1,S10,C10);
mux2to1 f01 (C10,c_1,CS0,C0);

fa f10 (A1,B1,C0,S11,C11);
mux2to1 f11 (C11,C10,CS1,C1);
assign A2= f1 & A21;
fa f20 (A2,B2,C1,S12,C12);
mux2to1 f21 (C12,C11,CS2,C12);
assign C2=f2|C12;
fa f30 (A3,B3,C2,S13,C13);
mux2to1 f31 (C13,C12,CS3,C3);

fa f40 (A4,B4,C3,S14,C14);
mux2to1 f41 (C14,C13,CS4,cout);

mux2to1 s1 (S10,S11,SS0,s[0]);
mux2to1 s2 (S11,S12,SS1,s[1]);
mux2to1 s3 (S12,S13,SS2,s[2]);
mux2to1 s4 (S13,S14,SS3,s[3]);

assign sf[0]=S10;
assign sf[1]=S11;
assign sf[2]=S12;
assign sf[3]=S13;

assign cf[0]=C10;
assign cf[1]=C11;
assign cf[2]=C12;
assign cf[3]=C13;

OCMSG ora (clk,init,sf,cf,lut_i,IS0,IS1,IS2,IS3,IS4,IS5,CS0,CS1,CS2,CS3,CS4,SS0,SS1,SS2,SS3); 

endmodule
