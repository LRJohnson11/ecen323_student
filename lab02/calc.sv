//////
//calculator module to test and utilize our in-house made alu.
/////
import alu_defs::*;
module calc 
#(
    parameter BUS_WIDTH = 32
    )(
        input logic clk, btnc, btnl, btnu, btnr, btnd,
        input logic [15:0] sw,
        output logic [15:0] led
    );

    localparam busWidthAsBits = $clog2(BUS_WIDTH);


    logic[BUS_WIDTH/2: 0] accumulator;
    logic[BUS_WIDTH - 1: 0] op1, op2, result;
    logic[2:0] opSignal;
    alu_op_t alu_op;

    assign op1[BUS_WIDTH -1: BUS_WIDTH/2] = accumulator[BUS_WIDTH/2 - 1] == 1 ? 4'hffff : 4'h0000;
    assign op2[BUS_WIDTH -1: BUS_WIDTH/2] = sw[BUS_WIDTH/2 - 1] == 1 ? 4'hffff : 4'b0000;

    assign opSignal = {btnl,btnc,btnl};

//btnd oneshot


//register for results
always_ff @( posedge clk ) begin
    if(btnu) accumulator <= 0;
    else if(btnd) accumulator <= result[BUS_WIDTH/2 - 1: 0];
    
end

alu #(.BUS_WIDTH(BUS_WIDTH))
(.op1(op1), .op2(op2), .result(result), .alu_op(alu_op), .zero(zero));


assign led = accumulator;

always_comb begin
    case (opSignal)
        3'b000: alu_op = ALUOP_ADD;
        3'b001: alu_op = ALUOP_SUB;
        3'b010: alu_op = ALUOP_AND;
        3'b011: alu_op = ALUOP_OR;
        3'b100: alu_op = ALUOP_XOR;
        3'b101: alu_op = ALUOP_LT;
        3'b110: alu_op = ALUOP_LSL;
        3'b111: alu_op = ALUOP_ASR;
    endcase
end

endmodule