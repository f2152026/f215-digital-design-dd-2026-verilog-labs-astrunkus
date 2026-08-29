// Delay-annotated gate-level full adder reused by the 4-bit RCA.
module half_adder_v3(
  input  a,
  input  b,
  output sum,
  output carry
);
  xor #(2) make_sum(sum, a, b);
  and #(2) make_carry(carry, a, b);
endmodule

module FA_Gate(
  input a,
  input b,
  input cin,
  output sum,
  output cout
);
  wire partial, carry_ab, carry_in;

  half_adder_v3 h0 (.a(a), .b(b), .sum(partial), .carry(carry_ab));
  half_adder_v3 h1 (.a(partial), .b(cin), .sum(sum), .carry(carry_in));
  or #(2) join_carry(cout, carry_ab, carry_in);
endmodule
