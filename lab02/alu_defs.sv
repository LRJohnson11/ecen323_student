package alu_defs;

  // These behave like constants
  parameter logic [3:0] ALUOP_AND = 4'b0000;
  parameter logic [3:0] ALUOP_OR  = 4'b0001;
  parameter logic [3:0] ALUOP_ADD = 4'b0010;
  parameter logic [3:0] ALUOP_SUB = 4'b0110;
  parameter logic [3:0] ALUOP_LT  = 4'b0111;
  parameter logic [3:0] ALUOP_LSR = 4'b1000;
  parameter logic [3:0] ALUOP_LSL = 4'b1001;
  parameter logic [3:0] ALUOP_ASR = 4'b1010;
  parameter logic [3:0] ALUOP_XOR = 4'b1101;

endpackage
