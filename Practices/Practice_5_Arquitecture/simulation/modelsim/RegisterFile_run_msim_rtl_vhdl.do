transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/ivan/Documents/GitHub/Arquitectura-de-Computadoras/Practices/Practice_5_Arquitecture/RegisterFile.vhd}
vcom -93 -work work {C:/Users/ivan/Documents/GitHub/Arquitectura-de-Computadoras/Practices/Practice_5_Arquitecture/RegisterFile_Top.vhd}

