/// @desc

if b_ready = -1
if pause_build_timer = -1
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
			image_speed = 1
		}
	b_pice = -_b_item.cost / sec_to_step(_b_item.b_time)
	ob_player_incpector.pice_money_tic = b_pice
}
if b_ready = 0 {
	if alarm_get(0) > 0 {
		_t = alarm_get(0)
		UI_progress = 1 - _t / time_build // % of progress for UI_bar
	} else {
		UI_progress = 1 - pause_build_timer / time_build // % of progress for UI_bar
	}
}

if global.money <= 2
	if alarm_get(0) > 0 {
	pause_build_timer = alarm_get(0)
	alarm_set(0, -1)
	ob_player_incpector.pice_money_tic = 0
}

if pause_build_timer != -1
if global.money > 30 {
	alarm_set(0, pause_build_timer)
	pause_build_timer = -1
	ob_player_incpector.pice_money_tic = b_pice
}


