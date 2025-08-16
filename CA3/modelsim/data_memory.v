`timescale 1ns/1ns

module data_memory #(
    parameter dataWidth = 8,
    parameter addrWidth = 12,
    parameter memSize = 4096,
    parameter cycle = 25,
    parameter timer = 5
)(
    input cs,
    input readmem,
    input writemem,
    input [addrWidth-1:0] address,
    input [dataWidth-1:0] dataIn,
    output [dataWidth-1:0] dataOut,
    output reg memDataReady
);

    reg [dataWidth-1:0] memory [0:memSize-1];

    // initial begin
    //     $readmemh(initFile, memory);
    // end

    assign dataOut = (cs && readmem) ? memory[address] : {(dataWidth){1'bz}};

    always @(cs, readmem, writemem, address) begin
        if (cs && (readmem || writemem)) begin
            memDataReady = 1'b0;
            #(timer) memDataReady <= 1'b1;
            #(cycle) memDataReady <= 1'b0;
        end else begin
            memDataReady = 1'b0;
        end
    end

    always @(cs, writemem, address, dataIn) begin
        if (cs && writemem) begin
            #(timer) memory[address] = dataIn;
        end
    end

endmodule
