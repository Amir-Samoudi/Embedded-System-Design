// **************************************************************************************
// Filename: aftab_factorial_TB.v
// Project: AFTAB
// Version: 1.0
// Date:
//
// Module Name: aftab_factorial_TB
// Description:
//
// Dependencies:
//
// File content description:
// TB_ft for AFTAB core factorial test
//
// **************************************************************************************
`timescale 1ns/1ns

module aftab_testbench();
	// Core inputs
    reg clk = 1'b0;
    reg rst = 1'b0;
    wire memReady;
    wire [7:0] dataBus_in, dataBus_out;
    reg [15:0] platformInterruptSignals = 16'd0;
    reg machineExternalInterrupt = 1'b0;
    reg machineTimerInterrupt = 1'b0;
    reg machineSoftwareInterrupt = 1'b0;
    reg userExternalInterrupt = 1'b0;
    reg userTimerInterrupt = 1'b0;
    reg userSoftwareInterrupt = 1'b0;

	// Core outputs
    wire memRead;
    wire memWrite;
    wire interruptProcessing;
    wire [31:0] memAddr;

    //GPIO interconnect
    wire CS_GPIO;
    wire[7:0] dataOut_GPIO;
    wire GPIO_ready;
    reg[31:0] GPIO_input = 0;
    wire[31:0] GPIO_output;

    // ACC interconnect
    wire CS_ACC;
    wire [7:0] dataOut_ACC;
    wire memDataReady_ACC;
    // Memories' interconnects
    wire CS_IM, CS_DM;
    wire [7:0] dataOut_IM, dataOut_DM ;
    wire memDataReady_IM, memDataReady_DM ;

    wire interrupt_GPIO;
    wire interrupt_ACC;

    assign dataBus_in = (CS_IM == 1) ? dataOut_IM :
                        (CS_DM == 1) ? dataOut_DM :
                        (CS_ACC == 1) ? dataOut_ACC :
                        (CS_GPIO == 1)?dataOut_GPIO : 8'b0;

    assign memReady = (CS_IM == 1) ? memDataReady_IM :
                      (CS_DM == 1) ? memDataReady_DM : 
                      (CS_ACC == 1) ? memDataReady_ACC :
                      (CS_GPIO == 1)?GPIO_ready : 8'b0;

    aftab_core MUT(
        .clk(clk),
        .rst(rst),
        .memReady(memReady),
        .memDataIn(dataBus_in),
        .memDataOut(dataBus_out),
        .memRead(memRead),
        .memWrite(memWrite),
        .memAddr(memAddr),
        .machineExternalInterrupt(interrupt_GPIO | interrupt_ACC),
        .machineTimerInterrupt(machineTimerInterrupt),
        .machineSoftwareInterrupt(machineSoftwareInterrupt),
        .userExternalInterrupt(userExternalInterrupt),
        .userTimerInterrupt(userTimerInterrupt),
        .userSoftwareInterrupt(userSoftwareInterrupt),
        .platformInterruptSignals(platformInterruptSignals),
        .interruptProcessing(interruptProcessing)
    );

    address_decoder DECODER(.address(memAddr), .CS_IM(CS_IM), .CS_DM(CS_DM) , .CS_GPIO(CS_GPIO), .CS_ACC(CS_ACC));

    instruction_memory #(
    .dataWidth(8),
    .addrWidth(12),
    .memSize(4096),
    .cycle(25),
    .timer(5)
    ) IMem(
    .cs(CS_IM),
    .readmem(memRead),
    .address(memAddr[11:0]),
    .dataOut(dataOut_IM),
    .memDataReady(memDataReady_IM)
    );

    data_memory #(
    .dataWidth(8),
    .addrWidth(12),
    .memSize(4096),
    .cycle(25),
    .timer(5)
    ) DMem(
    .cs(CS_DM),
    .readmem(memRead),
    .writemem(memWrite),
    .address(memAddr[11:0]),
    .dataIn(dataBus_out),
    .dataOut(dataOut_DM),
    .memDataReady(memDataReady_DM)
    );

    GPIO gpio (
        .clk(clk),
        .rst(rst),
        .data_i(dataBus_out),
        .data_o(dataOut_GPIO),
        .addr(memAddr),
        .ready(GPIO_ready),
        .cs(CS_GPIO),
        .wr(memWrite),
        .rd(memRead),
        .out(GPIO_output),
        .interrupt(interrupt_GPIO),
        .inp(GPIO_input)
    );

    Accelerator #(
    .dataWidth(8),
    .addrWidth(12)
) ACC(
    .clk(clk),
    .rst(rst),

    .cs(CS_ACC),
    .readmem(memRead),
    .writemem(memWrite),
    .address(memAddr[11:0]),
    .dataIn(dataBus_out),
    .dataOut(dataOut_ACC),
    .memDataReady(memDataReady_ACC),
    .interrupt(interrupt_ACC)
);

    // initial begin
    // 	$dumpfile("test.vcd");
	//     $dumpvars(0,aftab_testbench);
    // end

    always #15 clk = ~ clk;

    initial begin
        rst=1;
        #40;
        rst=0;

        #20000 GPIO_input = 32'd10;

        // #10000;
        // machineExternalInterrupt = 1'b1;
        // $display("Interrupt Triggered at time %t", $time);
        // #1000;
        // machineExternalInterrupt = 1'b0;

      #137000;
        $stop;
    end

  endmodule
