module   rca4 (input  logic [3:0] a, b, input logic cin, output logic [4:0] sum);
    logic [2:0] cout;
   
    silly fa1(a[0], b[0], cin, sum[0], cout[0]);
    silly fa2(a[1], b[1], cout[0], sum[1], cout[1]);
    silly fa3(a[2], b[2], cout[1], sum[2], cout[2]);
    silly fa4(a[3], b[3], cout[2], sum[3], sum[4]);
   
endmodule
