module Clock_dividergobuffs(board_clk,clk);
	input board_clk;
	output reg clk = 0;
 
	parameter sys_clk = 1000;				     	    //Board Clock frequency (Hz)
	parameter out_clk = 4;   						    //Desired Clock frequency (Hz)
	parameter maxcount = sys_clk/ (2*out_clk); 		 //Counter size
	parameter n = 15; 								       //Bit size reg for counter
	
	reg [n:0] counter_reg = 0;
	
	always @(posedge board_clk)
	begin
		if (counter_reg < maxcount-1)
			begin
			counter_reg <= counter_reg + 1;
			end
		else
			begin
			counter_reg <= 0;
			clk <= ~clk;
			end
	end
endmodule
