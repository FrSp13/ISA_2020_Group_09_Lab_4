module DUT(dut_if.port_in in_inter, dut_if.port_out out_inter, output enum logic [1:0] {INITIAL,WAIT,SEND} state);
    
	FPmul FPmul_under_test(.FP_A(in_inter.A),.FP_B(in_inter.B),.FP_Z(out_inter.data), .clk(in_inter.clk));

	bit pipe_0, pipe_1, pipe_2, pipe_3, pipe_4, pipe_5, pipe_6;
	bit [31:0] A0, A1, A2, A3, A4, A5, A6;
	bit [31:0] B0, B1, B2, B3, B4, B5, B6;
	
    always_ff @(posedge in_inter.clk)
    begin
        if(in_inter.rst) begin
            in_inter.ready <= 0;
            out_inter.data <= 'x;
            out_inter.valid <= 0;
			pipe_0 <= 1;
			pipe_1 <= 0;
			pipe_2 <= 0;
			pipe_3 <= 0;
			pipe_4 <= 0;
			pipe_5 <= 0;
			pipe_6 <= 0;
			A0 <= 00000000000000000000000000000000;
			A1 <= 00000000000000000000000000000000;
			A2 <= 00000000000000000000000000000000;
			A3 <= 00000000000000000000000000000000;
			A4 <= 00000000000000000000000000000000;
			A5 <= 00000000000000000000000000000000;
			A6 <= 00000000000000000000000000000000;
			B0 <= 00000000000000000000000000000000;
			B1 <= 00000000000000000000000000000000;
			B2 <= 00000000000000000000000000000000;
			B3 <= 00000000000000000000000000000000;
			B4 <= 00000000000000000000000000000000;
			B5 <= 00000000000000000000000000000000;
			B6 <= 00000000000000000000000000000000;
            state <= INITIAL;
        end
        else case(state)
            INITIAL: begin
                in_inter.ready <= 1;
                state <= WAIT;
            end
            
            WAIT: begin
                if(in_inter.valid) begin
                    //out_inter.data <= in_inter.A * in_inter.B;
					in_inter.ready <= 0;

					pipe_0 <= 0;

					pipe_1 <= pipe_0;
					A1 <= in_inter.A;
					B1 <= in_inter.B;
				
					pipe_2 <= pipe_1;
					A2 <= A1;
					B2 <= B1;
				
					pipe_3 <= pipe_2;
					A3 <= A2;
					B3 <= B2;
				
					pipe_4 <= pipe_3;
					A4 <= A3;
					B4 <= B3;
				
					pipe_5 <= pipe_4;
					A5 <= A4;
					B5 <= B4;
					
					pipe_6 <= pipe_5;
					A6 <= A5;
					B6 <= B5;

					
					if(pipe_5) begin 
						$display("FPmul: input FP_A = %.10f, input FP_B = %.10f, output FP_Z = %.10f",$bitstoshortreal(A6),$bitstoshortreal(B6),$bitstoshortreal(out_inter.data));
						$display("FPmul: input FP_A = %b, input FP_B = %b, output FP_Z = %b",A6,B6,out_inter.data);
						state <= SEND;
						out_inter.valid <= 1;
					end

                end
         	end
                
            SEND: begin
                if(out_inter.ready) begin
                    out_inter.valid <= 0;
                    in_inter.ready <= 1;
                    state <= WAIT;
					pipe_0 <= 1;
                end
            end
        endcase
    end
endmodule: DUT
