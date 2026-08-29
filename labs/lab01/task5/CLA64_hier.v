// Hierarchical 64-bit carry-lookahead adder.
// Sixteen four-bit blocks expose block propagate/generate signals; the
// second level computes all block carry-ins with direct lookahead equations.

module cla64_hier(
  input  [63:0] a,
  input  [63:0] b,
  input         cin,
  output [63:0] sum,
  output        cout
);
  wire [15:0] block_p, block_g;
  wire [16:0] block_c;

  assign #(2) block_c[0] = cin;
  assign #(2) block_c[1] = block_g[0] | (block_p[0] & cin);
  assign #(2) block_c[2] = block_g[1] | (block_p[1] & block_g[0]) |
                          (block_p[1] & block_p[0] & cin);
  assign #(2) block_c[3] = block_g[2] | (block_p[2] & block_g[1]) |
                          (block_p[2] & block_p[1] & block_g[0]) |
                          (block_p[2] & block_p[1] & block_p[0] & cin);
  assign #(2) block_c[4] = block_g[3] | (block_p[3] & block_g[2]) |
                          (block_p[3] & block_p[2] & block_g[1]) |
                          (block_p[3] & block_p[2] & block_p[1] & block_g[0]) |
                          (block_p[3] & block_p[2] & block_p[1] & block_p[0] & cin);
  assign #(2) block_c[5] = block_g[4] | (block_p[4] & block_g[3]) |
                          (block_p[4] & block_p[3] & block_g[2]) |
                          (block_p[4] & block_p[3] & block_p[2] & block_g[1]) |
                          (block_p[4] & block_p[3] & block_p[2] & block_p[1] & block_g[0]) |
                          (block_p[4] & block_p[3] & block_p[2] & block_p[1] & block_p[0] & cin);
  assign #(2) block_c[6] = block_g[5] | (block_p[5] & block_g[4]) |
                          (block_p[5] & block_p[4] & block_g[3]) |
                          (block_p[5] & block_p[4] & block_p[3] & block_g[2]) |
                          (block_p[5] & block_p[4] & block_p[3] & block_p[2] & block_g[1]) |
                          (block_p[5] & block_p[4] & block_p[3] & block_p[2] & block_p[1] & block_g[0]) |
                          (block_p[5] & block_p[4] & block_p[3] & block_p[2] & block_p[1] & block_p[0] & cin);
  assign #(2) block_c[7] = block_g[6] | (block_p[6] & block_g[5]) |
                          (block_p[6] & block_p[5] & block_g[4]) |
                          (block_p[6] & block_p[5] & block_p[4] & block_g[3]) |
                          (block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_g[2]) |
                          (block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_p[2] & block_g[1]) |
                          (block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_p[2] & block_p[1] & block_g[0]) |
                          (block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_p[2] & block_p[1] & block_p[0] & cin);
  assign #(2) block_c[8] = block_g[7] | (block_p[7] & block_g[6]) |
                          (block_p[7] & block_p[6] & block_g[5]) |
                          (block_p[7] & block_p[6] & block_p[5] & block_g[4]) |
                          (block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_g[3]) |
                          (block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_g[2]) |
                          (block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_p[2] & block_g[1]) |
                          (block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_p[2] & block_p[1] & block_g[0]) |
                          (block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_p[2] & block_p[1] & block_p[0] & cin);
  assign #(2) block_c[9] = block_g[8] | (block_p[8] & block_g[7]) |
                          (block_p[8] & block_p[7] & block_g[6]) |
                          (block_p[8] & block_p[7] & block_p[6] & block_g[5]) |
                          (block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_g[4]) |
                          (block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_g[3]) |
                          (block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_g[2]) |
                          (block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_p[2] & block_g[1]) |
                          (block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_p[2] & block_p[1] & block_g[0]) |
                          (block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_p[2] & block_p[1] & block_p[0] & cin);
  assign #(2) block_c[10] = block_g[9] | (block_p[9] & block_g[8]) |
                           (block_p[9] & block_p[8] & block_g[7]) |
                           (block_p[9] & block_p[8] & block_p[7] & block_g[6]) |
                           (block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_g[5]) |
                           (block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_g[4]) |
                           (block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_g[3]) |
                           (block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_g[2]) |
                           (block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_p[2] & block_g[1]) |
                           (block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_p[2] & block_p[1] & block_g[0]) |
                           (block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_p[2] & block_p[1] & block_p[0] & cin);
  assign #(2) block_c[11] = block_g[10] | (block_p[10] & block_g[9]) |
                           (block_p[10] & block_p[9] & block_g[8]) |
                           (block_p[10] & block_p[9] & block_p[8] & block_g[7]) |
                           (block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_g[6]) |
                           (block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_g[5]) |
                           (block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_g[4]) |
                           (block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_g[3]) |
                           (block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_g[2]) |
                           (block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_p[2] & block_g[1]) |
                           (block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_p[2] & block_p[1] & block_g[0]) |
                           (block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_p[2] & block_p[1] & block_p[0] & cin);
  assign #(2) block_c[12] = block_g[11] | (block_p[11] & block_g[10]) |
                           (block_p[11] & block_p[10] & block_g[9]) |
                           (block_p[11] & block_p[10] & block_p[9] & block_g[8]) |
                           (block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_g[7]) |
                           (block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_g[6]) |
                           (block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_g[5]) |
                           (block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_g[4]) |
                           (block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_g[3]) |
                           (block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_g[2]) |
                           (block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_p[2] & block_g[1]) |
                           (block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_p[2] & block_p[1] & block_g[0]) |
                           (block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_p[2] & block_p[1] & block_p[0] & cin);
  assign #(2) block_c[13] = block_g[12] | (block_p[12] & block_g[11]) |
                           (block_p[12] & block_p[11] & block_g[10]) |
                           (block_p[12] & block_p[11] & block_p[10] & block_g[9]) |
                           (block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_g[8]) |
                           (block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_g[7]) |
                           (block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_g[6]) |
                           (block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_g[5]) |
                           (block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_g[4]) |
                           (block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_g[3]) |
                           (block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_g[2]) |
                           (block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_p[2] & block_g[1]) |
                           (block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_p[2] & block_p[1] & block_g[0]) |
                           (block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_p[2] & block_p[1] & block_p[0] & cin);
  assign #(2) block_c[14] = block_g[13] | (block_p[13] & block_g[12]) |
                           (block_p[13] & block_p[12] & block_g[11]) |
                           (block_p[13] & block_p[12] & block_p[11] & block_g[10]) |
                           (block_p[13] & block_p[12] & block_p[11] & block_p[10] & block_g[9]) |
                           (block_p[13] & block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_g[8]) |
                           (block_p[13] & block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_g[7]) |
                           (block_p[13] & block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_g[6]) |
                           (block_p[13] & block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_g[5]) |
                           (block_p[13] & block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_g[4]) |
                           (block_p[13] & block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_g[3]) |
                           (block_p[13] & block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_g[2]) |
                           (block_p[13] & block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_p[2] & block_g[1]) |
                           (block_p[13] & block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_p[2] & block_p[1] & block_g[0]) |
                           (block_p[13] & block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_p[2] & block_p[1] & block_p[0] & cin);
  assign #(2) block_c[15] = block_g[14] | (block_p[14] & block_g[13]) |
                           (block_p[14] & block_p[13] & block_g[12]) |
                           (block_p[14] & block_p[13] & block_p[12] & block_g[11]) |
                           (block_p[14] & block_p[13] & block_p[12] & block_p[11] & block_g[10]) |
                           (block_p[14] & block_p[13] & block_p[12] & block_p[11] & block_p[10] & block_g[9]) |
                           (block_p[14] & block_p[13] & block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_g[8]) |
                           (block_p[14] & block_p[13] & block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_g[7]) |
                           (block_p[14] & block_p[13] & block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_g[6]) |
                           (block_p[14] & block_p[13] & block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_g[5]) |
                           (block_p[14] & block_p[13] & block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_g[4]) |
                           (block_p[14] & block_p[13] & block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_g[3]) |
                           (block_p[14] & block_p[13] & block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_g[2]) |
                           (block_p[14] & block_p[13] & block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_p[2] & block_g[1]) |
                           (block_p[14] & block_p[13] & block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_p[2] & block_p[1] & block_g[0]) |
                           (block_p[14] & block_p[13] & block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_p[2] & block_p[1] & block_p[0] & cin);
  assign #(2) block_c[16] = block_g[15] | (block_p[15] & block_g[14]) |
                           (block_p[15] & block_p[14] & block_g[13]) |
                           (block_p[15] & block_p[14] & block_p[13] & block_g[12]) |
                           (block_p[15] & block_p[14] & block_p[13] & block_p[12] & block_g[11]) |
                           (block_p[15] & block_p[14] & block_p[13] & block_p[12] & block_p[11] & block_g[10]) |
                           (block_p[15] & block_p[14] & block_p[13] & block_p[12] & block_p[11] & block_p[10] & block_g[9]) |
                           (block_p[15] & block_p[14] & block_p[13] & block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_g[8]) |
                           (block_p[15] & block_p[14] & block_p[13] & block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_g[7]) |
                           (block_p[15] & block_p[14] & block_p[13] & block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_g[6]) |
                           (block_p[15] & block_p[14] & block_p[13] & block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_g[5]) |
                           (block_p[15] & block_p[14] & block_p[13] & block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_g[4]) |
                           (block_p[15] & block_p[14] & block_p[13] & block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_g[3]) |
                           (block_p[15] & block_p[14] & block_p[13] & block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_g[2]) |
                           (block_p[15] & block_p[14] & block_p[13] & block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_p[2] & block_g[1]) |
                           (block_p[15] & block_p[14] & block_p[13] & block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_p[2] & block_p[1] & block_g[0]) |
                           (block_p[15] & block_p[14] & block_p[13] & block_p[12] & block_p[11] & block_p[10] & block_p[9] & block_p[8] & block_p[7] & block_p[6] & block_p[5] & block_p[4] & block_p[3] & block_p[2] & block_p[1] & block_p[0] & cin);

  genvar k;
  generate
    for (k = 0; k < 16; k = k + 1) begin : gen_block
      cla4_hier_block block (
        .a(a[k*4 +: 4]), .b(b[k*4 +: 4]), .cin(block_c[k]),
        .sum(sum[k*4 +: 4]), .pblock(block_p[k]), .gblock(block_g[k])
      );
    end
  endgenerate

  assign #(2) cout = block_c[16];
endmodule

module cla4_hier_block(
  input  [3:0] a,
  input  [3:0] b,
  input        cin,
  output [3:0] sum,
  output       pblock,
  output       gblock
);
  wire [3:0] p, g;
  wire [4:0] c;

  assign #(2) p = a ^ b;
  assign #(2) g = a & b;
  assign #(2) c[0] = cin;
  assign #(2) c[1] = g[0] | (p[0] & c[0]);
  assign #(2) c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c[0]);
  assign #(2) c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) |
                     (p[2] & p[1] & p[0] & c[0]);
  assign #(2) c[4] = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) |
                     (p[3] & p[2] & p[1] & g[0]) |
                     (p[3] & p[2] & p[1] & p[0] & c[0]);
  assign #(2) sum = p ^ c[3:0];
  assign #(2) pblock = p[3] & p[2] & p[1] & p[0];
  assign #(2) gblock = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) |
                       (p[3] & p[2] & p[1] & g[0]);
endmodule
