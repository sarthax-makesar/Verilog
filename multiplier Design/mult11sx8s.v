module mult11sx8s(clk, n1,n2,result);

input clk;
input [10:0] n1;
input [7:0] n2;
output [18:0] result;

wire n1orn2z;
wire [10:0] p1,p2,p3,p4,p5,p6,p7,p8;
wire [6:0] s11a,s12a,s13a,s14a;
wire [5:0] s11b,s12b,s13b,s14b;
wire [12:0] s11,s12,s13,s14;
wire [7:0] s21a,s22a;
wire [6:0] s21b,s22b;
wire [14:0] s21,s22;
wire [8:0] s31a;
wire [7:0] s31b;
wire [17:0] s31;
wire res_sign;
wire [18:0] res;

reg [10:0] n1_mag;
reg [7:0] n2_mag;
reg [10:0] p1_reg1,p2_reg1,p3_reg1,p4_reg1,p5_reg1,p6_reg1,p7_reg1,p8_reg1;
reg [6:0] s11a_reg2, s12a_reg2,s13a_reg2,s14a_reg2;
reg n1_reg1;
reg n1_reg2;
reg n1_reg3;
reg n1_reg4;
reg n1_reg5;
reg n1_reg6;
reg n1_reg7;
reg n2_reg1;
reg n2_reg2;
reg n2_reg3;
reg n2_reg4;
reg n2_reg5;
reg n2_reg6;
reg n2_reg7;

reg n1orn2z_reg1;
reg n1orn2z_reg2;
reg n1orn2z_reg3;
reg n1orn2z_reg4;
reg n1orn2z_reg5;
reg n1orn2z_reg6;
reg n1orn2z_reg7;

reg [10:0] p1_reg2,p2_reg2,p3_reg2,p4_reg2,p5_reg2,p6_reg2,p7_reg2,p8_reg2;
reg [12:0] s11_reg3,s12_reg3,s13_reg3,s14_reg3,s11_reg4,s12_reg4,s13_reg4,s14_reg4;
reg [7:0] s21a_reg4,s22a_reg4;
reg [14:0] s21_reg5,s22_reg5,s21_reg6,s22_reg6;
reg [8:0] s31a_reg6;
reg [17:0] s31_reg7;
reg [18:0] result;

