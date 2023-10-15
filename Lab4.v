/* 
 Explanation:
 (1) Active low, so the bit values are inverse from that in Lab 3.
 (2) 'reg' is necessary when used in 'always' block AND its value is changed. Thus, x does not need reg
 (3) By default, variables are implicitly declared as 'wire', unless specified otherwise like 'reg'
*/
module vsevenseg(input x[3:0], output reg seg_L[6:0]);
  always @* 
  begin
    case(x)
        4'd0: seg_L = 7'b100_0000;
        4'd1: seg_L = 7'b111_1001;
        4'd2: seg_L = 7'b010_0100;
        4'd3: seg_L = 7'b011_0000;
        4'd4: seg_L = 7'b001_1001;
        4'd5: seg_L = 7'b001_0010;
        4'd6: seg_L = 7'b000_0010;
        4'd7: seg_L = 7'b111_1000;
        4'd8: seg_L = 7'b000_0000;
        4'd9: seg_L = 7'b001_1000;
        4'd10:seg_L = 7'b000_1000;
        4'd11:seg_L = 7'b000_0011;
        4'd12:seg_L = 7'b100_0110;
        4'd13:seg_L = 7'b010_0001;
        4'd14:seg_L = 7'b000_0110;
        4'd15:seg_L = 7'b000_1110;
        default: seg_L = 7'b111_1111;
    endcase
  end
endmodule

module vaddoflow(input a[3:0], b[3:0], output seg_L[6:0], oflow);
    wire x[4:0];
    assign sum = a + b;
    
    vsevenseg (
        .x(sum[3:0]),
        .seg_L(seg_L)
    );
    
    assign oflow = sum[4];
endmodule
