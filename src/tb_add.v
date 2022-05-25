`timescale 1ns/1ps
module tb_add ;

    reg a;
    reg b;
    reg clk;
    wire c;

    add add_u(.a(a),.b(b),.c(c));
    always #5 clk = ~clk;

    initial begin
        clk = 0;
    end

    initial begin
        a <= 0;
        b <= 0;
        #100
        a <= 1;
        b <= 1;
        #100
        $finish;
    end

    initial begin
	    $dumpfile("./build/wave.vcd");  // 指定VCD文件的名字为wave.vcd，仿真信息将记录到此文件
	    $dumpvars(0, tb_add );  // 指定层次数为0，则tb_add 模块及其下面各层次的所有信号将被记录
	    //#10000 $finish;
    end

    //编译命令 iverilog -o ./build/a.out ./src/tb_add.v ./src/add.v 
    //vvp -n ./build/a.out 生成.vcd波形文件
    //gtkwave ./build/wave.vcd 用gtkwave.exe打开.vcd文件

    //F1 + verilog:instantiate自动例化
    
endmodule