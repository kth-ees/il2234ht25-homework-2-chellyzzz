module registerfile (input logic clk,
                     input logic rst_n,
                     input logic write_en,
                     input logic [3:0] write_addr,
                     input logic [7:0] data_in,
                     input logic [3:0] read_addr1,
                     input logic [3:0] read_addr2,
                     output logic [7:0] data_out1,
                     output logic [7:0] data_out2
                     );
    // complete here

reg [7:0] registers [15:0];
always_ff @(posedge clk or negedge rst_n) begin
    if(rst_n == 1'b0) begin
        for(int i = 0; i < 16; i++) begin
            registers[i] <= 8'b0;
        end
    end
    else begin
        if(write_en) begin
            registers[write_addr] <= data_in;
        end
    end
end
assign data_out1 = registers[read_addr1];
assign data_out2 = registers[read_addr2];

endmodule