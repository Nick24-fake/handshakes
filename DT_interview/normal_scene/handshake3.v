module handshake3#(parameter WIDTH = 32)
(
	input					clk, 
	input					rstn,
   
	input					valid_i,				//	from master
	output	reg				ready_o,				//	to master

	output					valid_o,				//	to slave
	input					ready_i,				//	from slave
   
	input		[WIDTH-1:0]	data_i,					//	from master	
	output	reg	[WIDTH-1:0]	data_o					//	to slave
);

assign valid_o = valid_i;

always @(posedge clk or negedge rstn) begin
	if(!rstn)
		data_o <= 0;
	else begin
		if(valid_i && ready_o)
			data_o <= data_i;
		else
			data_o <= 0;
	end
end

always @(posedge clk or negedge rstn) begin
	if(!rstn)
		ready_o <= 0;
	else begin
		if(valid_o && ready_i)
			ready_o <= 1;
		else
			ready_o <= 0;
	end
end

endmodule