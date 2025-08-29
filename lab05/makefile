examine:
	xvlog riscv_opcodes.sv alu_defs.sv alu.sv regfile.sv riscv_datapath_constants.sv riscv_simple_datapath.sv -sv --nolog
	xelab riscv_simple_datapath -debug typical --nolog -L unisims_ver --timescale 1ns/1ps
simulate:
	xvlog riscv_opcodes.sv alu_defs.sv alu.sv regfile.sv riscv_datapath_constants.sv riscv_simple_datapath.sv tb_simple_datapath.sv -sv --nolog
	xelab tb_simple_datapath -debug typical --nolog -L unisims_ver --timescale 1ns/1ps
	xsim tb_simple_datapath -log tb_regfile.log --runall
simulate_gui:
	xvlog riscv_opcodes.sv alu_defs.sv alu.sv regfile.sv riscv_datapath_constants.sv riscv_simple_datapath.sv tb_simple_datapath.sv -sv --nolog
	xelab tb_simple_datapath -debug typical --nolog -L unisims_ver --timescale 1ns/1ps
	xsim tb_simple_datapath -log tb_regfile.log -gui
simulate_calc:
	xvlog tb_calc.sv alu_defs.sv calc.sv alu.sv -sv --nolog
	xelab tb_calc -debug typical --nolog -L unisims_ver --timescale 1ns/1ps
	xsim tb_calc -log tb_calc.log --runall
simulate_calc_gui:
	xvlog tb_calc.sv alu_defs.sv calc.sv alu.sv -sv --nolog
	xelab tb_calc -debug typical --nolog -L unisims_ver --timescale 1ns/1ps
	xsim tb_calc -gui --nolog
synth:
	vivado -mode batch -source synth_datapath.tcl -log synth_datapath.log -nojournal -notrace
source:
	source /tools/Xilinx/2025.1/Vivado/settings64.sh

clean:
	rm *.log *.jou *.pb