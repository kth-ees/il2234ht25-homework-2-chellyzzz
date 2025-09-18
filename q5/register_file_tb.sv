module registerfile_tb;

  logic clk;
  logic rst_n;
  logic write_en;
  logic [3:0] write_addr;
  logic [7:0] data_in;
  logic [3:0] read_addr1;
  logic [3:0] read_addr2;
  logic [7:0] data_out1;
  logic [7:0] data_out2;

  registerfile dut (
    .clk(clk),
    .rst_n(rst_n),
    .write_en(write_en),
    .write_addr(write_addr),
    .data_in(data_in),
    .read_addr1(read_addr1),
    .read_addr2(read_addr2),
    .data_out1(data_out1),
    .data_out2(data_out2)
  );

  // Clock generation
  initial clk = 0;
  always #5 clk = ~clk; // 10 time units clock period

  // Test sequence
  initial begin
    // Initialize signals
    rst_n = 0;
    write_en = 0;
    write_addr = 4'b0;
    data_in = 8'b0;
    read_addr1 = 4'b0;
    read_addr2 = 4'b0;

    // Apply reset
    #10 rst_n = 1;

    // Write data to register 3
    #10 write_en = 1;
    write_addr = 4'd3;
    data_in = 8'hA5; // Write 0xA5 to register 3
    #10 write_en = 0;

    // Write data to register 7
    #10 write_en = 1;
    write_addr = 4'd7;
    data_in = 8'h5A; // Write 0x5A to register 7
    #10 write_en = 0;

    // Read data from register 3 and 7
    #10 read_addr1 = 4'd3;
    read_addr2 = 4'd7;
    #10;

    // Verify outputs
    if (data_out1 !== 8'hA5 || data_out2 !== 8'h5A) begin
      $display("Test failed: Incorrect data read from registers");
    end else begin
      $display("Test passed: Correct data read from registers");
    end

    // Reset the register file
    #10 rst_n = 0;
    #10 rst_n = 1;

    // Verify reset
    read_addr1 = 4'd3;
    read_addr2 = 4'd7;
    #10;
    if (data_out1 !== 8'b0 || data_out2 !== 8'b0) begin
      $display("Test failed: Registers not reset correctly");
    end else begin
      $display("Test passed: Registers reset correctly");
    end

    // End simulation
    #10 $finish;
  end

endmodule