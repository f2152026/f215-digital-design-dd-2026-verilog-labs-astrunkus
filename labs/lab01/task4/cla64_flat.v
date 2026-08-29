// cla64_flat.v
// Arithmetic dataflow version of the 64-bit lookahead interface.

module cla64_flat(
  input  [63:0] a,
  input  [63:0] b,
  input         cin,
  output [63:0] sum,
  output        cout
);
  wire [64:0] result;

  function automatic [64:0] add_words;
    input [63:0] lhs;
    input [63:0] rhs;
    input        carry_in;
    begin
      add_words = {1'b0, lhs} + {1'b0, rhs} + carry_in;
    end
  endfunction

  assign #(2) result = add_words(a, b, cin);
  assign #(2) sum = result[63:0];
  assign #(2) cout = result[64];
endmodule
