module BCD_counter(Clock,Clear,enable,BCD0,BCD1,BCD2);
	input Clock;
	input Clear;
	input enable;
	output reg [3:0]BCD0, BCD1, BCD2;
	
	always @(posedge Clock)
	begin
		if(!Clear)
		begin
			BCD0 <= 0;
			BCD1 <= 0;
			BCD2 <= 0;
		end
		else if(enable == 1)
			if(BCD0  == 4'b1001)
			begin
				BCD0 <= 0;
				if(BCD1 == 4'b1001)
				begin
					BCD1 <= 0;
					if(BCD2 == 4'b1001)
					BCD2 <= 0;
					else
						BCD2 <= BCD2+1;
				end
				else
					BCD1 <= BCD1+1;
			end
			else
				BCD0<=BCD0+1;
	end
	
endmodule
				
