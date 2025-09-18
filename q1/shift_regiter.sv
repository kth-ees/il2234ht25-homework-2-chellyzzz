module shift_register #(parameter N=4)
                      (input logic clk,
                       input logic rst_n,
                       input logic serial_parallel,
                       input logic load_enable,
                       input logic serial_in,
                       input logic [N-1:0] parallel_in,
                       output logic [N-1:0] parallel_out,
                       output logic serial_out);

//complete here
reg [N-1 : 0] shift_regs;
assign parallel_out = shift_regs;
assign serial_out = shift_regs[N-1];

always_ff @(posedge clk or negedge rst_n) begin
    if(rst_n == 1'b0) begin
        shift_regs <= 'b0;
    end
    else begin
        if(load_enable) begin
            if(serial_parallel) begin
                shift_regs <= parallel_in;
            end
            else begin
                shift_regs <= {shift_regs[N-2:0], serial_in};
            end
        end
    end
end
endmodule
