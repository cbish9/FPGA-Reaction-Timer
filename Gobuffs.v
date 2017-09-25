module Gobuffs(clk,BCDgb0,BCDgb1,BCDgb2,BCDgb3,BCDgb4,BCDgb5);
	input clk;
	//input enable;
	reg state;
	output reg [3:0]BCDgb0;
	output reg [3:0]BCDgb1;
	output reg [3:0]BCDgb2;
	output reg [3:0]BCDgb3;
	output reg [3:0]BCDgb4;
	output reg [3:0]BCDgb5;
	reg [3:0]displaystate;

	initial displaystate = 0;
	
	reg enable = 1;
	
always@(posedge clk)
if(enable ==1) begin
	displaystate = displaystate +1;
end
	
always@(displaystate)
	begin
		case (displaystate)
		0: begin
			BCDgb0 = 10; //G
			BCDgb1 = 15; //
			BCDgb2 = 15; //
			BCDgb3 = 15; //
			BCDgb4 = 15; //
			BCDgb5 = 15; //
			end
			
		1: begin
			BCDgb0 = 0;  //0
			BCDgb1 = 10; //G
			BCDgb2 = 15; //
			BCDgb3 = 15; //
			BCDgb4 = 15; //
			BCDgb5 = 15; //
			end
			
		2: begin
			BCDgb0 = 15; //
			BCDgb1 = 0;  //0
			BCDgb2 = 10; //G
			BCDgb3 = 15; //
			BCDgb4 = 15; //
			BCDgb5 = 15; //
			end
			
		3: begin
			BCDgb0 = 11; //B
			BCDgb1 = 15; //
			BCDgb2 = 0;  //0
			BCDgb3 = 10; //G
			BCDgb4 = 15; //
			BCDgb5 = 15; //
			end
			
		4: begin
			BCDgb0 = 12; //U
			BCDgb1 = 11; //B
			BCDgb2 = 15; //
			BCDgb3 = 0;  //0
			BCDgb4 = 10; //G
			BCDgb5 = 15; //
			end
			
		5: begin
			BCDgb0 = 13; //F
			BCDgb1 = 12; //U
			BCDgb2 = 11; //B
			BCDgb3 = 15; //
			BCDgb4 = 0;  //0
			BCDgb5 = 10; //G
			end
			
		6: begin
			BCDgb0 = 13; //F
			BCDgb1 = 13; //F
			BCDgb2 = 12; //U
			BCDgb3 = 11; //B
			BCDgb4 = 15; //
			BCDgb5 = 0;  //0
			end
			
		7: begin
			BCDgb0 = 14; //S
			BCDgb1 = 13; //F
			BCDgb2 = 13; //F
			BCDgb3 = 12; //U
			BCDgb4 = 11; //B
			BCDgb5 = 15; //
			end
			
		8: begin
			BCDgb0 = 15; //
			BCDgb1 = 14; //S
			BCDgb2 = 13; //F
			BCDgb3 = 13; //F
			BCDgb4 = 12; //U
			BCDgb5 = 11; //B
			end
					
		9: begin
			BCDgb0 = 15; //
			BCDgb1 = 15; //
			BCDgb2 = 14; //S
			BCDgb3 = 13; //F
			BCDgb4 = 13; //F
			BCDgb5 = 12; //U
			end
						
		10:begin
			BCDgb0 = 15; //
			BCDgb1 = 15; //
			BCDgb2 = 15; //
			BCDgb3 = 14; //S
			BCDgb4 = 13; //F
			BCDgb5 = 13; //F
			end
			
		11:begin
			BCDgb0 = 15; //
			BCDgb1 = 15; //
			BCDgb2 = 15; //
			BCDgb3 = 15; //
			BCDgb4 = 14; //S
			BCDgb5 = 13; //F
			end
			
		12:begin
			BCDgb0 = 15; //
			BCDgb1 = 15; //
			BCDgb2 = 15; //
			BCDgb3 = 15; //
			BCDgb4 = 15; //
			BCDgb5 = 14; //S
			end

		13:begin
			BCDgb0 = 15; //
			BCDgb1 = 15; //
			BCDgb2 = 15; //
			BCDgb3 = 15; //
			BCDgb4 = 15; //
			BCDgb5 = 15; //
			end

		14:begin
			BCDgb0 = 15; //
			BCDgb1 = 15; //
			BCDgb2 = 15; //
			BCDgb3 = 15; //
			BCDgb4 = 15; //
			BCDgb5 = 15; //
			end
			
		15:begin
			BCDgb0 = 15; //
			BCDgb1 = 15; //
			BCDgb2 = 15; //
			BCDgb3 = 15; //
			BCDgb4 = 15; //
			BCDgb5 = 15; //
			end

	default: BCDgb0 = 15;
	endcase
end

endmodule
