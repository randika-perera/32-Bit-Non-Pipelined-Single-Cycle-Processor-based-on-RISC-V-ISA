transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/intelFPGA_lite/17.1/200000X_CPU_Design_Test_Runs/200462U_RISCV/Design_Files {C:/intelFPGA_lite/17.1/200000X_CPU_Design_Test_Runs/200462U_RISCV/Design_Files/Controller.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/17.1/200000X_CPU_Design_Test_Runs/200462U_RISCV/verif {C:/intelFPGA_lite/17.1/200000X_CPU_Design_Test_Runs/200462U_RISCV/verif/tb_top.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/17.1/200000X_CPU_Design_Test_Runs/200462U_RISCV/Design_Files {C:/intelFPGA_lite/17.1/200000X_CPU_Design_Test_Runs/200462U_RISCV/Design_Files/RISC_V.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/17.1/200000X_CPU_Design_Test_Runs/200462U_RISCV/Design_Files {C:/intelFPGA_lite/17.1/200000X_CPU_Design_Test_Runs/200462U_RISCV/Design_Files/RegFile.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/17.1/200000X_CPU_Design_Test_Runs/200462U_RISCV/Design_Files {C:/intelFPGA_lite/17.1/200000X_CPU_Design_Test_Runs/200462U_RISCV/Design_Files/mux2.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/17.1/200000X_CPU_Design_Test_Runs/200462U_RISCV/Design_Files {C:/intelFPGA_lite/17.1/200000X_CPU_Design_Test_Runs/200462U_RISCV/Design_Files/instructionmemory.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/17.1/200000X_CPU_Design_Test_Runs/200462U_RISCV/Design_Files {C:/intelFPGA_lite/17.1/200000X_CPU_Design_Test_Runs/200462U_RISCV/Design_Files/imm_Gen.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/17.1/200000X_CPU_Design_Test_Runs/200462U_RISCV/Design_Files {C:/intelFPGA_lite/17.1/200000X_CPU_Design_Test_Runs/200462U_RISCV/Design_Files/flopr.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/17.1/200000X_CPU_Design_Test_Runs/200462U_RISCV/Design_Files {C:/intelFPGA_lite/17.1/200000X_CPU_Design_Test_Runs/200462U_RISCV/Design_Files/Datapath.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/17.1/200000X_CPU_Design_Test_Runs/200462U_RISCV/Design_Files {C:/intelFPGA_lite/17.1/200000X_CPU_Design_Test_Runs/200462U_RISCV/Design_Files/datamemory.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/17.1/200000X_CPU_Design_Test_Runs/200462U_RISCV/Design_Files {C:/intelFPGA_lite/17.1/200000X_CPU_Design_Test_Runs/200462U_RISCV/Design_Files/data_extract.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/17.1/200000X_CPU_Design_Test_Runs/200462U_RISCV/Design_Files {C:/intelFPGA_lite/17.1/200000X_CPU_Design_Test_Runs/200462U_RISCV/Design_Files/ALUController.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/17.1/200000X_CPU_Design_Test_Runs/200462U_RISCV/Design_Files {C:/intelFPGA_lite/17.1/200000X_CPU_Design_Test_Runs/200462U_RISCV/Design_Files/alu.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/17.1/200000X_CPU_Design_Test_Runs/200462U_RISCV/Design_Files {C:/intelFPGA_lite/17.1/200000X_CPU_Design_Test_Runs/200462U_RISCV/Design_Files/adder_32.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/17.1/200000X_CPU_Design_Test_Runs/200462U_RISCV/Design_Files {C:/intelFPGA_lite/17.1/200000X_CPU_Design_Test_Runs/200462U_RISCV/Design_Files/adder.sv}

