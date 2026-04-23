module mux ( 
    input logic [3:0][31:0] in, 
    input logic [1:0] sel,
    output logic [31:0] out
);
    assign out = in[(sel)];
endmodule