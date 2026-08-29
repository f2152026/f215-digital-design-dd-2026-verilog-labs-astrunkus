// FA_Gate.v
// Gate-level model of a 1-bit full adder. No delays yet -- that starts in
// Task 2. This task is purely about gate ordering.
//
// Part (a): leave this file exactly as it is, compile, and simulate.
// Part (b): AFTER completing part (a), come back and reorder the five gate
//           instantiations below into any different sequence, then
//           re-simulate with the same tb.v and compare.

module half_adder_v3(
  input  a,
  input  b,
  output sum,
  output carry
);
  assign sum = a ^ b;
  assign carry = a & b;
endmodule

module FA_Gate(
  input  a,
  input  b,
  input  cin,
  output sum,
  output cout
);
  wire first_sum, first_carry, second_carry;

  half_adder_v3 first (.a(a), .b(b), .sum(first_sum), .carry(first_carry));
  half_adder_v3 second (.a(first_sum), .b(cin), .sum(sum), .carry(second_carry));
  assign cout = first_carry | second_carry;

endmodule
