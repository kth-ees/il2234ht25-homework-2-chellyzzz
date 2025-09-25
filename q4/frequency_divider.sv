module frequency_divider (input logic clk,
                          input logic rst_n,
                          input logic sel, // sel = 0: divide by 18, sel = 1: divide by 866
                          output logic divider_out);
  
  // complete here
  wire [15:0] count_out;
  
  counter_16bit counter (
      .clk(clk),
      .rst_n(rst_n),
      .count_out(count_out)
  );

  reg [15:0] divider;
  assign divider_out = divider;

  always_ff @(posedge clk or negedge rst_n) begin
      if(rst_n == 1'b0) begin
          cnt_sel <= 1'b0;
      end
      else begin
          if(sel == 1'b0) begin
            divider <= 'd18;
          end
          else begin
            divider <= 'd866;
          end
      end
  end

always_ff @(posedge clk or negedge rst_n) begin
    if(rst_n == 1'b0) begin
        divider_out <= 1'b0;
    end
    else begin
        if(count_out == divider) begin
            divider_out <= ~divider_out;
        end
    end
end

endmodule

module counter_16bit (
    input logic clk,
    input logic rst_n,
    output logic [15:0] count_out,
);
    
    counter_4bit counter0 (
        .clk(clk),
        .rst_n(rst_n),
        .count_out(count_out[3:0])
    );
    counter_4bit counter1 (
        .clk(count_out[3]),
        .rst_n(rst_n),
        .count_out(count_out[7:4])
    );
    counter_4bit counter2 (
        .clk(count_out[7]),
        .rst_n(rst_n),
        .count_out(count_out[11:8])
    );
    counter_4bit counter3 (
        .clk(count_out[11]),
        .rst_n(rst_n),
        .count_out(count_out[15:12])
    );
endmodule

module counter_4bit (
    input logic clk,
    input logic rst_n,
    output logic [3:0] count_out,
);

    reg [3:0] count;
    assign counter_out = count_out;
    always_ff @(posedge clk or negedge rst_n) begin
        if(rst_n == 1'b0) begin
            count <= 'b0;
        end
        else begin
            count <= count + 1'b1;
        end
    end

endmodule