module FSM(clk,Start,Reset,countdown,LED,en_dc,en_c,done); //,highscore
	input clk;
	input Start;
	input Reset;
	input [11:0]countdown;
	//input [11:0]score; 
	//input [3:0]BCD0;
	//input [3:0]BCD1;
	//input [3:0]BCD2;
	//output reg [11:0]highscore = 12'b100110011001;
	output reg [9:0]LED = 10'b0000000000;
	output reg en_dc = 1'b0;
	output reg en_c = 1'b0;
	output reg done = 1'b0;
	reg [2:0]state;
	reg [2:0]nextState;
	
	
	parameter    idle	 = 0,  //Waiting for input
					 random = 1,  //Gets random number from LSRF and begins
					 timing = 2,  //LED turns on, timing begins
					 finalstate  = 3;  //LED turns off and score is displayed
	
	always@(negedge Start, negedge Reset)
		begin
			case (state)
				random : begin
							en_dc = 1'b1;  //Need countdown enabled
							en_c = 1'b0;
							end
				timing : begin
							en_c  = 1'b1;  //Need BCD counter enabled
							end
				finalstate: begin
							en_c = 1'b0;
							done = 1'b1;   //Stop signal to compare scores
							end
				default :begin
							done = 1'b0;
							en_c = 1'b0;
							en_dc = 1'b0;
							end
			endcase
		end
	
	
	always@(posedge clk)
		begin
		state <= nextState;
		end
		     
	always@(negedge Start, negedge Reset)
		begin
		case(state)
			idle: if(!Start)
					begin	nextState = random;
							LED = 10'b0000000000;
					end
					else
					begin nextState = idle;
							LED = 10'b0000000000;
					end
			random: if(countdown == 0)
					  begin nextState = timing;
							  LED = 10'b1111111111;
					  end
					  else if(!Start)
					  begin nextState = random;
							  LED = 10'b0000000000;
					  end
			timing:
				if(!Start) begin
						nextState = finalstate;
						LED = 10'b0000000000;
					end //else begin
						//nextState = finalstate;
						//LED = 10'b0000000000;
						//end
					  
				else
					begin nextState = timing;
							LED = 10'b1111111111;
					end
					
			finalstate: nextState = finalstate;
		endcase
		
		if(!Reset)
		begin
			nextState = idle;
		end
	end
	
endmodule
					  
						
	
			