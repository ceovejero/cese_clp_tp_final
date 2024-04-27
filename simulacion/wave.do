onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /phase_accum_tb/clk
add wave -noupdate -radix hexadecimal /phase_accum_tb/reset
add wave -noupdate -radix hexadecimal /phase_accum_tb/en
add wave -noupdate -radix hexadecimal -childformat {{/phase_accum_tb/phase_inc(11) -radix hexadecimal} {/phase_accum_tb/phase_inc(10) -radix hexadecimal} {/phase_accum_tb/phase_inc(9) -radix hexadecimal} {/phase_accum_tb/phase_inc(8) -radix hexadecimal} {/phase_accum_tb/phase_inc(7) -radix hexadecimal} {/phase_accum_tb/phase_inc(6) -radix hexadecimal} {/phase_accum_tb/phase_inc(5) -radix hexadecimal} {/phase_accum_tb/phase_inc(4) -radix hexadecimal} {/phase_accum_tb/phase_inc(3) -radix hexadecimal} {/phase_accum_tb/phase_inc(2) -radix hexadecimal} {/phase_accum_tb/phase_inc(1) -radix hexadecimal} {/phase_accum_tb/phase_inc(0) -radix hexadecimal}} -subitemconfig {/phase_accum_tb/phase_inc(11) {-radix hexadecimal} /phase_accum_tb/phase_inc(10) {-radix hexadecimal} /phase_accum_tb/phase_inc(9) {-radix hexadecimal} /phase_accum_tb/phase_inc(8) {-radix hexadecimal} /phase_accum_tb/phase_inc(7) {-radix hexadecimal} /phase_accum_tb/phase_inc(6) {-radix hexadecimal} /phase_accum_tb/phase_inc(5) {-radix hexadecimal} /phase_accum_tb/phase_inc(4) {-radix hexadecimal} /phase_accum_tb/phase_inc(3) {-radix hexadecimal} /phase_accum_tb/phase_inc(2) {-radix hexadecimal} /phase_accum_tb/phase_inc(1) {-radix hexadecimal} /phase_accum_tb/phase_inc(0) {-radix hexadecimal}} /phase_accum_tb/phase_inc
add wave -noupdate -format Analog-Step -height 74 -max 1970.0000000000002 -min -1968.0 -radix decimal /phase_accum_tb/sine_out
add wave -noupdate -format Analog-Step -height 74 -max 2044.9999999999995 -min -1660.0 -radix decimal /phase_accum_tb/saw_out
add wave -noupdate -radix hexadecimal /phase_accum_tb/sine_int
add wave -noupdate -radix hexadecimal /phase_accum_tb/saw_int
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {98172 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 167
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1050 ns}
