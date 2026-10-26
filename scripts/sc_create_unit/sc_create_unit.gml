function create_unit (_x, _y, _arr_ind_unit, _push_outside_boolean) {
	var _u = instance_create_layer(_x, _y, "units_layer", _arr_ind_unit.obj)
	array_push(_u.units_inplatoon, _arr_ind_unit.obj)
	_u.pl_freeplace -= _arr_ind_unit.take_place;
	_u.control_player = control_player;
	_u.cur_think = think.idle;
	
	if _push_outside_boolean
		with _u {
			var _c = find_free_cell(floor(x / 32), floor(y / 32));
			x = _c[0] * 32 + 16;
			y = _c[1] * 32 + 16;
		}
	b_ready = 1;
	global.pice_money_tic[control_player] = 0
	return _u;
}
