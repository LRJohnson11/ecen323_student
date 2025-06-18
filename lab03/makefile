examine:
	xvlog regfile.sv -sv --nolog
	xelab regfile -debug typical --nolog -L unisims_ver --timescale 1ns/1ps
simulate:
	xvlog tb_regfile.sv  regfile.sv -sv --nolog
	xelab tb_regfile -debug typical --nolog -L unisims_ver --timescale 1ns/1ps 
	xsim tb_regfile -log tb_regfile.log --runall
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
	source /tools/Xilinx/Vivado/2024.1/settings64.sh
clean:
	rm *.log *.jou *.pb