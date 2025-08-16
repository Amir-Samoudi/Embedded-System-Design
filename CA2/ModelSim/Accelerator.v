`timescale 1ns/1ns

module Accelerator #(
    parameter dataWidth = 8,
    parameter addrWidth = 12
)(
    input clk, rst,

    input cs,
    input readmem,
    input writemem,
    input [addrWidth-1:0] address,
    input [dataWidth-1:0] dataIn,
    output [dataWidth-1:0] dataOut,
    output reg memDataReady,

    output interrupt
);

    // Memory mapped registers
    reg [dataWidth-1:0] n_reg;
    reg int_en;
    reg done;
    reg start;

    // Factorial Core\
    wire done_acc;
    wire [31:0] fn;

    factorial #(.N_WIDTH(8),
				.FN_WIDTH(32))
		FACT (	.clk(clk),
				.rst(rst),
				.start(start),
				.done(done_acc),
				.n(n_reg),
				.fn(fn) 
    );

    // Writing MM register
    always @(cs, readmem, writemem, address) begin
        if (cs && (readmem || writemem)) begin
            memDataReady = 1'b0;
            #(5) memDataReady <= 1'b1;
            #(25) memDataReady <= 1'b0;
        end else begin
            memDataReady = 1'b0;
        end
    end

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            n_reg <= 0;
            int_en <= 0;
        end
        else begin
            if (cs && writemem) begin
                if (address == 0)
                    n_reg <= dataIn;
                else if (address == 6)
                    int_en <= dataIn[0];
            end
        end 
    end

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            done <= 0;
        end
        else begin
            if (done_acc)
                done <= 1;
            else if (cs && writemem &&(address == 7))
                done <= 0;  // Processor can set Done to zero  
        end
    end

    assign start = (cs && writemem && (address == 5)) ? 1 : 0;

    assign interrupt = (done && int_en) ? 1 : 0;

    wire [dataWidth-1:0] dataOut_mux;
    assign dataOut_mux = (address == 1) ? fn[7:0] :
                         (address == 2) ? fn[15:8] :
                         (address == 3) ? fn[23:16] :
                         (address == 4) ? fn[31:24] :
                         (address == 7) ? {7'b0, done} : {(dataWidth){1'bz}};
    
    assign dataOut = (cs && readmem) ? dataOut_mux : {(dataWidth){1'bz}};

    
endmodule
