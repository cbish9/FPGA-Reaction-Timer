module BCD_decoder(BCDin,led);
	input [3:0]BCDin;
	output reg [1:7]led;
	
	always @(BCDin)
		case(BCDin)   //abcdefg
			0:  led = 7'b0000001; //and O
			1:  led = 7'b1001111;
			2:  led = 7'b0010010;
			3:  led = 7'b0000110;
			4:  led = 7'b1001100;
			5:  led = 7'b0100100;
			6:  led = 7'b1100000;
			7:  led = 7'b0001111;
			8:  led = 7'b0000000;
			9:  led = 7'b0001100;
			10: led = 7'b0100001; //G
			11: led = 7'b0000000; //B
			12: led = 7'b1000001; //U
			13: led = 7'b0111000; //F
			14: led = 7'b0100100; //S
			15: led = 7'b1111111; //space
			default: led=7'b1111111;
		endcase

endmodule
			
			