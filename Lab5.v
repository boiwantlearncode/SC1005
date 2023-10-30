// Inside convert.v file
module convert(
    input [3:0] in,
    output reg [3:0] out
    );
    
    always @ * begin
        case (in)
            4'd0: out = 4'hA;
            4'd1: out = 4'hA;
            4'd2: out = 4'hC;
            4'd3: out = 4'h0;
            4'd4: out = 4'hF;
            4'd5: out = 4'hF;
            4'd6: out = 4'hE;
            4'd7: out = 4'hE;
            4'd8: out = 4'hA;
            4'd9: out = 4'h1;
            4'd10:out = 4'h5;
            4'd11:out = 4'hA;
            4'd12:out = 4'h9;
            4'd13:out = 4'h0;
            4'd14:out = 4'h0;
            4'd15:out = 4'hD;
        endcase
    end
endmodule

// Inside scroll.v file
module scroll(
    input clk,
    input rst,
    output [15:0] display
    );
    
    reg [3:0] count;
    wire [3:0] a, b, c, d;
    
    assign a = count;
    assign b = count + 1;
    assign c = count + 2;
    assign d = count + 3;
    
    convert seg_1(.in(a), .out(display[15:12]));
    convert seg_2(.in(b), .out(display[11:8]));
    convert seg_3(.in(c), .out(display[7:4]));
    convert seg_4(.in(d), .out(display[3:0]));
    
    always @(posedge clk) begin
        if (rst)
            count <= 4'd0;
        else
            count <= count + 1'd1;
    end
endmodule

// Put in Lab5_top.v
module Lab5_top(input clk, rst, sel, output [6:0] seg_L, output [3:0] anode_L);

    // declare necessary wires here
    wire adjusted_clk;
    wire [15:0] value;

    // instantiate modules here
    scroll uut1 (.clk(adjusted_clk), .rst(rst), .display(value));
    slow_clkgen uut2 (.clk(clk), .rst(rst), .clk_out(adjusted_clk));
    seg7_driver uut3 (.clk(clk), .rst(rst), .sel(sel), .value(value), .anode_d(4'b0000), .seg_L(seg_L), .anode_L(anode_L));
endmodule
