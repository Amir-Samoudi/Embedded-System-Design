`timescale 1ns/1ns
module GPIO_tb();

    reg clk = 0;
    reg rst = 0; 
    reg [7:0] data_i = 8'b0 ;
    wire [7:0] data_o ;
    reg [31:0] addr = 32'b0;
    wire ready;
    reg cs = 1'b0;
    reg wr = 1'b0 ;
    reg rd = 1'b0;
    wire[31:0] out;
    wire interrupt;
    reg [31:0] inp ;

    GPIO 
    UUT (
        .clk(clk),
        .rst(rst),
        .data_i(data_i),
        .data_o(data_o),
        .addr(addr),
        .ready(ready),
        .cs(cs),
        .wr(wr),
        .rd(rd),
        .out(out),
        .interrupt(interrupt),
        .inp(inp)
    );

    always #5 clk = ~clk;

    initial begin

        #20 rst = 1; 
        #11 rst = 0; 

        #10 inp = 32'hf0f0f0f0;

        #50 rd = 1'b1; cs = 1'b1; addr = 32'b0000000000000000; 
        #10 rd = 1'b0 ; cs = 1'b0;

        #50 rd = 1'b1;  cs = 1'b1; addr = 32'b0000000000000100;
        #10 rd = 1'b0 ; cs = 1'b0;

        #50 rd = 1'b1; cs = 1'b0; addr = 32'b0000000000001000;
        #10 rd = 1'b0;

        #50 rd = 1'b1; cs = 1'b1; addr = 32'b0000000000001100;
        #10 rd = 1'b0; cs = 1'b0;

        #50 rd = 1'b1; cs = 1'b1; addr = 32'b0000000000001101;
        #10 rd = 1'b0 ; cs = 1'b0;

        #50 rd = 1'b1; cs = 1'b1; addr = 32'b0000000000001110;
        #10 rd = 1'b0 ; cs = 1'b0;

        #50 rd = 1'b1; cs = 1'b1; addr = 32'b0000000000001111;
        #10 rd = 1'b0 ; cs = 1'b0;
        
        #10 inp = 32'h0f0f0f0f;

        #50 rd = 1'b1;  cs = 1'b1; addr = 32'b0000000000001000;
        #10 rd = 1'b0; cs = 1'b0;

        #50 wr = 1'b1;  cs = 1'b0; addr = 32'b0000000000000100;data_i =8'b00000001;
        #10 wr = 1'b0;

        #50 wr = 1'b1;  cs = 1'b1; addr = 32'b0000000000000100;data_i =8'b00000001;
        #10 wr = 1'b0; cs = 1'b0;

        #10 inp = 32'hffffffff;
        
        #50 rd = 1'b1;  cs = 1'b1; addr = 32'b0000000000001000;
        #10 rd = 1'b0; cs = 1'b0;

        #2000 $stop;
    end

endmodule



