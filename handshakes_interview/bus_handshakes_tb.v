`timescale 1ns/1ns
`include"bus_handshakes.v"
module bus_handshakes_tb;
	parameter			w = 32;
	reg 				clk;
	reg 				rstn;
	reg 	[w-1:0]		data_i;
	
	reg					valid_i;
	reg					ready_i;
	wire				valid_o;
	wire				ready_o;
	wire	[w-1:0]		data_o;
	
	reg					valid_i_vf;
	reg					ready_i_vf;
	wire				valid_o_vf;
	wire				ready_o_vf;
	wire	[w-1:0]		data_o_vf;
	
	reg					valid_i_rf;
	reg					ready_i_rf;
	wire				valid_o_rf;
	wire				ready_o_rf;
	wire	[w-1:0]		data_o_rf;
	
	reg					valid_i_vrf;
	reg					ready_i_vrf;
	wire				valid_o_vrf;
	wire				ready_o_vrf;
	wire	[w-1:0]		data_o_vrf;
	
syn #(.WIDTH(w)) sy(
        clk,
        rstn,
        valid_i,
        ready_o,
        valid_o,
        ready_i,
		data_i,
        data_o
        );

valid_flop #(.WIDTH(w)) vf(
        clk,
        rstn,
        valid_i_vf,
        ready_o_vf,
        valid_o_vf,
        ready_i_vf,
		data_i,
        data_o_vf
        );

ready_flop #(.WIDTH(w)) vrf(
        clk,
        rstn,
        valid_i_rf,
        ready_o_rf,
        valid_o_rf,
        ready_i_rf,
		data_i,
        data_o_rf
        );
		
valid_ready_flop #(.WIDTH(w)) rf(
        clk,
        rstn,
        valid_i_vrf,
        ready_o_vrf,
        valid_o_vrf,
        ready_i_vrf,
		data_i,
        data_o_vrf
        );

    initial
        begin
        clk = 1;
        rstn = 0;
		data_i = 0;
		valid_i = 0;
		ready_i = 0;
		valid_i_vf = 0;
		ready_i_vf = 0;
		valid_i_rf = 0;
		ready_i_rf = 0;
		valid_i_vrf = 0;
		ready_i_vrf = 0;
		
		#5;
        rstn = 1;
		#1;
		#15;
		data_i = 6;
		valid_i = 1;
		ready_i = 1;
		valid_i_vf = 1;
		ready_i_vf = 1;
		valid_i_rf = 1;
		ready_i_rf = 1;
		valid_i_vrf = 1;
		ready_i_vrf = 1;
		#10;
		data_i = 16;
		#10;
		valid_i = 0;
		ready_i = 0;
		valid_i_vf = 0;
		ready_i_rf = 0;
//		#10;
		ready_i_vrf = 0;
		valid_i_vrf = 0;
		ready_i_vf = 0;
		valid_i_rf = 0;
		#19;
		rstn = 0;
		
/*		
		#5;
        rstn = 1;
		#1;
		#15;
		valid_i_vf = 1;
		ready_i_vf = 1;
		#10;
		valid_i_vf = 0;
		#10;
		ready_i_vf = 0;
		#19;
		rstn = 0;
*/		

/*		
		#5;
        rstn = 1;
		#1;
		#15;
		valid_i_rf = 1;
		ready_i_rf = 1;
		#10;
		ready_i_rf = 0;
		#10;
		valid_i_rf = 0;
		#19;
		rstn = 0;
*/

/*		
		#5;
        rstn = 1;
		#1;
		#15;
		valid_i_vrf = 1;
		ready_i_vrf = 1;
		#20;
		ready_i_vrf = 0;
		valid_i_vrf = 0;
		#19;
		rstn = 0;
*/			
		$stop;
        end
    always #(5) clk = ~clk;
//	always #(10) data_i = data_i + 1;
endmodule