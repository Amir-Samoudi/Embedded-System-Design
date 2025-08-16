`timescale 1ns/1ns

module instruction_memory #(
    parameter dataWidth = 8,
    parameter addrWidth = 12,
    parameter memSize = 4096,
    parameter cycle = 25,
    parameter timer = 5
)(
    input cs,
    input readmem,
    input [addrWidth-1:0] address,
    output [dataWidth-1:0] dataOut,
    output reg memDataReady
);

    reg [dataWidth-1:0] memory [0:memSize-1];

    initial begin
        //$readmemh("factorial10.txt", memory);
        //$readmemb("factorial10_interrupt.txt", memory);
        //$readmemb("gpio.txt", memory);
        $readmemb("gpio_acc.txt", memory);
    end

    assign dataOut = (cs && readmem) ? memory[address] : {(dataWidth){1'bz}};

    always @(cs, readmem, address) begin
        if (cs && readmem) begin
            memDataReady = 1'b0;
            #(timer) memDataReady <= 1'b1;
            #(cycle) memDataReady <= 1'b0;
        end else begin
            memDataReady = 1'b0;
        end
    end

endmodule
