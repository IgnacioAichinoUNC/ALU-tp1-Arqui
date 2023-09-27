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


module alu
    #(
    //parameter
    parameter          NB_DATA     = 8
    )
    (
    //inputs
    input  wire        [NB_DATA - 1:0]                      dato_a,
    input  wire        [NB_DATA - 1:0]                      dato_b,
    input  wire        [NB_DATA - 3:0]                          op,
    
    //outputs
    output wire        [NB_DATA - 1:0]                         o_res,
    output wire                                                o_carry
    );
    
    localparam ADD = 6'b100000;
    localparam SUB = 6'b100010;
    localparam AND = 6'b100100;
    localparam OR  = 6'b100101;
    localparam XOR = 6'b100110;
    localparam SRA = 6'b000011;
    localparam SRL = 6'b000010;
    localparam NOR = 6'b100111;

    reg carry;
    reg signed [NB_DATA : 0] aluResult;
    assign o_res = aluResult;
    assign o_carry = carry;
         
    always @(*) begin
        case (op)
        ADD: begin
                aluResult = dato_a + dato_b; //ADD
                carry = aluResult[NB_DATA];
             end
        SUB: begin
                aluResult = dato_a - dato_b; //SUB
                carry = aluResult[NB_DATA];
             end
        AND: begin
                aluResult = dato_a & dato_b; //AND
                carry = 1'b0;
             end
        OR : begin
                aluResult = dato_a | dato_b; //OR
                carry = 1'b0;
             end
        XOR: begin
                aluResult = dato_a ^ dato_b; //XOR
                carry = 1'b0;
             end
        SRA: begin
                aluResult = dato_a >>> dato_b; //SRA
                carry = 1'b0;
             end
        SRL: begin
                aluResult = dato_a >> dato_b; //SRL
                carry = 1'b0;
             end
        NOR: begin
                aluResult = ~(dato_a | dato_b); //NOR
                carry = 1'b0;
             end
        default: begin
                    aluResult = {NB_DATA{1'b0}};
                    carry = 1'b0;
                 end
        endcase
    end
endmodule
