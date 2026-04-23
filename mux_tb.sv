`timescale 1ns/1ps

module mux_tb;
   
    logic [3:0][31:0] in_tb;
    logic [1:0]       sel_tb;
    logic [31:0]      out_tb;

    // Gọi module thiết kế
    mux dut (
        .in(in_tb),
        .sel(sel_tb),
        .out(out_tb)
    );

    // Khối tạo kịch bản kiểm tra
    initial begin
        // 1. Cấu hình để xem trên GTKWave
        $dumpfile("MUX/waves.vcd");
        $dumpvars(0, mux_tb);

        // 2. Khởi tạo dữ liệu nhị phân 32-bit cho 4 kênh
        // Mỗi kênh cách nhau một vài bit để Thức dễ quan sát sự thay đổi
        in_tb[0] = 32'b11110000_11110000_11110000_11110000;
        in_tb[1] = 32'b00001111_00001111_00001111_00001111;
        in_tb[2] = 32'b10101010_10101010_10101010_10101010;
        in_tb[3] = 32'b01010101_01010101_01010101_01010101;

        $display("--------------------------------------------------");
        $display("Time\t Sel\t Output Value (Binary)");
        $display("--------------------------------------------------");

        // 3. Vòng lặp tự động quét qua 4 kênh để kiểm tra
        for (int i = 0; i < 4; i++) begin
            sel_tb = i;
            #10; // Đợi 10 đơn vị thời gian để logic cập nhật
            
            // In kết quả ra Terminal của VS Code để kiểm tra nhanh
            $display("%t\t %b\t %b", $time, sel_tb, out_tb);
        end

        // 4. Kết thúc mô phỏng
        #10;
        $display("--------------------------------------------------");
        $display("Simulation complete. Open GTKWave to see waveforms.");
        $finish;
    end

endmodule