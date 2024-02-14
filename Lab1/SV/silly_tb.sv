`timescale 1ns / 1ps
module tb ();

   logic    [3:0] a, b;
   logic 	cin;
   logic 	[4:0]sum;
   logic	[4:0]sum_correct;
   logic        clk;   
   
   logic [31:0] errors;
   logic [31:0] vectornum;

   integer handle3;
   integer desc3;
   integer i,j,k;

  // instantiate device under test
   rca4 dut (a, b, cin, sum);
   assign sum_correct = a + b + cin;
 ////////////////////////////////////////////////////////////////////
   // 20 ns clock
   initial 
     begin	
	clk = 1'b1;
	forever #5 clk = ~clk;
     end


   initial 
   begin
	handle3 = $fopen("rca4.out");
	vectornum = 0;
	errors = 0;
	desc3 = handle3;
     end

	initial 
	begin

		for(j=0; j<150; j=j+1)
		begin
				@(posedge clk)
					begin
						a = $random;
						b = $random;
						cin = $random;
					end
				@(negedge clk)
					begin
						vectornum = vectornum +1;
						if (sum != sum_correct)
							begin
								errors = errors + 1;
								$display("Error: %h %h || %h != %h", a, b, sum, sum_correct);
							end
						#0 $fdisplay(desc3, "%b %b %b || %b || %b || %b", a, b, cin, sum, sum_correct, (sum==sum_correct));
					end
		end
	$display("%d tests completed with %d errors", vectornum, errors);
	$finish;
	end	
endmodule
