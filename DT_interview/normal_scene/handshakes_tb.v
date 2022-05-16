`timescale 1ns/1ns
`include"handshake1.v"
`include"handshake2.v"
`include"handshake3.v"
`include"handshake4.v"
`include"bus_handshakes.v"
module handshakes_tb;
	parameter			w = 32;
	reg 				clk;
	reg 				rstn;
	reg					valid_i;
	
	wire				ready_o_1;
	wire				valid_o_1;
	wire				ready_o_2;
	wire				valid_o_2;
	wire				ready_o_3;
	wire				valid_o_3;
	wire				ready_o_4;
	wire				valid_o_4;
	wire				ready_o_fix;
	wire				valid_o_fix;
	
	reg					ready_i;
	reg 	[w-1:0]		data_i;
	
	wire	[w-1:0]		data_o_1;
	wire	[w-1:0]		data_o_2;
	wire	[w-1:0]		data_o_3;
	wire	[w-1:0]		data_o_4;
	wire	[w-1:0]		data_o_fix;

handshake1 #(.WIDTH(w)) ht1(
        clk,
        rstn,
        valid_i,
        ready_o_1,
        valid_o_1,
        ready_i,
		data_i,
        data_o_1
        );
handshake2 #(.WIDTH(w)) ht2(
        clk,
        rstn,
        valid_i,
        ready_o_2,
        valid_o_2,
        ready_i,
		data_i,
        data_o_2
        );
handshake3 #(.WIDTH(w)) ht3(
        clk,
        rstn,
        valid_i,
        ready_o_3,
        valid_o_3,
        ready_i,
		data_i,
        data_o_3
        );
handshake4 #(.WIDTH(w)) ht4(
        clk,
        rstn,
        valid_i,
        ready_o_4,
        valid_o_4,
        ready_i,
		data_i,
        data_o_4
        );
bus_handshakes #(.WIDTH(w)) ht_fix(
        clk,
        rstn,
        valid_i,
        ready_o_fix,
        valid_o_fix,
        ready_i,
		data_i,
        data_o_fix
        );
    initial
        begin
        clk = 1;
        rstn = 0;
		valid_i = 0;
		data_i = 0;
		ready_i = 0;
		
        #5;
        rstn = 1;
		#25;
		valid_i = 1;
		ready_i = 1;
		#40; 
		valid_i = 0;
		ready_i = 0;
		#40;
		rstn = 0;
		
		$stop;
        end
    always #(5) clk = ~clk;
	always #(10) data_i = data_i + 1;
endmodule