examine:
	xvlog seven_segment_top.sv seven_segment.sv -sv --nolog
	xelab seven_segment_top -debug typical --nolog -L unisims_ver --timescale 1ns/1ps
simulate:
	xvlog seven_segment.sv tb_sevensegment.sv -sv --nolog
	xelab tb_sevensegment -debug typical --nolog -L unisims_ver --timescale 1ns/1ps
	xsim tb_sevensegment -log sim_sevensegment.log --runall
source:
	source /tools/Xilinx/Vivado/2024.1/settings64.sh
