# vsim -voptargs=+acc work.tb_decoder2_to_4(behavior) 
add wave -position insertpoint  \
sim:/tb_decoder2_to_4/sel(1)
add wave -position insertpoint  \
sim:/tb_decoder2_to_4/sel(0)
add wave -position insertpoint  \
sim:/tb_decoder2_to_4/y(3)
add wave -position insertpoint  \
sim:/tb_decoder2_to_4/y(2)
add wave -position insertpoint  \
sim:/tb_decoder2_to_4/y(1)
add wave -position insertpoint  \
sim:/tb_decoder2_to_4/y(0)
run 200 ns
run 800 ns