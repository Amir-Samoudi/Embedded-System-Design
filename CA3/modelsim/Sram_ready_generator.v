`timescale 1ns/1ns
module Sram_ready_generator#(
    parameter addrWidth = 12
    )
    (
        input clk, rst,
        input cen,     
        input [addrWidth-1:0] address,
        output reg  ready
    );

    parameter [1:0] A = 2'b00, B = 2'b01 , C=2'b10;
    reg [1:0] ps, ns;

    reg [addrWidth-1:0] addr;
    wire AddrChange;
    assign AddrChange = (addr === address)? 1'b0 : 1'b1;

    always @(ps) begin
        ready = 1'b0;
        case(ps)
            A: ready = 1'b0;
            B: ready = 1'b0;
            C: ready = 1'b1;
        endcase
    end
    
    always @(ps,cen,AddrChange) begin    
        ns = A;
        case(ps)
            A: ns = (cen&&AddrChange) ? B : A ;
            B: ns = C ; 
            C: ns = A ;
            default: ns = A;
        endcase
    end

    
    always @(posedge clk , posedge rst) begin
        if (rst) 
            ps <= A;
        else 
            ps <= ns;
    end

    always @(posedge clk , posedge rst) begin
        if (rst)
            addr <= {addrWidth{1'b0}} ;
        else
            addr <= address ;
    end

endmodule


