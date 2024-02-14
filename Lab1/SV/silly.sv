module silly(input logic a, b, c, output logic sum ,cout);

  assign cout = (~a & b & c) | (a & ~b & c) | (a & b & ~c) | (a & b & c);
  assign sum = (~a & ~b & c) | (~a & b & ~c) | (a & ~b & ~c) | (a & b & c);

endmodule
