module full_adder (
    input a, b, cin,
    output sum, cout
);
    wire s1, c1, c2;

    // Gọi bộ Half Adder thứ nhất (Instantiate)
    // Mục đích: Cộng a và b để lấy kết quả tạm thời s1
    half_adder HA1 (
        .a(a), 
        .b(b), 
        .sum(s1), 
        .carry(c1)
    );
    
    // Gọi bộ Half Adder thứ hai
    // Ý nghĩa: Cộng kết quả s1 với số nhớ cin từ hàng trước
    half_adder HA2 (
        .a(s1), 
        .b(cin), 
        .sum(sum), 
        .carry(c2)
    );

    // Cổng OR để tổng hợp số nhớ cuối cùng
    assign cout = c1 | c2;

endmodule