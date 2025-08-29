read_verilog -sv alu_defs.sv riscv_datapath_constants.sv alu.sv regfile.sv riscv_simple_datapath.sv
synth_design -top riscv_simple_datapath -part xcvc1502-nsvg1369-1LHP-i-L -verbose
write_checkpoint -force datapath_synth.dcp