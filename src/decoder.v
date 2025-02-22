
/*
      -- 1 --
     |       |
     6       2
     |       |
      -- 7 --
     |       |
     5       3
     |       |
      -- 4 --
*/

module hex2seg7 (
    input wire [3:0] data,
    output reg [6:0] segments
);

    always @(*) begin
        case(data)
            //                7654321
            0:  segments = 7'b0111111;
            1:  segments = 7'b0000110;
            2:  segments = 7'b1011011;
            3:  segments = 7'b1001111;
            4:  segments = 7'b1100110;
            5:  segments = 7'b1101101;
            6:  segments = 7'b1111100;
            7:  segments = 7'b0000111;
            8:  segments = 7'b1111111;
            9:  segments = 7'b1100111;
            10: segments = 7'b1110111;
            11: segments = 7'b1111100;
            12: segments = 7'b1011000;
            13: segments = 7'b1011110;
            14: segments = 7'b1111001;
            15: segments = 7'b1110001;
            default:    
                segments = 7'b0000000;
        endcase
    end

endmodule

