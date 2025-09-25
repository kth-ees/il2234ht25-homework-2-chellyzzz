module up_down_counter_tb;

// complete here
parameter N = 4;
logic clk, rst_n, up_down, load;
logic [N-1:0] input_load;
logic [N-1:0] count_out;
logic carry_out;

up_down_counter #(N) UUT (
  .clk(clk),
  .rst_n(rst_n),
  .up_down(up_down),
  .load(load),
  .input_load(input_load),
  .count_out(count_out),
  .carry_out(carry_out)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    rst_n = 0;
    up_down = 1; 
    load = 0;
    input_load = 4'b0000;

    #10 rst_n = 1; 
    load = 1;
    input_load = 4'b0100;

    #10 load = 0;

    #50;

    // Test counting down
    up_down = 0; // Switch to counting down
    #50;

    // Test loading another value
    load = 1;
    input_load = 4'b0011; // Load value 3
    #10;
    load = 0;

    // Continue counting down
    #50;

    $finish;
end
endmodule