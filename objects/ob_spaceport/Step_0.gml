/// @desc


if b_ready = -1
if global.current_construct = id
if global.select_item <> -1 {
	cur_item = global.select_item
	var _b_item = global.current_menu[cur_item]
	var _t = sec_to_step(_b_item.b_time)
	if alarm_get(0) = -1
		if b_ready = -1 {
			b_ready = 0
			alarm_set(0, _t)
			time_build = _t
		}
	if (global.money - _b_item.cost) >= 0 {
		global.money -= _b_item.cost;
	} else {
		show_message("Not enough money!")
		global.select_item = -1;
		alarm_set(0, -1)
		b_ready = -1
	}
}
	
if b_ready = 0 {
	if alarm_get(0) > 0 {
		_t = alarm_get(0)
		UI_progress = 1 - _t / time_build // % of progress for UI_bar
	}
}

	
	






