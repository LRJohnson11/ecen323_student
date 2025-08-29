examine:
	xvlog alu.sv -sv --nolog
	xelab alu -debug typical --nolog -L unisims_ver --timescale 1ns/1ps
simulate:
	xvlog tb_alu.sv alu_defs.sv alu.sv -sv --nolog
	xelab tb_alu -debug typical --nolog -L unisims_ver --timescale 1ns/1ps --generic_top "BUS_WIDTH=32"
	xsim tb_alu -log tb_alu.log --runall
simulate_gui:
	xvlog tb_alu.sv alu_defs.sv alu.sv -sv --nolog
	xelab tb_alu -debug typical --nolog -L unisims_ver --timescale 1ns/1ps
	xsim tb_alu -gui --nolog
simulate_calc:
	xvlog tb_calc.sv alu_defs.sv calc.sv alu.sv -sv --nolog
	xelab tb_calc -debug typical --nolog -L unisims_ver --timescale 1ns/1ps
	xsim tb_calc -log tb_calc.log --runall
simulate_calc_gui:
	xvlog tb_calc.sv alu_defs.sv calc.sv alu.sv -sv --nolog
	xelab tb_calc -debug typical --nolog -L unisims_ver --timescale 1ns/1ps
	xsim tb_calc -gui --nolog
source:
	source /tools/Xilinx/2025.1/Vivado/settings64.sh
clean:
	rm *.jou *.log *.pb
	rm -rf .Xil alu_sim xsim.dir