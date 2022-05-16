//valid_flop
module valid_flop#(parameter WIDTH = 32)
(
	input					clk, 
	input					rstn,
   
	input					valid_i,				//	from master
	output					ready_o,				//	to master

	output					valid_o,				//	to slave
	input					ready_i,				//	from slave
   
	input		[WIDTH-1:0]	data_i,					//	from master	
	output	reg	[WIDTH-1:0]	data_o					//	to slave
);

reg			valid_r;

always @(posedge clk or negedge rstn)begin
	if(!rstn)begin
		#1 valid_r <= 0;
	end else if(valid_i) begin
		#1 valid_r <= 1;
	end else if(ready_i) begin
		#1 valid_r <= 0;
	end
end

always @(posedge clk or negedge rstn)begin
	if(!rstn)begin
		#1 data_o <= 0;
	end else if(valid_i & ready_o)begin
		#1 data_o <= data_i;
	end
end

assign valid_o = valid_r;
assign ready_o = !valid_r | ready_i;		

endmodule

//ready_flop
module ready_flop#(parameter WIDTH = 32)
(
	input					clk, 
	input					rstn,
   
	input					valid_i,				//	from master
	output					ready_o,				//	to master

	output	 				valid_o,				//	to slave
	input					ready_i,				//	from slave
   
	input		[WIDTH-1:0]	data_i,					//	from master	
	output		[WIDTH-1:0]	data_o					//	to slave
);

reg				ready_rn;
reg	[WIDTH-1:0]	data;

always @(posedge clk or negedge rstn)begin
	if(!rstn)begin
		#1 ready_rn <= 0;
	end else if(ready_i) begin
		#1 ready_rn <= 0;
	end else if(valid_i) begin
		#1 ready_rn <= 1;
	end
end

always @(posedge clk or negedge rstn)begin
	if(!rstn)begin
		#1 data <= 0;
	end else if(valid_i & ready_o)begin
		#1 data <= data_i;
	end
end

//assign data_o = ready_rn ? data : data_i;
assign data_o = data;
assign ready_o = !ready_rn;		
assign valid_o = ready_rn | valid_i;

endmodule

//valid_ready_flop
module valid_ready_flop#(parameter WIDTH = 32)
(
	input					clk, 
	input					rstn,
   
	input					valid_i,				//	from master
	output					ready_o,				//	to master

	output	 				valid_o,				//	to slave
	input					ready_i,				//	from slave
   
	input		[WIDTH-1:0]	data_i,					//	from master	
	output		[WIDTH-1:0]	data_o					//	to slave
);

wire				valid_o_1;
wire				ready_o_1;
wire	[WIDTH-1:0]	data_o_1;

ready_flop rf1(
        clk,
        rstn,
        valid_i,
        ready_o_1,
        valid_o_1,
        ready_i,
		data_i,
        data_o_1
        );
valid_flop vf2(
        clk,
        rstn,
        valid_o_1,
        ready_o,
        valid_o,
        ready_o_1,
		data_o_1,
        data_o
        );
endmodule

//syn
module syn#(parameter WIDTH = 32)
(
	input					clk, 
	input					rstn,
   
	input					valid_i,				//	from master
	output					ready_o,				//	to master

	output					valid_o,				//	to slave
	input					ready_i,				//	from slave
   
	input		[WIDTH-1:0]	data_i,					//	from master	
	output		[WIDTH-1:0]	data_o					//	to slave
);
reg	flag;
assign valid_o = valid_i;
assign ready_o = ready_i;
assign data_o = flag ? data_i : 0;

always @(posedge clk or negedge rstn) begin
	if(!rstn) begin
		#1 flag <= 0;
	end else begin
		#1 flag <= 1;
	end
end

endmodule