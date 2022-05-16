onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /bus_handshakes_tb/clk
add wave -noupdate /bus_handshakes_tb/rstn
add wave -noupdate /bus_handshakes_tb/data_i
add wave -noupdate /bus_handshakes_tb/valid_i
add wave -noupdate /bus_handshakes_tb/ready_i
add wave -noupdate /bus_handshakes_tb/valid_o
add wave -noupdate /bus_handshakes_tb/ready_o
add wave -noupdate /bus_handshakes_tb/data_o
add wave -noupdate /bus_handshakes_tb/valid_i_vf
add wave -noupdate /bus_handshakes_tb/ready_i_vf
add wave -noupdate /bus_handshakes_tb/valid_o_vf
add wave -noupdate /bus_handshakes_tb/ready_o_vf
add wave -noupdate /bus_handshakes_tb/data_o_vf
add wave -noupdate /bus_handshakes_tb/valid_i_rf
add wave -noupdate /bus_handshakes_tb/ready_i_rf
add wave -noupdate /bus_handshakes_tb/valid_o_rf
add wave -noupdate /bus_handshakes_tb/ready_o_rf
add wave -noupdate /bus_handshakes_tb/data_o_rf
add wave -noupdate /bus_handshakes_tb/valid_i_vrf
add wave -noupdate /bus_handshakes_tb/ready_i_vrf
add wave -noupdate /bus_handshakes_tb/valid_o_vrf
add wave -noupdate /bus_handshakes_tb/ready_o_vrf
add wave -noupdate /bus_handshakes_tb/data_o_vrf
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 217
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
WaveRestoreZoom {0 ns} {61 ns}
