/// @desc

// passive income
//global.money[control_player] += money_income / sec_to_step(1);

if build_timer > 0 {
	build_timer--;
	if build_timer <= 0
		cpu_finish();
} else {
	think_timer--;
	if think_timer <= 0 {
		think_timer = think_interval;
		cpu_think();
	}
}
