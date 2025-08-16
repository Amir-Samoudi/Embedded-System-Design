module address_decoder (
    input [31:0] address,
    output CS_IM, CS_DM ,CS_SPI 
);

    assign CS_IM = (address[31:12] == 20'b0) ? 1 : 0;
    assign CS_DM = (address[31:12] == 20'h00100) ? 1 : 0;
    assign CS_SPI = (address[31:12] == 20'h10000) ? 1 : 0;

endmodule