module address_decoder (
    input [31:0] address,
    output CS_IM, CS_DM , CS_GPIO, CS_ACC
);

    assign CS_IM = (address[31:12] == 20'b0) ? 1 : 0;
    assign CS_DM = (address[31:12] == 20'h00100) ? 1 : 0;
    assign CS_GPIO = (address[31:12] == 20'h00200) ? 1 : 0;
    assign CS_ACC = (address[31:12] == 20'h00300) ? 1 : 0;

endmodule
