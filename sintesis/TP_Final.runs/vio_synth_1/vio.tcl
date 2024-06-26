# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param synth.incrementalSynthesisCache C:/Users/ceo/AppData/Roaming/Xilinx/Vivado/.Xil/Vivado-1776-CEO-LT3/incrSyn
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
set_param project.vivado.isBlockSynthRun true
set_msg_config -msgmgr_mode ooc_run
create_project -in_memory -part xc7z010clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir D:/CLP/tp_final/sintesis/TP_Final.cache/wt [current_project]
set_property parent.project_path D:/CLP/tp_final/sintesis/TP_Final.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part digilentinc.com:arty-z7-10:part0:1.1 [current_project]
set_property ip_output_repo d:/CLP/tp_final/sintesis/TP_Final.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_ip -quiet d:/CLP/tp_final/sintesis/TP_Final.srcs/sources_1/ip/vio/vio.xci
set_property used_in_implementation false [get_files -all d:/CLP/tp_final/sintesis/TP_Final.srcs/sources_1/ip/vio/vio.xdc]
set_property used_in_implementation false [get_files -all d:/CLP/tp_final/sintesis/TP_Final.srcs/sources_1/ip/vio/vio_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
set_param ips.enableIPCacheLiteLoad 0

set cached_ip [config_ip_cache -export -no_bom -use_project_ipc -dir D:/CLP/tp_final/sintesis/TP_Final.runs/vio_synth_1 -new_name vio -ip [get_ips vio]]

if { $cached_ip eq {} } {
close [open __synthesis_is_running__ w]

synth_design -top vio -part xc7z010clg400-1 -mode out_of_context

#---------------------------------------------------------
# Generate Checkpoint/Stub/Simulation Files For IP Cache
#---------------------------------------------------------
# disable binary constraint mode for IPCache checkpoints
set_param constraints.enableBinaryConstraints false

catch {
 write_checkpoint -force -noxdef -rename_prefix vio_ vio.dcp

 set ipCachedFiles {}
 write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ vio_stub.v
 lappend ipCachedFiles vio_stub.v

 write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ vio_stub.vhdl
 lappend ipCachedFiles vio_stub.vhdl

 write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ vio_sim_netlist.v
 lappend ipCachedFiles vio_sim_netlist.v

 write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ vio_sim_netlist.vhdl
 lappend ipCachedFiles vio_sim_netlist.vhdl

 config_ip_cache -add -dcp vio.dcp -move_files $ipCachedFiles -use_project_ipc -ip [get_ips vio]
}

rename_ref -prefix_all vio_

# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef vio.dcp
create_report "vio_synth_1_synth_report_utilization_0" "report_utilization -file vio_utilization_synth.rpt -pb vio_utilization_synth.pb"

if { [catch {
  file copy -force D:/CLP/tp_final/sintesis/TP_Final.runs/vio_synth_1/vio.dcp d:/CLP/tp_final/sintesis/TP_Final.srcs/sources_1/ip/vio/vio.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  write_verilog -force -mode synth_stub d:/CLP/tp_final/sintesis/TP_Final.srcs/sources_1/ip/vio/vio_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode synth_stub d:/CLP/tp_final/sintesis/TP_Final.srcs/sources_1/ip/vio/vio_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_verilog -force -mode funcsim d:/CLP/tp_final/sintesis/TP_Final.srcs/sources_1/ip/vio/vio_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode funcsim d:/CLP/tp_final/sintesis/TP_Final.srcs/sources_1/ip/vio/vio_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}


} else {


if { [catch {
  file copy -force D:/CLP/tp_final/sintesis/TP_Final.runs/vio_synth_1/vio.dcp d:/CLP/tp_final/sintesis/TP_Final.srcs/sources_1/ip/vio/vio.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  file rename -force D:/CLP/tp_final/sintesis/TP_Final.runs/vio_synth_1/vio_stub.v d:/CLP/tp_final/sintesis/TP_Final.srcs/sources_1/ip/vio/vio_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  file rename -force D:/CLP/tp_final/sintesis/TP_Final.runs/vio_synth_1/vio_stub.vhdl d:/CLP/tp_final/sintesis/TP_Final.srcs/sources_1/ip/vio/vio_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  file rename -force D:/CLP/tp_final/sintesis/TP_Final.runs/vio_synth_1/vio_sim_netlist.v d:/CLP/tp_final/sintesis/TP_Final.srcs/sources_1/ip/vio/vio_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  file rename -force D:/CLP/tp_final/sintesis/TP_Final.runs/vio_synth_1/vio_sim_netlist.vhdl d:/CLP/tp_final/sintesis/TP_Final.srcs/sources_1/ip/vio/vio_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

}; # end if cached_ip 

if {[file isdir D:/CLP/tp_final/sintesis/TP_Final.ip_user_files/ip/vio]} {
  catch { 
    file copy -force d:/CLP/tp_final/sintesis/TP_Final.srcs/sources_1/ip/vio/vio_stub.v D:/CLP/tp_final/sintesis/TP_Final.ip_user_files/ip/vio
  }
}

if {[file isdir D:/CLP/tp_final/sintesis/TP_Final.ip_user_files/ip/vio]} {
  catch { 
    file copy -force d:/CLP/tp_final/sintesis/TP_Final.srcs/sources_1/ip/vio/vio_stub.vhdl D:/CLP/tp_final/sintesis/TP_Final.ip_user_files/ip/vio
  }
}
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
