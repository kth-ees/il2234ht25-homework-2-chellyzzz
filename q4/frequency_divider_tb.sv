module frequency_divider_tb;

//complete here
logic clk;  
logic rst_n;
logic sel; // sel = 0: divide by 18, sel = 1: divide by 866
logic divider_out;

frequency_divider dut (
    .clk(clk),
    .rst_n(rst_n),
    .sel(sel),
    .divider_out(divider_out)
);

initial begin
    clk = 1'b0;
    forever #5 clk = ~clk; // 10 time unit clock period
end

initial begin
    rst_n = 1'b0;
    sel = 1'b0; // Start with divide by 18
    #15;
    rst_n = 1'b1; // Release reset after 15 time units

    // Test divide by 18
    #200; // Wait for some time to observe the output

    sel = 1'b1; // Change to divide by 866
    #200; // Wait for some time to observe the output

    sel = 1'b0; // Change back to divide by 18
    #200; // Wait for some time to observe the output

    $finish; // End simulation
end
endmodule