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

    // SPI
    wire CS_SPI,interrupt_SPI,memDataReady_SPI;
    wire[7:0] dataOut_SPI;

    assign dataBus_in = (CS_IM == 1) ? dataOut_IM:
                        (CS_DM == 1) ? dataOut_DM:
                        (CS_SPI == 1)? dataOut_SPI:8'b00000000;


    assign memReady = (CS_IM == 1) ? memDataReady_IM :
                      (CS_DM == 1) ? memDataReady_DM:
                      (CS_SPI == 1)? memDataReady_SPI:1'b0;

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

    assign machineExternalInterrupt = interrupt_SPI;
    address_decoder DECODER(.address(memAddr), .CS_IM(CS_IM), .CS_DM(CS_DM) , .CS_SPI(CS_SPI));

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

    // data_memory #(
    // .dataWidth(8),
    // .addrWidth(12),
    // .memSize(4096),
    // .cycle(25),
    // .timer(5)
    // ) DMem(
    // .cs(CS_DM),
    // .readmem(memRead),
    // .writemem(memWrite),
    // .address(memAddr[11:0]),
    // .dataIn(dataBus_out),
    // .dataOut(dataOut_DM),
    // .memDataReady(memDataReady_DM)
    // );

    // SRAM data memory
    M31HDSP200GB180W_4096X8X1CM16 DMem  
	(
		.CLK(clk),	
		.CEN((~CS_DM)),	
		.WEN((~memWrite)),	
		.A(memAddr[11:0]),	
		.D(dataBus_out),	
		.Q(dataOut_DM)	
	);

    Sram_ready_generator#(12) rg(
    .clk(clk),
    .rst(rst),
    .cen(CS_DM),       
    .ready(memDataReady_DM),
    .address(memAddr[11:0])
    );
    

    wire spi_mosi,spi_cs,spi_sclk;
    reg spi_miso;

    spi_pripheral_controller spi_pripheral(
        .clk(clk),         
        .rst(rst),         
        .mem_addr(memAddr[11:0]),    
        .mem_wdata(dataBus_out),   
        .mem_rdata(dataOut_SPI),
        .ready(memDataReady_SPI), 
        .interrupt(interrupt_SPI),   
        .mem_wr(memWrite),      
        .mem_rd(memRead), 
        .chipSel(CS_SPI),
        .spi_sclk(spi_sclk),
        .spi_mosi(spi_mosi),
        .spi_miso(spi_miso),
        .spi_cs(spi_cs)
    );
    

    always #15 clk = ~ clk;

        initial begin
        spi_miso = 1'b1;
        rst=1;
        #40;
        rst=0;
        #1000000
        spi_miso = 1'b1;
        #30;
        spi_miso = 1'b0;
        #30;
        /// 10 = 00001010
        spi_miso = 1'b0;
        #30;
        spi_miso = 1'b0;
        #30;
        spi_miso = 1'b0;
        #30;
        spi_miso = 1'b0;
        #30;
        spi_miso = 1'b1;
        #30;
        spi_miso = 1'b0;
        #30;
        spi_miso = 1'b1;
        #30;
        spi_miso = 1'b0;
        ///
        #30;
        spi_miso = 1'b1;
        #30;
        spi_miso = 1'b1;
        
        #100000 $stop;
    end

  endmodule

