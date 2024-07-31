module ram_rc(clk,pci_clk,rnw,be,ra,wa,di,di_valid,do);

input clk;
input pci_clk;
input rnw;
input di_valid;
input [7:0] be;
input	[2:0] ra,wa;
input [63:0] di;
output [63:0] do;

reg [63:0] do;

wire [63:0] mem_data;
wire [64:0] do_next;
wire [2:0] addr;
wire [63:0] loc0;
wire [63:0] loc1;
wire [63:0] loc2;
wire [63:0] loc3;
wire [63:0] loc4;
wire [63:0] loc5;
wire [63:0] loc6;
wire [63:0] loc7;

wire be0;
wire be1;
wire be2;
wire be3;
wire be4;
wire be5;
wire be6;
wire be7;

reg [63:0] coloumn;
reg [63:0] mem[7:0];

assign addr = (rnw)?wa:ra;
assign mem_data = mem[addr];

assign loc0 = mem[0];
assign loc1 = mem[1];
assign loc2 = mem[2];
assign loc3 = mem[3];
assign loc4 = mem[4];
assign loc5 = mem[5];
assign loc6 = mem[6];
assign loc7 = mem[7];

always @(addr or loc0 or loc1 or loc2 or loc3 or loc4 or loc5 or loc6 or loc7)
begin
case(addr)
3'b000:
coloumn = {loc0[63:56], loc1[63:56],loc2[63:56], loc3[63:56],loc4[63:56], loc5[63:56], loc6[63:56], loc7[63:56]};
3'b001:
coloumn = {loc0[55:48], loc1[55:48],loc2[55:48], loc3[55:48],loc4[55:48], loc5[55:48], loc6[55:48], loc7[55:48]};
3'b010:
coloumn = {loc0[47:40], loc1[47:40],loc2[47:40], loc3[47:40],loc4[47:40], loc5[47:40], loc6[47:40], loc7[47:40]};
3'b011:
coloumn = {loc0[39:32], loc1[39:32],loc2[39:32], loc3[39:32],loc4[39:32], loc5[39:32], loc6[39:32], loc7[39:32]};
3'b100:
coloumn = {loc0[31:24], loc1[31:24],loc2[31:24], loc3[31:24],loc4[31:24], loc5[31:24], loc6[31:24], loc7[31:24]};
3'b101:
coloumn = {loc0[23:16], loc1[23:16],loc2[23:16], loc3[23:16],loc4[23:16], loc5[23:16], loc6[23:16], loc7[23:16]};
3'b110:
coloumn = {loc0[15:8], loc1[15:8],loc2[15:8], loc3[15:8],loc4[15:8], loc5[15:8], loc6[15:8], loc7[15:8]};
3'b111:
coloumn = {loc0[7:0], loc1[7:0],loc2[7:0], loc3[7:0],loc4[7:0], loc5[7:0], loc6[7:0], loc7[7:0]};
endcase
end

assign be7 = (!be[7])& rnw & di_valid;
assign be6 = (!be[6])& rnw & di_valid;
assign be5 = (!be[5])& rnw & di_valid;
assign be4 = (!be[4])& rnw & di_valid;
assign be3 = (!be[3])& rnw & di_valid;
assign be2 = (!be[2])& rnw & di_valid;
assign be1 = (!be[1])& rnw & di_valid;
assign be0 = (!be[0])& rnw & di_valid;

always @(posedge pci_clk)
begin 
mem[addr] <= {((be7) ? di[63:56]:mem_data[63:56]),((be6) ? di[55:48]: mem_data[55:48]),((be5) ? di[47:40] : mem_data[47:40]),((be4) ? di[39:32] : mem_data[39:32]),((be3) ? di[31:24] : mem_data[31:24]),((be2) ? di[23:16] : mem_data[23:16]),((be1) ? di[15:8] : mem_data[15:8]), ((be0) ? di[7:0] : mem_data[7:0])};
end

assign do_next = (rnw) ? do: coloumn;

always @(posedge clk)
	do <= do_next;
endmodule