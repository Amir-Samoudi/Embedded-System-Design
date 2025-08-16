module spi_pripheral_controller (
    input         clk,         
    input         rst,         
    input  [11:0] mem_addr,    
    input  [7:0]  mem_wdata,   
    output [7:0]  mem_rdata,
    output        ready, 
    output reg    interrupt,   
    input         mem_wr,      
    input         mem_rd, 
    input         chipSel,     

    output           spi_sclk,
    output reg       spi_mosi,
    input            spi_miso,
    output reg       spi_cs
);

    reg ready_cpu_write;
    wire ready_cpu_read;

    reg[31:0] data_from_cpu ;

    parameter [3:0] idle_cpu_write = 4'b0000, transfer_cpu_write = 4'b0001, end_transfer_cpu_write = 4'b1001 , start_transfer_cpu_write = 4'b1010;
    reg [3:0] ps_cpu_write, ns_cpu_write;

    assign spi_sclk = clk;

    reg[4:0] trans_counter;
    reg en_trans_cnt , initz_trans_cnt;
    wire co_trans_cnt; 
    always @(posedge clk , posedge rst) begin
        if (rst) trans_counter <= 5'b0 ;
        else if(initz_trans_cnt) 
            trans_counter <= 5'b0 ;
        else if(en_trans_cnt)
            trans_counter = trans_counter + 1'b1;
    end
    
    assign co_trans_cnt = &{trans_counter} && en_trans_cnt;

    always @(*) begin
        en_trans_cnt = 1'b0 ;
        initz_trans_cnt=1'b0;
        spi_cs = 1'b0;
        case(ps_cpu_write)

            start_transfer_cpu_write :begin spi_mosi = 1'b0;spi_cs = 1'b1; initz_trans_cnt=1'b1;end
              
            transfer_cpu_write : begin en_trans_cnt = 1'b1 ; spi_cs = 1'b1;  end

            default: begin en_trans_cnt = 1'b0 ; initz_trans_cnt=1'b0; spi_cs = 1'b0;end

        endcase
    end

    assign spi_mosi = (ps_cpu_write==transfer_cpu_write)?data_from_cpu[~trans_counter]:
                      (ps_cpu_write==start_transfer_cpu_write)?1'b0:1'b1;

    always @(*) begin    
    
        case(ps_cpu_write)
    
            idle_cpu_write : ns_cpu_write = ((chipSel)&&(mem_addr[3:0] == 3'b111)&&mem_wr) ? start_transfer_cpu_write : idle_cpu_write ;
            start_transfer_cpu_write : ns_cpu_write = transfer_cpu_write;
            transfer_cpu_write : ns_cpu_write = co_trans_cnt? end_transfer_cpu_write: transfer_cpu_write; 
            end_transfer_cpu_write : ns_cpu_write = idle_cpu_write ;
            default: ns_cpu_write = idle_cpu_write;
        endcase
    end

    assign ready_cpu_write = ((chipSel)&&(mem_addr[3:0] <= 3'b111)&&mem_wr) ? 1'b1: 1'b0;
    always @(posedge clk , posedge rst) begin 
        if (rst) ps_cpu_write <= idle_cpu_write;
        else ps_cpu_write <= ns_cpu_write ;
    end

    always @(posedge clk , posedge rst) begin
        if (rst) data_from_cpu <= 8'b0 ;
        else if((chipSel)&&mem_wr) begin
            case (mem_addr[2:0])
                3'b100:data_from_cpu[7:0]   <= mem_wdata ;
                3'b101:data_from_cpu[15:8]  <= mem_wdata ;
                3'b110:data_from_cpu[23:16] <= mem_wdata ;
                3'b111:data_from_cpu[31:24] <= mem_wdata ;
            endcase
             
        end
    end

    reg[7:0]  data_from_Peripheral;
    parameter [3:0] idle_cpu_read = 4'b0000, transfer_cpu_read_0 = 4'b0001, transfer_cpu_read_1 = 4'b0010,transfer_cpu_read_2 = 4'b0011,
                    transfer_cpu_read_3 = 4'b0100, transfer_cpu_read_4 = 4'b0101, transfer_cpu_read_5 = 4'b0110 , transfer_cpu_read_6 = 4'b0111,
                    transfer_cpu_read_7 = 4'b1000, end_transfer_cpu_read = 4'b1001  ;
    reg [3:0] ps_cpu_read, ns_cpu_read;

    always @(*) begin    
    interrupt = 1'b0;
        case(ps_cpu_read)
            idle_cpu_read : ns_cpu_read = (spi_miso==1'b1) ? idle_cpu_read : transfer_cpu_read_0;
            transfer_cpu_read_0 : ns_cpu_read = transfer_cpu_read_1;
            transfer_cpu_read_1 : ns_cpu_read = transfer_cpu_read_2;
            transfer_cpu_read_2 : ns_cpu_read = transfer_cpu_read_3;
            transfer_cpu_read_3 : ns_cpu_read = transfer_cpu_read_4;
            transfer_cpu_read_4 : ns_cpu_read = transfer_cpu_read_5;
            transfer_cpu_read_5 : ns_cpu_read = transfer_cpu_read_6;
            transfer_cpu_read_6 : ns_cpu_read = transfer_cpu_read_7;
            transfer_cpu_read_7 : ns_cpu_read = end_transfer_cpu_read ;
            end_transfer_cpu_read : begin ns_cpu_read = ((chipSel)&&(mem_addr[1:0] == 2'b00)&& mem_rd) ? idle_cpu_read : end_transfer_cpu_read; interrupt = 1'b1 ; end
            default: begin ns_cpu_read = idle_cpu_read; interrupt = 1'b0; end
        endcase
    end


    assign ready_cpu_read = ((chipSel)&&(mem_addr[1:0] <= 2'b11)&& mem_rd)? 1'b1 : 1'b0;
    assign mem_rdata = (mem_addr[1:0] == 2'b00)? data_from_Peripheral:
                       (mem_addr[1:0] == 2'b01)? 8'b00000000:
                       (mem_addr[1:0] == 2'b10)? 8'b00000000:
                       (mem_addr[1:0] == 2'b11)? 8'b00000000:8'bz ;
    
    always @(posedge clk , posedge rst) begin 
        if (rst) ps_cpu_read <= idle_cpu_read;
        else ps_cpu_read <= ns_cpu_read ;
    end

    always @(posedge clk , posedge rst) begin 
        if (rst) data_from_Peripheral <= 8'b0;
        else begin
            case(ps_cpu_read)
                transfer_cpu_read_0 : data_from_Peripheral[7] = spi_miso;
                transfer_cpu_read_1 : data_from_Peripheral[6] = spi_miso;
                transfer_cpu_read_2 : data_from_Peripheral[5] = spi_miso;
                transfer_cpu_read_3 : data_from_Peripheral[4] = spi_miso;
                transfer_cpu_read_4 : data_from_Peripheral[3] = spi_miso;
                transfer_cpu_read_5 : data_from_Peripheral[2] = spi_miso;
                transfer_cpu_read_6 : data_from_Peripheral[1] = spi_miso;
                transfer_cpu_read_7 : data_from_Peripheral[0] = spi_miso;
            endcase 
        end
    end

    assign ready = ready_cpu_read || ready_cpu_write;

endmodule









