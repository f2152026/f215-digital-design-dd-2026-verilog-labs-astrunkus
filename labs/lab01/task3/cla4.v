// cla4.v
// Gate-level 4-bit carry-lookahead adder, matching the lecture circuit.
// Every gate needs an explicit delay (constant is fine here, e.g. #(2)) --
// this is the default from Task 2 onward, not a special step.
//
// TODO -- Step 1: generate/propagate signals (one xor + one and per bit)
//   p[i] = a[i] ^ b[i]
//   g[i] = a[i] & b[i]
//
// TODO -- Step 2: direct (non-recursive) carry equations. Verilog's and/or
// primitives accept more than 2 inputs directly, e.g.:
//   and #(2) (t2, p1, p0, g0);
// so you do not need to manually chain 2-input gates.
//   c1 = g0 + p0.cin
//   c2 = g1 + p1.g0 + p1.p0.cin
//   c3 = g2 + p2.g1 + p2.p1.g0 + p2.p1.p0.cin
//   c4 = g3 + p3.g2 + p3.p2.g1 + p3.p2.p1.g0 + p3.p2.p1.p0.cin
//
// TODO -- Step 3: sum bits
//   sum[i] = p[i] ^ c[i]     (c0 = cin)

module cla4(
  input  [3:0] a,
  input  [3:0] b,
  input        cin,
  output [3:0] sum,
  output       cout
);

  wire p0, p1, p2, p3;
  wire g0, g1, g2, g3;
  wire c1, c2, c3;
  wire c4;
  wire c1p, c2p, c2pp, c3p, c3pp, c3ppp;
  wire c4p, c4pp, c4ppp, c4pppp;

  xor #(2) p0_gate(p0, a[0], b[0]);
  xor #(2) p1_gate(p1, a[1], b[1]);
  xor #(2) p2_gate(p2, a[2], b[2]);
  xor #(2) p3_gate(p3, a[3], b[3]);
  and #(2) g0_gate(g0, a[0], b[0]);
  and #(2) g1_gate(g1, a[1], b[1]);
  and #(2) g2_gate(g2, a[2], b[2]);
  and #(2) g3_gate(g3, a[3], b[3]);

  and #(2) c1_product(c1p, p0, cin);
  or  #(2) c1_gate(c1, g0, c1p);

  and #(2) c2_product0(c2p, p1, g0);
  and #(2) c2_product1(c2pp, p1, p0, cin);
  or  #(2) c2_gate(c2, g1, c2p, c2pp);

  and #(2) c3_product0(c3p, p2, g1);
  and #(2) c3_product1(c3pp, p2, p1, g0);
  and #(2) c3_product2(c3ppp, p2, p1, p0, cin);
  or  #(2) c3_gate(c3, g2, c3p, c3pp, c3ppp);

  and #(2) c4_product0(c4p, p3, g2);
  and #(2) c4_product1(c4pp, p3, p2, g1);
  and #(2) c4_product2(c4ppp, p3, p2, p1, g0);
  and #(2) c4_product3(c4pppp, p3, p2, p1, p0, cin);
  or  #(2) c4_gate(c4, g3, c4p, c4pp, c4ppp, c4pppp);

  xor #(2) sum0(sum[0], p0, cin);
  xor #(2) sum1(sum[1], p1, c1);
  xor #(2) sum2(sum[2], p2, c2);
  xor #(2) sum3(sum[3], p3, c3);
  assign #(2) cout = c4;

endmodule
