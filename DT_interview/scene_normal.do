onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /handshakes_tb/clk
add wave -noupdate /handshakes_tb/rstn
add wave -noupdate /handshakes_tb/valid_i
add wave -noupdate /handshakes_tb/ready_o_1
add wave -noupdate /handshakes_tb/valid_o_1
add wave -noupdate /handshakes_tb/ready_o_2
add wave -noupdate /handshakes_tb/valid_o_2
add wave -noupdate /handshakes_tb/ready_o_3
add wave -noupdate /handshakes_tb/valid_o_3
add wave -noupdate /handshakes_tb/ready_o_4
add wave -noupdate /handshakes_tb/valid_o_4
add wave -noupdate /handshakes_tb/ready_o_fix
add wave -noupdate /handshakes_tb/valid_o_fix
add wave -noupdate /handshakes_tb/ready_i
add wave -noupdate /handshakes_tb/data_i
add wave -noupdate /handshakes_tb/data_o_1
add wave -noupdate /handshakes_tb/data_o_2
add wave -noupdate /handshakes_tb/data_o_3
add wave -noupdate /handshakes_tb/data_o_4
add wave -noupdate /handshakes_tb/data_o_fix
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {110 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 188
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ns} {124 ns}
