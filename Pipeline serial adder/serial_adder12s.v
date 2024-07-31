module serial_adder12s( clk,enable, n, sum, sum_valid,result);

input clk;
input enable;
input [11:0] n;
output [14:0] sum;
output sum_valid;
output [14:0] result;

wire [14:0] sum_next;
wire [2:0] cnt_next;
wire sum_val;

reg [14:0] sum;
reg [2:0] cnt;
reg sum_valid;
reg [14:0] result;

assign sum_next[14:0] = enable ? ({{3{n[11]}}, n[11:0]} + sum[14:0]):0;
assign cnt_next[2:0] = enable ? (cnt+1):0;
assign sum_val = (cnt==7) ? 1:0;
always @(posedge clk)
begin 
	sum[14:0] <= sum_next[14:0];
	cnt[2:0] <= cnt_next[2:0];
	sum_valid <= sum_val;
end

always @(posedge clk)
	result [14:0] <= sum_valid ? sum[14:0] : result[14:0];
	
endmodule