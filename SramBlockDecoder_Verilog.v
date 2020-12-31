module SramBlockDecoder_Verilog( 
		input unsigned [16:0] Address, // lower 17 lines of address bus from 68k
		input SRamSelect_H,				 // from main (top level) address decoder indicating 68k is talking to Sram
		
		// 4 separate block select signals that parition 256kbytes (128k words) into 4 blocks of 64k (32 k words)
		output reg Block0_H, 
		output reg Block1_H, 
		output reg Block2_H, 
		output reg Block3_H 
);	

	always@(*)	begin
	
		// default block selects are inactive - override as appropriate later
		
		if({SRamSelect_H, Address[16], Address[15]} == 3'b100) {Block3_H, Block2_H, Block1_H, Block0_H} <= 4'b0001;
		else if({SRamSelect_H, Address[16], Address[15]} == 3'b101) {Block3_H, Block2_H, Block1_H, Block0_H} <= 4'b0010;
		else if({SRamSelect_H, Address[16], Address[15]} == 3'b110) {Block3_H, Block2_H, Block1_H, Block0_H} <= 4'b0100;
		else if({SRamSelect_H, Address[16], Address[15]} == 3'b111) {Block3_H, Block2_H, Block1_H, Block0_H} <= 4'b1000;
		else {Block3_H, Block2_H, Block1_H, Block0_H} <= 4'b0000;
		
		// decode the top two address lines plus SRamSelect to provide 4 block select signals
		// for 4 blocks of 64k bytes (32k words) to give 256k bytes in total
	
		// TODO
		
	end
endmodule
