`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: FCEFyN - UNC
// Engineer: Aichino Ignacio - Gabriel Vignolo
// 
// Design Name: ALU 
// Module Name: alu
// Project Name: TP1
// Target Devices: Basys3
// Description: 
// 
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
    localparam MY_SIZE_TB = 8;
    reg [(MY_SIZE_TB-1):0] sw;
    reg btnAA ;
    reg btnBB ;
    reg btnOP1 ;
    reg  [5:0] op;
    wire  signed [8:0]  res;
    wire  carry;
    reg clock;
   // reg i_reset;
    
    top #(MY_SIZE_TB)ex1 (sw,btnAA, btnBB, btnOP1, clock);
     
    
    
    initial
    begin
        clock = 1'b1;
        //i_reset = 1'b1;
        #100
        //i_reset = 1'b0;
        clock = ~clock; //flanco de bajada

        sw = 8'b11111111;
        btnBB = 1'b0;
        btnOP1 = 1'b0;
        btnAA = 1'b1;
        
        #100
        clock = ~clock; //flanco de subida
        
        #100
        clock = ~clock; //flanco de bajada

        sw = 8'b11111111;
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
        
        #100
        clock = ~clock;
        #100
        clock = ~clock;

    end

endmodule
