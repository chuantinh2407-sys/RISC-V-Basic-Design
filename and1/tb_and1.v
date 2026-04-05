
`timescale 1ns / 1ps

module tb_and1;
   
    reg ta, tb;
    wire ty;
    integer i;
   
    and1 uut (
        .a(ta),
        .b(tb),
        .y(ty)
    );
 
    initial  begin
    $monitor("At time %t: a=%b, b=%b, y=%b", $time, ta, tb, ty);
     
        for (i = 0; i < 4; i = i + 1) begin   
            {ta, tb} = i;  
            #10;      
        end
        $stop;
    end
    initial begin
    $dumpfile("and1.vcd"); // Tạo file chứa dữ liệu sóng
    $dumpvars(0, tb_and1);  // Ghi lại tất cả biến trong module tb_and1
end
endmodule
