package riscv_opcodes;

    
    //I TYPE
    localparam logic [6:0] OPCODE_LB      = 7'b0000011;
    localparam logic [6:0] OPCODE_LH      = 7'b0000011;
    localparam logic [6:0] OPCODE_LW      = 7'b0000011;
    localparam logic [6:0] OPCODE_LBU     = 7'b0000011;
    localparam logic [6:0] OPCODE_LHU     = 7'b0000011;
    localparam logic [6:0] OPCODE_FENCE   = 7'b0001111;
    localparam logic [6:0] OPCODE_FENCE_I = 7'b0001111;
    localparam logic [6:0] OPCODE_ADDI    = 7'b0010011;
    localparam logic [6:0] OPCODE_SLLI    = 7'b0010011;
    localparam logic [6:0] OPCODE_SLTI    = 7'b0010011;
    localparam logic [6:0] OPCODE_SLTIU   = 7'b0010011;
    localparam logic [6:0] OPCODE_XORI    = 7'b0010011;
    localparam logic [6:0] OPCODE_SRLI    = 7'b0010011;
    localparam logic [6:0] OPCODE_SRAI    = 7'b0010011;
    localparam logic [6:0] OPCODE_ORI     = 7'b0010011;
    localparam logic [6:0] OPCODE_ANDI    = 7'b0010011;
    localparam logic [6:0] OPCODE_JALR    = 7'b1100111;
    localparam logic [6:0] OPCODE_ECALL   = 7'b1110011;
    localparam logic [6:0] OPCODE_EBREAK  = 7'b1110011;
    localparam logic [6:0] OPCODE_CSRRW   = 7'b1110011;
    localparam logic [6:0] OPCODE_CSRRS   = 7'b1110011;
    localparam logic [6:0] OPCODE_CSRRC   = 7'b1110011;
    localparam logic [6:0] OPCODE_CSRRWI  = 7'b1110011;
    localparam logic [6:0] OPCODE_CSRRSI  = 7'b1110011;
    localparam logic [6:0] OPCODE_CSRRCI  = 7'b1110011;

    //U TYPE
    localparam logic [6:0] OPCODE_AUIPC    = 7'b0010111;
    localparam logic [6:0] OPCODE_LUI      = 7'b0110111;

    //j type
    localparam logic [6:0] OPCODE_JAL      = 7'b1101111;

    //S TYPE
    localparam logic [6:0] OPCODE_SB      = 7'b0100011;
    localparam logic [6:0] OPCODE_SH      = 7'b0100011;
    localparam logic [6:0] OPCODE_SW      = 7'b0100011;

    //R TYPE
    localparam logic [6:0] OPCODE_ADD     = 7'b0110011;
    localparam logic [6:0] OPCODE_SUB     = 7'b0110011;
    localparam logic [6:0] OPCODE_SLL     = 7'b0110011;
    localparam logic [6:0] OPCODE_SLT     = 7'b0110011;
    localparam logic [6:0] OPCODE_SLTU    = 7'b0110011;
    localparam logic [6:0] OPCODE_XOR     = 7'b0110011;
    localparam logic [6:0] OPCODE_SRL     = 7'b0110011;
    localparam logic [6:0] OPCODE_SRA     = 7'b0110011;
    localparam logic [6:0] OPCODE_OR      = 7'b0110011;
    localparam logic [6:0] OPCODE_AND     = 7'b0110011;

    //SB TYPE
    localparam logic [6:0] OPCODE_BEQ     = 7'b1100011;
    localparam logic [6:0] OPCODE_BNE     = 7'b1100011;
    localparam logic [6:0] OPCODE_BLT     = 7'b1100011;
    localparam logic [6:0] OPCODE_BGE     = 7'b1100011;
    localparam logic [6:0] OPCODE_BLTU    = 7'b1100011;
    localparam logic [6:0] OPCODE_BGEU    = 7'b1100011;

endpackage : riscv_opcodes