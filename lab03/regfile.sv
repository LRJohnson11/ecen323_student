//// register file to be used with RISC-V processor

module regfile
    #(
    parameter BUS_WIDTH = 8
    ) (
    input logic clk,
    input logic [$clog2(BUS_WIDTH) - 1:0] readReg1, readReg2, writeReg,
    input logic [BUS_WIDTH - 1: 0] writeData,
    input logic write,
    output logic[BUS_WIDTH - 1: 0] readData1, readData2
);

logic [BUS_WIDTH - 1: 0] registers[31:0]; //exactly 32 registers

integer i;
initial begin
    for(i = 0; i < 32; i=i+1)
        registers[i] = 0;
end

always_ff @(posedge clk) begin
    readData1 <= registers[readReg1];
    readData2 <= registers[readReg2];

    if(write)begin
        if(writeReg != 0) begin
            registers[writeReg] <= writeData;

            if(writeReg == readReg1) 
                readData1 <= writeData;
            if(writeReg == readReg2) 
                readData2 <= writeData;
        end
    end
    
end
endmodule