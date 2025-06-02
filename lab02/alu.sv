//////
//this fil is the ALU for the RISC-V processor
/////
`include "riscv_alu_constants.sv"

module alu #(
    parameter BUS_WIDTH = 8
    ) (
    input logic [BUS_WIDTH - 1:0] op1, // first operand
    input logic [BUS_WIDTH - 1:0] op2, // second operand
    input logic [3:0] alu_control, // control signal for ALU operation
    output logic [BUS_WIDTH - 1:0] result, // result of the ALU operation
    output logic zero // zero flag
);

localparam bytesForBusWidth = $clog2(BUS_WIDTH);

    // ALU operations
    always_comb begin
        case (alu_control)
            ALUOP_AND: result = op1 & op2; //and
            ALUOP_OR: result = op1 | op2; //or
            ALUOP_ADD: result = op1 + op2; //add
            ALUOP_SUB: result = op1 - op2; //sub
            ALUOP_LT: result = $signed(op1) < $signed(op2); //less than
            ALUOP_LSL: result = op1 << op2[bytesForBusWidth - 1: 0]; // shift left
            ALUOP_LSR: result = op1 >> op2[bytesForBusWidth - 1: 0]; //logic shift
            ALUOP_ASR: result = $unsigned($signed(op1) >>> op2[bytesForBusWidth - 1: 0]); //arithmetic shift right
            ALUOP_XOR: result = op1 ^ op2;
            default: result = 0; // Default case
        endcase

        zero = (result == 0); // Set zero flag if result is zero
    end



endmodule