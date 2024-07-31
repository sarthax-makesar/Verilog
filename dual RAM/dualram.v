`include "ram_rc.v"
module dualram(clk,pci_clk,rnw,be,ra,wa,di,di_valid,do);

input clk;
input pci_clk;
input rnw;
input di_valid;
input [7:0] be;
input	[2:0] ra,wa;
input [63:0] di;
output [63:0] do;

wire switch_bank;

wire [63:0] do1;
wire [63:0] do2;
wire [63:0] do_next;

reg [63:0] do;
reg rnw_delay;


assign switch_bank = ~rnw;

ram_rc ram1(.clk(clk),
				.pci_clk(pci_clk),
				.rnw(rnw),
				.be(be),
				.ra(ra),
				.wa(wa),
				.di(di),
				.di_valid(di_valid),
				.do(do1));
				
ram_rc ram2(.clk(clk),
				.pci_clk(pci_clk),
				.rnw(rnw),
				.be(be),
				.ra(ra),
				.wa(wa),
				.di(di),
				.di_valid(di_valid),
				.do(do2));

assign do_next = (rnw_delay)?do2:do1;
always @(posedge clk)
begin
	rnw_delay <=rnw;
	do <= do_next;
end

endmodule