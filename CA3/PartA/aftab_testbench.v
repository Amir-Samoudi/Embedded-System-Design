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
    wire machineExternalInterrupt;
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



    // Memories' interconnects
    wire CS_IM, CS_DM;
    wire [7:0] dataOut_IM, dataOut_DM , dataIn_IM ;
    wire memDataReady_IM, memDataReady_DM ;


    assign dataBus_in = (CS_IM == 1) ? dataOut_IM:
                        (CS_DM == 1) ? dataOut_DM: 8'b00000000;


    assign memReady = (CS_IM == 1) ? memDataReady_IM :
                      (CS_DM == 1) ? memDataReady_DM: 1'b0;

    aftab_core#(32) MUT(
        .clk(clk),
        .rst(rst),
        .memReady(memReady),
        .memDataIn(dataBus_in),
        .memDataOut(dataBus_out),
        .memRead(memRead),
        .memWrite(memWrite),
        .memAddr(memAddr),
        .machineExternalInterrupt(machineExternalInterrupt),
        .machineTimerInterrupt(machineTimerInterrupt),
        .machineSoftwareInterrupt(machineSoftwareInterrupt),
        .userExternalInterrupt(userExternalInterrupt),
        .userTimerInterrupt(userTimerInterrupt),
        .userSoftwareInterrupt(userSoftwareInterrupt),
        .platformInterruptSignals(platformInterruptSignals),
        .interruptProcessing(interruptProcessing)
    );

    address_decoder DECODER(.address(memAddr), .CS_IM(CS_IM), .CS_DM(CS_DM));

    wire SCK ,CSbar, DI , DO;

    spi_flash_controller IMem
     (   
        .clk(clk),        
        .rst(rst),        
        .chipSel(CS_IM),    
        .readMem(memRead),    
        .addressBus(memAddr[23:0]), 
        .dataIn(dataIn_IM),     
        .dataOut(dataOut_IM),    
        .ready(memDataReady_IM),      
        
        .SCK(SCK),    
        .CSbar(CSbar),  
        .DI(DI),     
        .DO(DO)     
    );


    virtual_flash #(4096) spi_flash
    (
        .SCK(SCK),    
        .CSbar(CSbar),  
        .DI(DI),     
        .DO(DO)     
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
    

    always #15 clk = ~ clk;

    initial begin
        rst=1;
        #40;
        rst=0;
      #1000000 $stop;
        
        
    end

  endmodule

