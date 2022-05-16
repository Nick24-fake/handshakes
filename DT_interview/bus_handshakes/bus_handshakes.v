module bus_handshakes#(parameter WIDTH = 32)
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
//reg			valid_o;

always @(posedge clk or negedge rstn)begin
	if(!rstn)begin
		valid_o <= 0;
		data_o <= 0;
	end else if(ready_o) begin
		if(valid_i) begin						//	valid_i high, ready_o high, data_o == data_i
			valid_o <= 1;
			data_o <= data_i;
		end else begin							//	valid_i low, ready_o high, data_o hold
			valid_o <= 0;
			data_o <= data_o;
		end
	end else begin								//	data_o hold
		valid_o <= valid_o;
		data_o <= data_o;
	end
end

//assign valid_o = valid_r;
assign ready_o = ~valid_o | ready_i;			//	valid_o high, ready_i low, then ready_o low

endmodule