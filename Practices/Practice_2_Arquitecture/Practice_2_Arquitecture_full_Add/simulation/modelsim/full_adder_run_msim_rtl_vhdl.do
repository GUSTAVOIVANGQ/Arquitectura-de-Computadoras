transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/ivan/Documents/GitHub/Arquitectura-de-Computadoras/Practices/Practice_2_Arquitecture_full_Add/full_adder.vhd}
vcom -93 -work work {C:/Users/ivan/Documents/GitHub/Arquitectura-de-Computadoras/Practices/Practice_2_Arquitecture_full_Add/full_adder_4bit.vhd}

