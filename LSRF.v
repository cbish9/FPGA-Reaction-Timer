module LSRF(clk,lsrf_out);
	input clk;
	output reg [12:0] lsrf_out = 1111111111111;
	
	wire feedback = lsrf_out[9];
	
	always @(posedge clk)
	begin
		lsrf_out[0] <= feedback;
		lsrf_out[1] <= lsrf_out[0];
		lsrf_out[2] <= lsrf_out[1];
		lsrf_out[3] <= lsrf_out[2] ^ feedback;
		lsrf_out[4] <= lsrf_out[3] ^ feedback;
		lsrf_out[5] <= lsrf_out[4];
		lsrf_out[6] <= lsrf_out[5];
		lsrf_out[7] <= lsrf_out[6] ^ feedback;
		lsrf_out[8] <= lsrf_out[7];
		lsrf_out[9] <= lsrf_out[8];
		lsrf_out[10] <= lsrf_out[9]^ feedback;
		lsrf_out[11] <= lsrf_out[10];
		lsrf_out[12] <= lsrf_out[11];
		
	end
endmodule