always @(n1)
begin 
	if(n1[10]==1'b0)                                     //MSB condition
		n1_mag = n1[10:0];
	else
		n1_mag= ~n1[10:0]+1;
end

always @(n2)
begin 
	if(n2[7] == 1'b0)                                    //MSB condition
		n2_mag = n2[7:0];
	else
		n2_mag = ~n2[7:0]+1;
end

assign n1orn2z = ((n1== 11'b0)||(n2 == 7'b0)) ? 1'b1 : 1'b0;
assign p1 = n1_mag[10:0] & {11{n2_mag[0]}};
assign p2 = n1_mag[10:0] & {11{n2_mag[1]}};
assign p3 = n1_mag[10:0] & {11{n2_mag[2]}};
assign p4 = n1_mag[10:0] & {11{n2_mag[3]}};
assign p5 = n1_mag[10:0] & {11{n2_mag[4]}};
assign p6 = n1_mag[10:0] & {11{n2_mag[5]}};
assign p7 = n1_mag[10:0] & {11{n2_mag[6]}};
assign p8 = n1_mag[10:0] & {11{n2_mag[7]}};

always @(posedge clk) 											// first pipeline reg at clk1
begin
	p1_reg1 <= p1;
	p2_reg1 <= p2;
	p3_reg1 <= p3;
	p4_reg1 <= p4;
	p5_reg1 <= p5;
	p6_reg1 <= p6;
	p7_reg1 <= p7;
	p8_reg1 <= p8;
	n1_reg1 <= n1[10];
	n2_reg1 <= n2[7];
	n1orn2z_reg1 <= n1orn2z;
end

assign s11a[6:0] = p1_reg1[6:1]+p2_reg1[5:0];			//LSB added after lefft shif
assign s12a[6:0] = p3_reg1[6:1]+p4_reg1[5:0];
assign s13a[6:0] = p5_reg1[6:1]+p6_reg1[5:0];
assign s14a[6:0] = p7_reg1[6:1]+p8_reg1[5:0];

always @(posedge clk)											// Second pipelined reg at clk2
begin 
	s11a_reg2 <= s11a;											// store LSB partial sum
	s12a_reg2 <= s12a;
	s13a_reg2 <= s13a;
	s14a_reg2 <= s14a;
	p1_reg2[10:7] <= p1_reg1[10:7];
	p2_reg2[10:7] <= p2_reg1[10:7];
	p3_reg2[10:7] <= p3_reg1[10:7];
	p4_reg2[10:7] <= p4_reg1[10:7];
	p5_reg2[10:7] <= p5_reg1[10:7];
	p6_reg2[10:7] <= p6_reg1[10:7];
	p7_reg2[10:7] <= p7_reg1[10:7];
	p8_reg2[10:7] <= p8_reg1[10:7];
	p1_reg2[0] <= p1_reg1[0];									//store 0th bit since it is mot processed
	p3_reg2[0] <= p3_reg1[0];
	p5_reg2[0] <= p5_reg1[0];
	p7_reg2[0] <= p7_reg1[0];
	n1_reg2 <= n1_reg1;
	n2_reg2 <= n2_reg1;
	n1orn2z_reg2 <= n1orn2z_reg1;
end

assign s11b[5:0] = {1'b0,p1_reg2[10:7]} + p2_reg2[10:6] + s11a_reg2[6];		//MSB added with carry
assign s12b[5:0] = {1'b0,p3_reg2[10:7]} + p4_reg2[10:6] + s12a_reg2[6];
assign s13b[5:0] = {1'b0,p5_reg2[10:7]} + p6_reg2[10:6] + s13a_reg2[6];
assign s14b[5:0] = {1'b0,p7_reg2[10:7]} + p8_reg2[10:6] + s14a_reg2[6];

assign s11[12:0] = {s11b,s11a_reg2[5:0], p1_reg2[0]};			//MSB and LSB concatenated MSB,LSB,0th bit
assign s12[12:0] = {s12b,s12a_reg2[5:0], p3_reg2[0]};
assign s13[12:0] = {s13b,s13a_reg2[5:0], p5_reg2[0]};
assign s14[12:0] = {s14b,s14a_reg2[5:0], p7_reg2[0]};

always @(posedge clk)											// third pipeline reg at clk3
begin
	s11_reg3 <= s11;
	s12_reg3 <= s12;
	s13_reg3 <= s13;
	s14_reg3 <= s14;
	n1_reg3 <= n1_reg2;
	n2_reg3 <= n2_reg2;
	n1orn2z_reg3 <= n1orn2z_reg2;
end
assign s21a[7:0] = s11_reg3[8:2] + s12_reg3[6:0];  	//s21a 7th bit is carry
assign s22a[7:0] = s13_reg3[8:2] + s14_reg3[6:0];

always @(posedge clk) 											// fourth pipeline reg clk4
begin 
	s11_reg4[12:9] <= s11_reg3[12:9]; 
	s11_reg4[1:0] <=s11_reg3[1:0]; 
	s12_reg4[12:7] <= s12_reg3[12:7];
	s13_reg4[12:9] <= s13_reg3[12:9];
	s13_reg4[1:0] <= s13_reg3[1:0];
	s14_reg4[12:7] <= s14_reg3[12:7];
	s21a_reg4 <= s21a;
	s22a_reg4 <= s22a;
	n1_reg4 <= n1_reg3;
	n2_reg4 <= n2_reg3;
	n1orn2z_reg4 <= n1orn2z_reg3;
end

assign s21b[6:0] = {2'b0,s11_reg4[12:9]} + s12_reg4[12:7] + s21a_reg4[7];
assign s22b[6:0] = {2'b0,s13_reg4[12:9]} + s14_reg4[12:7] + s22a_reg4[7];
assign s21[14:0] = {s21b[5:0], s21a_reg4[6:0], s11_reg4[1:0]};						// MSB,LSB, [1:0]
assign s22[14:0] = {s22b[5:0], s22a_reg4[6:0], s13_reg4[1:0]};

always @(posedge clk)											// fifth pipeline reg at clk5
begin 	
	s21_reg5 <= s21;
	s22_reg5 <= s22;
	n1_reg5 <= n1_reg4;
	n2_reg5 <= n2_reg4;
	n1orn2z_reg5 <= n1orn2z_reg4;
end

assign s31a[8:0] = s21_reg5[11:4] + s22_reg5[7:0];	 // third stage LSB compute

always @(posedge clk)										 // sixth pipeline reg at clk6
begin 
	s21_reg6[14:12] <= s21_reg5[14:12];
	s22_reg6[14:8] <= s22_reg5[14:8];
	s21_reg6[3:0] <= s21_reg5[3:0];
	s31a_reg6 <= s31;
	n1_reg6 <= n1_reg5;
	n2_reg6 <= n2_reg5;
	n1orn2z_reg6 <= n1orn2z_reg5;
end

assign s31b[7:0] = {4'b0,s21_reg6[14:12]} + s22_reg6[14:8] + s31a_reg6[8];  //third stage MSB
assign s31[17:0] = {s31b[5:0], s31a_reg6[7:0], s21_reg6[3:0]};

always @(posedge clk)										// seventh stage pipeline at clk7
begin 
	n1_reg7 <= n1_reg6;
	n2_reg7 <= n2_reg6;
	s31_reg7 <= s31;
	n1orn2z_reg7 <= n1orn2z_reg6;
end

assign res_sign = n1_reg7^n2_reg7;
assign res[18:0] = (res_sign) ? {1'b1,(~s31_reg7 + 1'b1)} : {1'b0, s31_reg7};

always @(posedge clk)
begin 
	if(n1orn2z_reg7 == 1'b1)
		result[18:0] <= 19'b0;
	else 
		result[18:0] <= res;
end
endmodule