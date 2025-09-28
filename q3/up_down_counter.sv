module up_down_counter #(parameter N = 4)
                       (input  logic clk,
                        input  logic rst_n,
                        input  logic up_down,
                        input  logic load,
                        input  logic [N-1:0] input_load,
                        output logic [N-1:0] count_out,
                        output logic carry_out);
  
  // complete here
reg [N-1:0] count;
assign count_out = count;

always @(posedge clk or negedge rst_n) begin
  if(~rst_n) begin
    count <= 0;
    carry_out <= 0;
  end
  else begin
    if(load) begin
      count <= input_load;
      carry_out <= 0;
    end
    else if(up_down) begin
      if(count === {N{1'b1}}) begin
        count <= 0;
        carry_out <= 1;
      end
      else count <= count + 1; 
    end
    else if(~up_down) begin
      if(count === 0) begin
        count <= {N{1'b1}};
        carry_out <= 1;
      end
      else count <= count - 1; 
    end
  end
end

endmodule
