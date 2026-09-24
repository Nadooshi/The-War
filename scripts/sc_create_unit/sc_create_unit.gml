function create_unit (_x, _y, _arr_ind_unit, _push_outside_boolean) {
	var _u = instance_create_layer(_x, _y, "units_layer", _arr_ind_unit.obj)
	array_push(_u.units_inplatoon, _arr_ind_unit.obj)
	_u.pl_freeplace -= _arr_ind_unit.take_place;
	_u.control_player = control_player;
	_u.cur_think = think.idle;
	
	if _push_outside_boolean
		with _u {
			move_outside_all(irandom(360), 96);
			move_snap(32, 32);
			x -= 16;
			y -= 16;
		}
	b_ready = 1;
	ob_player_incpector.pice_money_tic = 0
	return _u;
}
