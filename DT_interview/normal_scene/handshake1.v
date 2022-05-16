module handshake1#(parameter WIDTH = 32)
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
		flag <= 0;
	end else begin
		flag <= 1;
	end
end

endmodule