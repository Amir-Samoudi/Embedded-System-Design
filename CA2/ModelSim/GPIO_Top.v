`timescale 1ns/1ns
module GPIO 
(
    clk,
    rst,
    data_i,
    data_o,
    addr,
    ready,
    cs,
    wr,
    rd,
    out,
    interrupt,
    inp
);
    input clk , rst;
    input[7 : 0] data_i;
    output reg [7 : 0] data_o;
    input[31 : 0] addr;
    output reg ready;
    output reg interrupt;
    input cs , wr , rd;
    output [31 : 0] out;
    input[31 : 0] inp;

    reg[31 : 0] out_to_cpu , in_from_cpu  , status;
    reg[31 : 0] ctr = 32'h00000001;
    wire int_en , read_int ;
    reg rst_int;


    always @(cs, rd, wr, addr) begin
        if (cs && (rd || wr)) begin
            ready = 1'b0;
            #(5) ready <= 1'b1;
            #(25) ready <= 1'b0;
        end else begin
            ready = 1'b0;
        end
    end

    always @(posedge clk , posedge rst) begin
        if(rst) 
            in_from_cpu = 32'b0 ;       
        else begin
            if(cs & wr & (addr[3:2] == 2'b00) ) begin
            case (addr[1:0])
                2'b00: in_from_cpu[7:0] <= data_i;
                2'b01: in_from_cpu[15:8] <= data_i;
                2'b10: in_from_cpu[23:16] <= data_i;
                2'b11: in_from_cpu[31:24] <= data_i;
            endcase
            end  
        end
    end

    always @(posedge clk , posedge rst) begin
          
        if(cs & wr & (addr[3:2] == 2'b01) ) begin
        case (addr[1:0])
            2'b00: ctr[7:0] <= data_i;
            2'b01: ctr[15:8] <= data_i;
            2'b10: ctr[23:16] <= data_i;
            2'b11: ctr[31:24] <= data_i;
        endcase
        end  
        
    end

    always @(posedge clk , posedge rst) begin
        if(rst) 
            out_to_cpu = 32'b0;
        else 
            out_to_cpu = inp;
    end


    always @(posedge clk , posedge rst) begin
        if(rst) 
            status = 32'b0 ;    
        else begin
            if(interrupt)
                status[0] = 1'b1; // int_sts   
            else if(rst_int) 
                status[0] = 1'b0;        
        end
    end

    assign int_en = ctr[0];


    always @(*) begin
        if (int_en & (|{(out_to_cpu)^(inp)})) begin
            interrupt = 1'b0;
            #(5) interrupt <= 1'b1;
            #(5000) interrupt <= 1'b0;
        end else begin
            interrupt = 1'b0;
        end
    end

    //assign interrupt = int_en & (|{(out_to_cpu)^(inp)});
    assign read_int = (cs & rd)&(addr[3:0] == 4'b1000); 
    reg ps , ns;

    always @(*) begin
        rst_int = 1'b0;
        ns = 1'b0;
        case(ps)
            1'b0: begin ns = read_int?1'b1:1'b0; end
            1'b1: begin ns = read_int?1'b1:1'b0; rst_int = ~read_int ;end
            default: ns = 1'b0;
        endcase
    end

    always @(posedge clk , posedge rst) begin
        if(rst) 
            ps = 1'b0 ;    
        else       
            ps <= ns;
    end

    //     addr     | register
    // -------------|---------
    //  0000 - 0011 | in_from_cpu   write only
    //  0100 - 0111 | ctr           write only
    //  1000 - 1011 | status        read only
    //  1100 - 1111 | out_to_cpu    read only

    always @(cs, rd, addr) begin
        if (cs && rd ) begin
            data_o = 8'bz;
            #(5) 
                data_o = ((rd&cs)&(addr[3:0] == 4'b1000))?status[7:0]:
                    ((rd&cs)&(addr[3:0] == 4'b1001))?status[15:8]:
                    ((rd&cs)&(addr[3:0] == 4'b1010))?status[23:16]:
                    ((rd&cs)&(addr[3:0] == 4'b1011))?status[31:24]:
                    ((rd&cs)&(addr[3:0] == 4'b1100))?out_to_cpu[7:0]:
                    ((rd&cs)&(addr[3:0] == 4'b1101))?out_to_cpu[15:8]:
                    ((rd&cs)&(addr[3:0] == 4'b1110))?out_to_cpu[23:16]:
                    ((rd&cs)&(addr[3:0] == 4'b1111))?out_to_cpu[31:24]:
                    32'bz;
            #(25) data_o <= 8'bz;
        end else begin
            data_o = 8'bz;
        end
    end


    // assign data_o = ((rd&cs)&(addr[3:0] == 4'b1000))?status[7:0]:
    //                 ((rd&cs)&(addr[3:0] == 4'b1001))?status[15:8]:
    //                 ((rd&cs)&(addr[3:0] == 4'b1010))?status[23:16]:
    //                 ((rd&cs)&(addr[3:0] == 4'b1011))?status[31:24]:
    //                 ((rd&cs)&(addr[3:0] == 4'b1100))?out_to_cpu[7:0]:
    //                 ((rd&cs)&(addr[3:0] == 4'b1101))?out_to_cpu[15:8]:
    //                 ((rd&cs)&(addr[3:0] == 4'b1110))?out_to_cpu[23:16]:
    //                 ((rd&cs)&(addr[3:0] == 4'b1111))?out_to_cpu[31:24]:
    //                 32'bz;
   
    assign out = in_from_cpu;

endmodule
