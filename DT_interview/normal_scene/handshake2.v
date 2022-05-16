module handshake2#(parameter WIDTH = 32)
(
	input					clk, 
	input					rstn,
   
	input					valid_i,				//	from master
	output					ready_o,				//	to master

	output	reg				valid_o,				//	to slave
	input					ready_i,				//	from slave
   
	input		[WIDTH-1:0]	data_i,					//	from master	
	output	reg	[WIDTH-1:0]	data_o					//	to slave
);

assign ready_o = ready_i;

always @(posedge clk or negedge rstn) begin
	if(!rstn) begin
		valid_o <= 0;
		data_o <= 0;
	end else begin
		if(valid_i && ready_o) begin
			valid_o <= 1;
			data_o <= data_i;
		end else begin
			valid_o <= 0;
			data_o <= 0;
		end
	end
end

endmodule