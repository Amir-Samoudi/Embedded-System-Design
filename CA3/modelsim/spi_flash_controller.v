module spi_flash_controller(
    input           clk,
    input           rst,
    input           chipSel,
    input           readMem,
    input  [23:0]   addressBus,
    input  [7:0]    dataIn,
    output [7:0]    dataOut,
    output reg      ready,

    output reg      SCK,
    output reg      CSbar,
    output          DI,
    input           DO
);


localparam [2:0] IDLE               = 3'b000,
                 LOAD_CMD           = 3'b001,
                 CMD_ADR_SEND       = 3'b010,
                 CMD_ADR_CLK        = 3'b011,
                 RECEIVE_DATA       = 3'b100,
                 RECEIVE_DATA_CLK   = 3'b101,
                 DONE               = 3'b110;

reg [2:0] pstate, nstate;

reg ld_cmd;
reg shift_cmd;
reg shift_rdata;
reg en_cnt_32;
reg en_cnt_8;
reg clr_cnt_8;
reg clr_cnt_32;

wire co_32;
wire co_8;

reg [31:0] cmd_adr_shift_reg;
reg [7:0]  rdata_shift_reg;
reg [5:0]  cnt_32;
reg [3:0]  cnt_8;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        cmd_adr_shift_reg <= 32'b0;
    end else begin
        if (ld_cmd) begin
            cmd_adr_shift_reg <= {8'h03, addressBus};
        end else if (shift_cmd) begin
            cmd_adr_shift_reg <= cmd_adr_shift_reg << 1;
        end
    end
end

assign DI = cmd_adr_shift_reg[31];

always @(posedge clk or posedge rst) begin
    if (rst) begin
        rdata_shift_reg <= 8'b0;
    end else begin
        if (shift_rdata) begin
            rdata_shift_reg <= {rdata_shift_reg[6:0], DO};
        end
    end
end

always @(posedge clk or posedge rst) begin
    if (rst) begin
        cnt_32 <= 6'b0;
    end else begin
        if (clr_cnt_32) begin
            cnt_32 <= 6'b0;
        end else if (en_cnt_32) begin
            cnt_32 <= cnt_32 + 1;
        end
    end
end

assign co_32 = (cnt_32 == 6'd31);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        cnt_8 <= 4'b0;
    end else begin
        if (clr_cnt_8) begin
            cnt_8 <= 4'b0;
        end else if (en_cnt_8) begin
            cnt_8 <= cnt_8 + 1;
        end
    end
end

assign co_8 = (cnt_8 == 4'd7);


always @(posedge clk or posedge rst) begin
    if (rst) begin
        pstate <= IDLE;
    end else begin
        pstate <= nstate;
    end
end


always @(*) begin
    nstate = IDLE;
    case (pstate)
        IDLE: begin
            if (chipSel && readMem) begin
                nstate = LOAD_CMD;
            end else begin
                nstate = IDLE;
            end
        end
        LOAD_CMD: begin
            nstate = CMD_ADR_SEND;
        end
        CMD_ADR_SEND: begin
            nstate = CMD_ADR_CLK;
        end
        CMD_ADR_CLK: begin
            if (co_32) begin
                nstate = RECEIVE_DATA;
            end else begin
                nstate = CMD_ADR_SEND;
            end
        end
        RECEIVE_DATA: begin
            nstate = RECEIVE_DATA_CLK;
        end
        RECEIVE_DATA_CLK: begin
            if (co_8) begin
                nstate = DONE;
            end else begin
                nstate = RECEIVE_DATA;
            end
        end
        DONE: begin
            nstate = IDLE;
        end
        default: begin
            nstate = IDLE;
        end
    endcase
end

always @(*) begin
    ld_cmd      = 1'b0;
    shift_cmd   = 1'b0;
    shift_rdata = 1'b0;
    en_cnt_32   = 1'b0;
    en_cnt_8    = 1'b0;
    clr_cnt_8   = 1'b0;
    clr_cnt_32  = 1'b0;
    CSbar       = 1'b1;
    SCK         = 1'b0;
    ready       = 1'b0;

    case (pstate)
        IDLE: ;
        LOAD_CMD: begin
            ld_cmd      = 1'b1;
            CSbar       = 1'b0;
            clr_cnt_32  = 1'b1;
            clr_cnt_8   = 1'b1;
        end
        CMD_ADR_SEND: begin
            CSbar       = 1'b0;
            SCK         = 1'b0;
        end
        CMD_ADR_CLK: begin
            shift_cmd   = 1'b1;
            en_cnt_32   = 1'b1;
            CSbar       = 1'b0;
            SCK         = 1'b1;
        end
        RECEIVE_DATA: begin
            CSbar       = 1'b0;
            SCK         = 1'b0;
        end
        RECEIVE_DATA_CLK: begin
            shift_rdata = 1'b1;
            en_cnt_8    = 1'b1;
            CSbar       = 1'b0;
            SCK         = 1'b1;
        end
        DONE: begin
            ready       = 1'b1;
        end
        default: ;
    endcase
end

assign dataOut = (chipSel && readMem) ? rdata_shift_reg : 8'hZZ;

endmodule
