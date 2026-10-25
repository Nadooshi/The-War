/// @desc
if keyboard_check_pressed(vk_f3)
	show_debug = !show_debug;

// apply money flow per player
for (var p = 0; p < global.max_players; p++) {
	if global.money[p] + global.pice_money_tic[p] > 0
		global.money[p] = max(global.money[p] + global.pice_money_tic[p], 0)
}

// compute power per player
for (var p = 0; p < global.max_players; p++)
	global.pow_val[p] = 0;

var _n = instance_number(ob_base);
for (var i = 0; i < _n; i++) {
	var _b = instance_find(ob_base, i)
	if _b.control_player >= 0
		global.pow_val[_b.control_player] += _b.pow_gen
}

if global.money[0] > 50
	with ob_mark_ok {
		if sprite_index = sp_mark_nomoney
			instance_destroy()
	}


