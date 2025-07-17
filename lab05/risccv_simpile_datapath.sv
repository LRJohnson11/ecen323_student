//file containing datapath data.

module #(
    parameter INITIAL_PC = 32'h00400000;
) (
    input logic clk, rst, PC_Src, ALUSrc, RegWrite, MemToReg, loadPC
    input logic [31:0] instruction,
    input logic [3:0] ALUCtrl,
    output logic zero,
    output logic [31:0] PC, dAddress, dWriteData, dReadData,WriteBackData
);

logic [31:0] immI, immS;

always_ff  @(posedge clk) begin
    if(rst) PC <= INITIAL_PC;
    else if(loadPC) PC <= PC_Src;
end

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


//immediate generation
assign immI = $signed(instruction[31:20]);
assign immS = $signed(instruction[31:20]);


endmodule