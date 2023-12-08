onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_top/tb_clk
add wave -noupdate /tb_top/reset
add wave -noupdate /tb_top/RISC_V/dp/alu_module/Operation
add wave -noupdate /tb_top/RISC_V/dp/alu_module/ALUResult
add wave -noupdate /tb_top/RISC_V/clk
add wave -noupdate /tb_top/RISC_V/dp/pcreg/q
add wave -noupdate /tb_top/RISC_V/clk
add wave -noupdate {/tb_top/RISC_V/dp/rf/register_file[0]}
add wave -noupdate {/tb_top/RISC_V/dp/rf/register_file[18]}
add wave -noupdate {/tb_top/RISC_V/dp/rf/register_file[19]}
add wave -noupdate {/tb_top/RISC_V/dp/rf/register_file[20]}
add wave -noupdate {/tb_top/RISC_V/dp/rf/register_file[21]}
add wave -noupdate /tb_top/RISC_V/clk
add wave -noupdate {/tb_top/RISC_V/dp/data_mem/mem[11]}
add wave -noupdate {/tb_top/RISC_V/dp/data_mem/mem[12]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 39
configure wave -valuecolwidth 39
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {170626 ps}
