//test regfiles with a top level module

module regfile_top #(
    BUS_WIDTH = 8
) (
    input logic clk, btnc, btnl, btnu, btnd
    input logic [15:0] sw,
    output logic [15:0] led
);

logic [14:0] ports;
logic [1:0] writeSynchronizer
logic write;
logic [BUS_WIDTH -1:0] readData1, readData2, writeData, input;

always_ff @(posedge clk) begin
if(btnu) ports <= 0;
else if(btnl) <= sw[14:0];

end

always_ff @(posedge clk) begin
    writeSynchronizer[0] <= btnc;
    writeSynchronizer[1] <= writeSynchronizer[0];
end

assign write = writeSynchronizer[0] && !writeSynchronizer[1];

regfile #(.BUS_WIDTH(BUS_WIDTH))
myRegs (.clk(clk),
        .write(write),
        .readReg1(ports[4:0]),
        .readReg2(ports[9:5]),
        .writeReg(ports[14:10]),
        .writeData(writeData),
        .readData1(readData1),
        .readData2(readData2)
        );

alu #(.BUS_WIDTH(BUS_WIDTH))
myAlu (.alu_op(sw[3:0]),
        .op1(readData1),
        .op2(readData2),
        .result(result));


assign led = btnd ? readData1[15:0] : readData1[31:16];

assign input = $signed(sw[14:0]);

assign writeData = sw[15]? input : result;

endmodule