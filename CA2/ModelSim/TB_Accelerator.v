`timescale 1ns/1ns

module TB_Accelerator ();
    
    reg clk = 1'b0;
    reg rst = 1'b0;

    reg cs = 0;
    reg [3:0] address = 0;
    reg [7:0] dataIn = 0;
    reg readmem = 0;
    reg writemem = 0;

    wire [7:0] dataOut;
    wire memDataReady;
    wire interrupt;

    Accelerator #(
        .dataWidth(8),
        .addrWidth(4)
    ) UUT(
        .clk(clk),
        .rst(rst),
        .cs(cs),
        .readmem(readmem),
        .writemem(writemem),
        .address(address),
        .dataIn(dataIn),
        .dataOut(dataOut),
        .memDataReady(memDataReady),
        .interrupt(interrupt)
    );

    always #15 clk = ~ clk;

    initial begin
        rst=1;
        #40;
        rst=0;

        // Write n
        #30
        dataIn = 8'd10;
        writemem = 1;
        address = 0;
        cs = 1;

        // Write int_en
        #60
        dataIn = 8'd1;
        writemem = 1;
        address = 4'd6;
        cs = 1;

        // Write Start
        #60
        dataIn = 8'd0;
        writemem = 1;
        address = 4'd5;
        cs = 1;

        #30 cs = 0;

        wait (interrupt);

        // Read Result
        #60
        readmem = 1;
        address = 4'd0;
        cs = 1;

        #60
        readmem = 1;
        address = 4'd1;
        cs = 1;

        #60
        readmem = 1;
        address = 4'd2;
        cs = 1;

        #60
        readmem = 1;
        address = 4'd3;
        cs = 1;

        // Read Done
        #60
        readmem = 1;
        address = 4'd7;
        cs = 1;

        // Set Done to zero
        #60
        dataIn = 8'd0;
        writemem = 1;
        address = 4'd7;
        cs = 1;


        #600 $stop;

    end

endmodule
