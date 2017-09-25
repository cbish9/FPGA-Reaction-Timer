module Project2_top(start,reset,board_clk,hs_switch,gb_switch,LED,ss0,ss1,ss2,ss3,ss4,ss5,decimal_pt);
	input start;  				//Start button
	input reset;  				//Reset button
	input board_clk;
	input hs_switch;			//High Score Switch
	input gb_switch;
	
	wire clk;               //clk at 1kHz
	wire clk_gb;				//clk for gobuffs scroll
	wire start_db;          //Debounced Start Button
	wire reset_db;				//Debounced Reset Button
	wire [12:0]lsrf_out;
	wire [12:0]countdown;   //Wire from down_counter to FSM
	wire en_dc;					//FSM enable to down_counter
	wire en_c;					//FSM enable to BCD counter
	wire done;
	wire [3:0]BCD0;
	wire [3:0]BCD1;
	wire [3:0]BCD2;
	wire [11:0]score = {BCD2,BCD1,BCD0};
	wire [23:0]gb = {BCDgb5,BCDgb4,BCDgb3,BCDgb2,BCDgb1,BCDgb0};
	reg [11:0]highscore;
	reg [23:0]dispscore;
	reg [23:12]ones = 12'b111111111111;

	wire [3:0]BCDgb0;  		//Outputs from Go buffs
	wire [3:0]BCDgb1;
	wire [3:0]BCDgb2;
	wire [3:0]BCDgb3;
	wire [3:0]BCDgb4;
	wire [3:0]BCDgb5;
	
	output wire [9:0]LED;   //LED strip
	
	output wire [1:7]ss0;	//Output to seven seg 0
	output wire [1:7]ss1;	//Output to seven seg 1
	output wire [1:7]ss2;	//Output to seven seg 2
	output wire [1:7]ss3;	//Output to seven seg 3
	output wire [1:7]ss4;	//Output to seven seg 4
	output wire [1:7]ss5;	//Output to seven seg 5
	
	output wire decimal_pt = decimal_pt_temp;	//Output to turn on decimal point
	
	reg decimal_pt_temp = 0;
				 
	initial
		begin
		highscore = 12'b100110011001;
		end
	
	Clock_divider M1(board_clk,clk);
	
	debouncer M2(board_clk,start,start_db);
	debouncer M3(board_clk,reset,reset_db);
	
	LSRF M4(clk,lsrf_out);
	
	down_counter M5(lsrf_out,en_dc,clk,countdown);
	
	FSM M6(board_clk,start_db,reset_db,countdown,LED,en_dc,en_c,done); //highscore,
	
	BCD_counter M7(clk,reset_db,en_c,BCD0,BCD1,BCD2);
	
	Clock_dividergobuffs clkgb(clk,clk_gb);
	
	Gobuffs Mgb(clk_gb,BCDgb0,BCDgb1,BCDgb2,BCDgb3,BCDgb4,BCDgb5);
	
	always@(negedge done)
	begin
		if(score < highscore) begin
			highscore = score;
		end
	end
	
	always@(*) //Switch between highscore and score and gobuffs
	begin
		if(hs_switch == 0 & gb_switch == 0) begin
			dispscore[23:12] = ones;
			dispscore[11:0] = score;
			decimal_pt_temp = 0;			//Turn decimal on
		end else if(hs_switch == 0 & gb_switch == 1)  begin
			dispscore[23:0] = gb;
			decimal_pt_temp = 1;			//Turn decimal off
		end else begin
			dispscore[23:12] = ones;
			dispscore[11:0] = highscore;
			decimal_pt_temp = 0;			//Turn decimal on
	end
	end
	
	BCD_decoder M8(dispscore[3:0],ss0);
	BCD_decoder M9(dispscore[7:4],ss1);
	BCD_decoder M10(dispscore[11:8],ss2);
	BCD_decoder M11(dispscore[15:12],ss3);
	BCD_decoder M12(dispscore[19:16],ss4);
	BCD_decoder M13(dispscore[23:20],ss5);
	
endmodule
