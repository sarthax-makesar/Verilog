`timescale 1ns/1ns
module Top;
    reg PA,PB,PCi;
    wire PCo, PSum;
    FA_Seq F1(PA,PB,PCi, PSum, PCo);
    initial 
    begin : ONLY_ONES
        reg[3:0] Pal;
        for(Pal = 0; Pal<8; Pal =Pal+1)
            begin
                {PA,PB,PCi} = Pal;
                #5 $display("PA,PB,PCi=%b%b%b",PA,PB,PCi,":::PCo, PSum= %b%b", PCo,PSum);
            end
     end
endmodule
