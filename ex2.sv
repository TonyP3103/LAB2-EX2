module ex2 (
					input logic clk,rst,x,
					output logic out,
					output logic [3:0] currentstate);

	parameter [3:0] A = 4'b0000,
						 B = 4'b0001,
						 C = 4'b0010,
						 D = 4'b0011,
						 E = 4'b0100,
						 F = 4'b0101,
						 G = 4'b0110,
						 H = 4'b0111,
						 I = 4'b1000;
						 
						 
	logic [3:0] nextstate;
	
	always_ff @(posedge clk) begin
				if (rst) 
					currentstate <= A;
				else 
					currentstate <= nextstate;
				end
				
always_comb begin
	case (currentstate)
		A: if (x) nextstate <= F;
			else 	 nextstate <= B;
		
		B: if (x) nextstate <= F;
			else 	 nextstate <= C;
			
		C: if (x) nextstate <= F;
			else 	 nextstate <= D;
		
		D: if (x) nextstate <= F;
			else 	 nextstate <= E;
			
		E: if (x) nextstate <= F;
			else   nextstate <= E;

		F: if (x) nextstate <= G;
			else 	 nextstate <= B;
		
		G: if (x) nextstate <= H;
			else 	 nextstate <= B;
			
		H: if (x) nextstate <= I ;
			else 	 nextstate <= B;
		
		I: if (x) nextstate <= I;
			else 	 nextstate <= B;
	default nextstate <= currentstate;		
	endcase 
	end
	
	always_ff 
		if (currentstate == E| currentstate == I) 
		out = 1'b1;
		else 
		out = 1'b0;
	endmodule
	
					