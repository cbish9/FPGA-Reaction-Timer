module down_counter(lsrf_out,enable,clk,countdown);
	input [12:0]lsrf_out;
	input enable;
	input clk;	
	output reg [12:0]countdown;
	
	always @(posedge clk)
	begin
		if (enable == 0) begin
			countdown <= lsrf_out;
			end
		else if (enable == 1) begin
			if (countdown > 0);
				countdown <= countdown - 1;
			end
	end
		
endmodule
				