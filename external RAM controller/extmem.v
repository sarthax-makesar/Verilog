`define max_drpixaddr 65535
module extmem( clk_out, reset_n,hold,addr,endram,rwn,ce_n,wr_n,oe_n);

	input clk_out;
	input reset_n;
	input hold;
	input endram;
	output [15:0] addr;
	output rwn;
	output ce_n;
	output wr_n;
	output oe_n;
	
	wire [15:0] addr;
	wire ce_n;
	reg	rwn;
	reg wr_n;
	reg oe_n;
	reg [15:0] drwaddr;
	reg [15:0] drraddr;
	wire [15:0] drwaddr_next;
	wire [15:0] drraddr_next;
	wire enwaddr;
	wire enwr_cnt;
	wire enraddr;
	wire wr_cnt_next;
	wire res_addr;
	wire res_waddr;
	
	reg wr_cnt;
	wire enrd_cnt;
	wire rd_cnt_next;
	reg rd_cnt;
	wire res_raddr;
	
assign res_addr = (addr==`max_drpixaddr)&((wr_cnt==1'b1)|(rd_cnt==1'b1))&(ce_n==1'b0);

always @(posedge clk_out or negedge reset_n)
begin
	if(reset_n ==1'b0)
		rwn <= 1'b0;
	else if(hold ==1'b1)
		rwn <= rwn;
	else if(res_addr == 1'b1)
		rwn <= !rwn;
	else 
		rwn <=rwn;
end

assign enwr_cnt = (endram ==1'b1)&(rwn ==1'b0)&(ce_n==1'b0);
always@(negedge clk_out or negedge reset_n)
begin 
	if(reset_n == 1'b0)
		wr_n <= 1'b1;
	else if(hold==1'b1)
		wr_n <=wr_n;
	else if(enwr_cnt ==1'b1)
		wr_n <= ~wr_n;
	else 
	wr_n <= 1'b1;
end
assign wr_cnt_next =wr_cnt+1;
always @(posedge clk_out or negedge reset_n)
begin
	if(reset_n ==1'b0)
		wr_cnt <= 1'b0;
	else if(hold == 1'b1)
		wr_cnt <= wr_cnt;
	else if(wr_cnt==1'b1)
		wr_cnt <= 1'b0;
	else if(enwr_cnt == 1'b1)
		wr_cnt <= wr_cnt_next;
	else 
		wr_cnt <= wr_cnt;
end
 assign drwaddr_next = drwaddr+1;
 assign enwaddr = (endram== 1'b1)&(rwn==1'b0)&(wr_cnt==1'b1)&(ce_n==1'b0);
 assign res_wddr=(drwaddr == `max_drpixaddr)&(wr_cnt==1'b1)&(ce_n==1'b0);
 always @(posedge clk_out or negedge reset_n)
 begin 
	if(reset_n==1'b0)
		drwaddr <= 16'd0;
	else if(hold==1'b1)
		drwaddr <= drwaddr;
	else if(res_waddr==1'b1)
		drwaddr <= 16'd0;
	else if(enwaddr ==1'b1)
		drwaddr <= drwaddr_next;
	else
		drwaddr <=  drwaddr;
end
assign rd_cnt_next = rd_cnt_next+1;
assign enrd_cnt = (endram ==1'b1) & (rwn==1'b1) & (ce_n==1'b0);
always @(posedge clk_out or negedge reset_n)
begin
	if(reset_n==1'b0)
		rd_cnt <= 1'b0;
	else if(hold == 1'b1)
		rd_cnt <= rd_cnt;
	else if(rd_cnt==1'b1)
		rd_cnt<=1'b0;
	else if(enrd_cnt==1'b1)
		rd_cnt <= rd_cnt_next;
	else 
		rd_cnt <= rd_cnt;
end

assign drraddr_next=drraddr+1; 
assign enraddr=(endram ==1'b1) & (rwn==1'b1) & (rd_cnt==1'b1) & (ce_n==1'b0);
always @(posedge clk_out or negedge reset_n)
begin
	if(reset_n==1'b0)
		drraddr <= 16'd0;
	else if(hold == 1'b1)
		drraddr <= drraddr;
	else if(res_raddr ==1'b1)
		drraddr <=16'd0;
	else if(enraddr ==1'b1)
		drraddr <= drraddr_next;
	else 
		drraddr <=drraddr;
end
always @(negedge clk_out or negedge reset_n)
begin
	if(reset_n==1'b0)
		oe_n <= 1'b1;
	else if (hold==1'b1)
		oe_n <= oe_n;
	else if(enrd_cnt==1'b1)
		oe_n<= !oe_n;
	else
		oe_n <= 1'b1;
end
assign addr=(rwn==1'b0) ? drwaddr : drraddr;
assign ce_n = (addr<= `max_drpixaddr) ?1'b0 :1'b1;
endmodule
