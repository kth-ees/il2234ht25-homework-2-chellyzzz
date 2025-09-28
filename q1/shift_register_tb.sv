module shift_register_tb;

// complete here
localparam N = 4;


logic clk;
logic rst_n;
logic serial_parallel;
logic load_enable;
logic serial_in;
logic [N-1:0] parallel_in;
logic [N-1:0] parallel_out;
logic serial_out;

initial begin
    clk = 0;
    forever #5 clk = ~clk; 
end

shift_register #(N) uut (
    .clk(clk),
    .rst_n(rst_n),
    .serial_parallel(serial_parallel),
    .load_enable(load_enable),
    .serial_in(serial_in),
    .parallel_in(parallel_in),
    .parallel_out(parallel_out),
    .serial_out(serial_out)
);
 initial begin
    // Initialize signals
    rst_n = 0;
    serial_parallel = 0;
    load_enable = 0;
    serial_in = 0;
    parallel_in = 0;

    #10 rst_n = 1;

    load_enable = 1;
    serial_parallel = 0;
    serial_in = 1;
    #10;
    serial_in = 0;
    #10;
    serial_in = 1;
    #10;
    serial_in = 1;
    #10;

    serial_parallel = 1;
    parallel_in = 4'b1010;
    #10;

    load_enable = 0;
    serial_in = 0;
    parallel_in = 4'b1111;
    #10;

    $finish;
 end

endmodule