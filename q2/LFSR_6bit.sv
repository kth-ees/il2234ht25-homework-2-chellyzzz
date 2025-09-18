module LFSR_6bit (
  input  logic clk, rst_n,
  input  logic sel,
  input  logic [5:0] parallel_in,
  output logic [5:0] parallel_out
);
  // …
  // Add your description here
  // …

  reg [5 : 0] lfsr_regs;
  assign parallel_out = lfsr_regs;
  always_ff @(posedge clk or negedge rst_n) begin
    if(~rst_n) begin
      lfsr_regs <= 'b0;
    end
    else if(~sel) begin
      lfsr_regs <= parallel_in;
    end
    else begin
      lfsr_regs <= {lfsr_regs[4:3], lfsr_regs[5] ^ lfsr_regs[2], lfsr_regs[1], lfsr_regs[5] ^ lfsr_regs[1], lfsr_regs[5]};
    end
  end
endmodule
