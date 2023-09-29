`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2023 16:06:30
// Design Name: 
// Module Name: tb_alu
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


module tb_alu(

    );
    
    localparam ADD  =    6'b100000;
    localparam SUB  =    6'b100010;
    localparam AND  =    6'b100100;
    localparam OR   =    6'b100101;
    localparam XOR  =    6'b100110;
    localparam SRA  =    6'b000011;
    localparam SRL  =    6'b000010;
    localparam NOR  =    6'b100111;
    localparam NB_DATA = 8;
    reg [(NB_DATA-1):0] sw;
    reg btnAA ;
    reg btnBB ;
    reg btnOP1 ;
    reg btnReset;
    reg  [5:0] op;
    wire [8:0]  res;
    wire  carry;
    reg clock;
   // reg i_reset;
    
    top #(NB_DATA)top1 (sw,btnAA, btnBB, btnOP1, btnReset, clock);
     
    
    
    initial
    begin
    
        btnReset= 1'b0;
        clock = 1'b1;
        #100
        clock = ~clock; //flanco de bajada

        sw = 8'b11111111;
        btnBB = 1'b0;
        btnOP1 = 1'b0;
        btnAA = 1'b1;
        
        #100
        clock = ~clock; //flanco de subida
        
        #100
        clock = ~clock; //flanco de bajada

        sw = 8'b00000010;
        btnAA = 1'b0;
        btnBB = 1'b1;

        #100
        clock = ~clock;//flanco de subida
        #100
        clock = ~clock;//flanco de bajada
        #100

        
        btnBB = 1'b0;
        sw = {2'b0,ADD};
        btnOP1 = 1'b1;
        #100
        clock = ~clock; //flanco de subida
        #100
        clock = ~clock; //flanco de bajada

        
         sw = {2'b0,SUB};
        btnOP1 = 1'b1;
        #100
        clock = ~clock; //flanco de subida
        #100
        clock = ~clock; //flanco de bajada

        sw = {2'b0,AND};
        btnOP1 = 1'b1;
        #100
        clock = ~clock; //flanco de subida
        #100
        clock = ~clock; //flanco de bajada
        
        sw = {2'b0,OR};
        btnOP1 = 1'b1;
        #100
        clock = ~clock; //flanco de subida
        #100
        clock = ~clock; //flanco de bajada
        
        sw = {2'b0,XOR};
        btnOP1 = 1'b1;
        #100
        clock = ~clock; //flanco de subida
        #100
        clock = ~clock; //flanco de bajada
        
        sw = {2'b0,SRA};
        btnOP1 = 1'b1;
        #100
        clock = ~clock; //flanco de subida
        #100
        clock = ~clock; //flanco de bajada
        
        sw = {2'b0,SRL};
        btnOP1 = 1'b1;
        #100
        clock = ~clock; //flanco de subida
        #100
        clock = ~clock; //flanco de bajada
        
        sw = {2'b0,NOR};
        btnOP1 = 1'b1;
        #100
        clock = ~clock; //flanco de subida
        #100
        clock = ~clock; //flanco de bajada
    end

endmodule
