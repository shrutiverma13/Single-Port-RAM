module single_port_ram(
	inout [7:0] data,  
	input [6:0] addr,
    input r, w, clk  
    );
	
	reg [7:0] ram [127:0];
	reg [7:0] data_out;
    assign data = (r)? data_out : 8'bz;
	
always @ ( posedge clk )// Workes only at the postive edge of the clock 0->1
    begin
	case (r) 
    1'b0 : 	
		
		if(w)
		ram[addr] <= data;//Write
		
		else
		data_out<=8'bz;//tristated condition
		
	
    1'b1 : 
		
		if(!w)
		data_out = ram[addr];//Read
		
    endcase   
   end
endmodule
