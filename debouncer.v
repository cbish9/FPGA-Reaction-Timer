module debouncer(clk50M,pressed,pressed_state);
	input clk50M;//50 MHz clock input, from PIN_P11
	input pressed;//signal from the button
	output reg pressed_state;//output the pressed_state

	reg PB_sync_0;
	reg PB_sync_1;

	always @(posedge clk50M) PB_sync_0 <= pressed;
	always @(posedge clk50M) PB_sync_1 <= PB_sync_0;

	reg[15:0] count;//make count larger if button still bounce, also need to change line 21 to the max

	always @(posedge clk50M)
		if(pressed_state == PB_sync_1)
			count <= 0;
		else 
			begin
				count <= count + 1'b1;
				if(count == 16'hffff) pressed_state <= ~pressed_state;
			end

endmodule

//Thanks to the source https://www.eecs.umich.edu/courses/eecs270/270lab/270_docs/debounce.html