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


module top#(
        parameter       NB_DATA = 8
    )
    (
         //inputs
    input  wire        [NB_DATA - 1:0]                      switches,
    input  wire                                             boton1,
    input  wire                                             boton2,
    input  wire                                             boton3,
    input  wire                                             i_clk,
   // input  wire                                             i_reset,
    
    //outputs
    output wire        [NB_DATA - 1:0]                        o_res,
    output wire                                               o_carry        
    );
    
   //variables locales
    reg     [NB_DATA-1 : 0]      datoA;
    reg     [NB_DATA-1 : 0]      datoB;
    reg     [NB_DATA-3 : 0]      operacion;
    
    wire    [NB_DATA-1 : 0]      aluA;
    wire    [NB_DATA-1 : 0]      aluB;
    wire    [NB_DATA-3 : 0]      aluOp;
    wire    [NB_DATA-1 : 0]      aluOut;
    wire                         aluCarry;
    
    assign aluA = datoA;
    assign aluB = datoB;
    assign aluOp = operacion;
    assign o_res = aluOut;
    assign o_carry = aluCarry;
    
    alu
	#(
    	.NB_DATA   	(NB_DATA)
	)
	u_alu
	(
    	.dato_a (aluA),
    	.dato_b (aluB),
    	.op     (aluOp),
    	.o_res  (aluOut),
    	.o_carry (aluCarry)
	);
	
	always@(posedge i_clk) begin: reset
           /* if(i_reset)begin
                datoA    <= {NB_DATA-1{1'b0}};
                datoB    <= {NB_DATA-1{1'b0}};
                operacion   <= {NB_DATA-3{1'b0}};
            end*/
            if(boton1)
                datoA <= switches;
            else if(boton2)
                datoB <= switches;
            else if(boton3) 
                operacion <= switches;
     end
   	 
endmodule
