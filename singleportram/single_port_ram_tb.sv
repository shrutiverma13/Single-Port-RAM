`include "single_port_ram.sv"
module single_port_ram_tb();
    wire [7:0] data;  
	reg [6:0] addr;          
    reg r;
	reg w;
    reg clk; 
    reg [7:0] data_in;    

single_port_ram single_port_ram(
	.data(data), 
	.addr(addr), 
    .r(r),
    .w(w),	
    .clk(clk)    
    );
initial                    
       begin
$dumpfile ("single_port_ram_tb.vcd"); 
$dumpvars(0, single_port_ram_tb); 
       end

	assign data = (w)?data_in : 8'bz;

initial
	begin
	    clk = 1'b1; //clock starts with 1
            forever #50 clk = ~clk; //toggeling the clock
	end

initial
	begin
	//First we write
	    r = 1'b0;
	    w = 1'b1;
		#100
		    data_in = 8'h10; 
			addr = 7'd0;
			#100;
			
            data_in = 8'h11;
			addr = 7'd01;
			#100;
			
            data_in = 8'h12;
			addr = 7'd02;
			#100;
			
			data_in = 8'h13;
			addr = 7'd03;
			#100;
        #100
		//Read
		r = 1'b1;
        w = 1'b0;
        #100;
            addr = 7'd0;  
			#100
            $display("addr = %b, data = %b",addr,data);
			#100;
          
           addr = 7'd1;  
		   #100
           $display("addr = %b, data = %b",addr,data);
		   #100;

           addr = 7'd2; 
           #100		   
           $display("addr = %b, data = %b",addr,data);
		   #100;
		   
		   addr = 7'd3;  
           #100		   
           $display("addr = %b, data = %b",addr,data);
		   #100;
		   
		   addr = 7'd4;  
           #100		   
           $display("addr = %b, data = %b",addr,data);
		   #100;
	//Tristated
		   r = 1'b0;   
		   w = 1'b0;
		   #100
		   $display(" %b",data);
           #100;

	end
endmodule
