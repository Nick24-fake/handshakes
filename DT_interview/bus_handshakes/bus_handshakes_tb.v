`timescale 1ns/1ns
`include"bus_handshakes.v"
module bus_handshakes_tb;
	parameter			w = 32;
	reg 				clk;
	reg 				rstn;
	reg					valid_i;
	wire				ready_o;
	wire				valid_o;
	reg					ready_i;
	reg 	[w-1:0]		data_i;
	wire	[w-1:0]		data_o;

bus_handshakes #(.WIDTH(w)) bh(
        clk,
        rstn,
        valid_i,
        ready_o,
        valid_o,
        ready_i,
		data_i,
        data_o
        );
    initial
        begin
        clk = 1;
        rstn = 0;
		valid_i = 0;
		data_i = 0;
		ready_i = 0;
		
		// syn
        #5;
        rstn = 1;
		#25;
		valid_i = 1;
		ready_i = 1;
		#40; 
		valid_i = 0;
		ready_i = 0;
		#30;
		rstn = 0;
		
		// valid before ready
		#5;
        rstn = 1;
		#20;
		valid_i = 1;
		#5;
		ready_i = 1;
		#35;
		valid_i = 0;
		#5;
		ready_i = 0;
		#30;
		rstn = 0;
		
		// ready before valid
		#5;
        rstn = 1;
		#20;
		ready_i = 1;
		#5;
		valid_i = 1;
		#35;
		ready_i = 0;
		#5;
		valid_i = 0;
		#30;
		rstn = 0;
		
		// all before
		#5;
        rstn = 1;
		#20;
		valid_i = 1;
		ready_i = 1;
		#40;
		valid_i = 0;
		ready_i = 0;
		#35;
		rstn = 0;
		
		// valid time not enough
		#5;
        rstn = 1;
		#15;
		ready_i = 1;
		#5;
		valid_i = 1;
		#35;
		ready_i = 0;
		#5;
		valid_i = 0;
		#35;
		rstn = 0;
		
		// ready time not enough
		#5;
        rstn = 1;
		#15;
		valid_i = 1;
		#5;
		ready_i = 1;
		#35;
		valid_i = 0;
		#5;
		ready_i = 0;
		#35;
		rstn = 0;
		
		// all time not enough
		#5;
        rstn = 1;
		#20;
		valid_i = 1;
		ready_i = 1;
		#40;
		valid_i = 0;
		ready_i = 0;
		#35;
		rstn = 0;
		
		$stop;
        end
    always #(5) clk = ~clk;
	always #(10) data_i = data_i + 1;
endmodule