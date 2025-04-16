transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/ivan/Documents/GitHub/Arquitectura-de-Computadoras/Practices/Practice_2_Arquitecture_Add/pfa.vhd}
vcom -93 -work work {C:/Users/ivan/Documents/GitHub/Arquitectura-de-Computadoras/Practices/Practice_2_Arquitecture_Add/cla_logic.vhd}
vcom -93 -work work {C:/Users/ivan/Documents/GitHub/Arquitectura-de-Computadoras/Practices/Practice_2_Arquitecture_Add/cla_4bit.vhd}

