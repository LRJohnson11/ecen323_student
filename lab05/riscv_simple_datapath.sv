//file containing datapath data.
import datapathConstants::*;
import riscv_opcodes::*;

module riscv_simple_datapath #(
    parameter INITIAL_PC = 32'h00400000
) (
    input logic clk, rst, PCSrc, ALUSrc, RegWrite, MemtoReg, loadPC,
    input logic [31:0] instruction, dReadData,
    input logic [3:0] ALUCtrl,
    output logic Zero,
    output logic [31:0] PC, dAddress, dWriteData,WriteBackData
);

//intermediate signals
logic [31:0] imm_I, imm_S, imm_SB, imm_U, imm_J, imm, NextPC, branchOffset, aluOp2, readData1, readData2, writeData, alu_result;
logic [4:0] readReg1, readReg2, writeReg;
logic [6:0] opCode;

always_ff  @(posedge clk) begin
    if(rst) PC <= INITIAL_PC;
    else if(loadPC) PC <= NextPC;
end

assign NextPC = PCSrc ? PC + branchOffset:PC + 4;

assign opCode = instruction[OPCODE_MSB:OPCODE_LSB];

//register files
regfile #(.BUS_WIDTH(32))
registers (.clk(clk),
            .readReg1(readReg1),
            .readReg2(readReg2),
            .writeReg(writeReg),
            .writeData(writeData),
            .write(RegWrite),
            .readData1(readData1),
            .readData2(readData2));

assign readReg1 = instruction[19:15];
assign readReg2 = instruction[24:20];
assign writeReg = instruction[11:7];
assign writeData = MemtoReg ? dReadData : alu_result;
assign WriteBackData = writeData;


//immediate generation
// I-Type Immediate (e.g., addi, lw, jalr)

assign imm_I = $signed(instruction[31:20]);

// S-Type Immediate (e.g., sw, sb, sh)
assign imm_S = $signed({instruction[31:25], instruction[11:7]});

// U-Type Immediate (e.g., lui, auipc)
assign imm_U = {instruction[31:12], 12'b0};  // Zero-extended

// J-Type Immediate (e.g., jal)
assign imm_J = $signed({instruction[31], instruction[19:12], instruction[20], instruction[30:21], 1'b0});

// SB-Type Immediate
assign imm_SB = $signed({instruction[31], instruction[7], instruction[30:25], instruction[11:8], 1'b0});

always_comb begin
    case(opCode)
        //I type
        OPCODE_LB,OPCODE_LH,OPCODE_LW,OPCODE_LBU,OPCODE_LHU,
        OPCODE_FENCE,OPCODE_FENCE_I,OPCODE_ADDI,OPCODE_SLLI,
        OPCODE_SLTI,OPCODE_SLTIU,OPCODE_XORI,OPCODE_SRLI,OPCODE_SRAI,
        OPCODE_ORI,OPCODE_ANDI,OPCODE_JALR,OPCODE_ECALL,OPCODE_EBREAK,
        OPCODE_CSRRW,OPCODE_CSRRS,OPCODE_CSRRC,OPCODE_CSRRWI,
        OPCODE_CSRRSI, OPCODE_CSRRCI: imm = imm_I;
        //S type
        OPCODE_SB,OPCODE_SH,OPCODE_SW: imm = imm_S;
        //U type
        OPCODE_AUIPC, OPCODE_LUI: imm = imm_U;
        //J type
        OPCODE_JAL: imm=imm_J;
        //SB type
        OPCODE_BEQ, OPCODE_BNE, OPCODE_BLT, OPCODE_BGE, OPCODE_BLTU,OPCODE_BGEU: imm = imm_SB;
        default: imm=0;
    endcase

end

assign aluOp2 = ALUSrc ? imm : readData2;

//alu

alu #(.BUS_WIDTH(32))
my_alu (.op1(readData1),
        .op2(aluOp2),
        .alu_op(ALUCtrl),
        .result(alu_result),
        .zero(Zero));

//necessary signals to interface with memory provided in test bench
assign dAddress = alu_result;
assign dWriteData = readData2;

//logic for calculating branch offset for PC.
assign branchOffset = imm;




endmodule