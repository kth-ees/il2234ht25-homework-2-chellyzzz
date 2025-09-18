module LFSR_6bit_tb;

  logic clk, rst_n, sel;
  logic [5:0] parallel_in;
  logic [5:0] parallel_out;

  LFSR_6bit uut (
    .clk(clk),
    .rst_n(rst_n),
    .sel(sel),
    .parallel_in(parallel_in),
    .parallel_out(parallel_out)
  );

  initial clk = 0;
  always #5 clk = ~clk; 

  initial begin
    rst_n = 0; 
    sel = 0; 
    parallel_in = 6'b101010;

    #10 rst_n = 1; 

    #10 sel = 0; parallel_in = 6'b110011;
    #10 sel = 1; 
    #100;
    
    $finish;
  end

endmodule