examine:
	xvlog alu.sv -sv --nolog
	xelab alu -debug typical --nolog -L unisims_ver --timescale 1ns/1ps
simulate:
	xvlog tb_alu.sv alu.sv -sv --nolog
	xelab tb_alu -debug typical --nolog -L unisims_ver --timescale 1ns/1ps
	xsim tb_alu -log tb_alu.log --runall
simulate_gui:
	xvlog tb_alu.sv alu_defs.sv alu.sv -sv --nolog
	xelab tb_alu -debug typical --nolog -L unisims_ver --timescale 1ns/1ps
	xsim tb_alu -gui --nolog
simulate_calc:
	xvlog tb_calc.sv calc.sv alu.sv -sv --nolog
	xelab tb_calc -debug typical --nolog -L unisims_ver --timescale 1ns/1ps
	xsim tb_calc -log tb_calc.log --runall
source:
	source /tools/Xilinx/Vivado/2024.1/settings64.sh
