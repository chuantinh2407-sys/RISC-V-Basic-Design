run:
	iverilog -o ds.out and1.v tb_and1.v
	vvp ds.out

wave:
	iverilog -o ds.out and1.v tb_and1.v
	vvp ds.out
	LD_PRELOAD=/lib/x86_64-linux-gnu/libpthread.so.0 gtkwave and1.vcd