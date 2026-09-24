/// @desc AI switch

switch cur_think {
	case think.idle: {
		if in_cargo < maxval_cargo
		if instance_number(ob_crate) > 0 {
			pl_target = instance_nearest(x, y, ob_crate)
			cur_think = think.move
		}
		if in_cargo = maxval_cargo
		if instance_number(ob_refinery) > 0 { // рефинери на карте есть?
			var _ref = noone;
			cur_think = think.idle;
			_ref = instance_nearest(x ,y, ob_refinery) // ищем ближайший свободный
			if _ref.control_player = control_player
			if _ref.qe_unit = noone {
				pl_target = instance_create_layer(_ref.x, _ref.y, "markers_layer", ob_pl_target);
				pl_target.tg_id = _ref
				pl_target.master_id = id
				_ref.qe_unit = id;
				cur_think = think.move;
			} else {
				_ref = noone;
			}
			if _ref = noone	// если нет ближайшего ищем любой другой свободный
			for (var i = 0; i < instance_number(ob_refinery); i++) {
				_ref = instance_find(ob_refinery, i);
				if _ref.control_player = control_player
				if _ref.qe_unit = noone {
					pl_target = instance_create_layer(_ref.x, _ref.y, "markers_layer", ob_pl_target);
					pl_target.tg_id = _ref
					pl_target.master_id = id
					_ref.qe_unit = id;
					cur_think = think.move;
					break;
					
				}
			}
		}
	break;
	}
}

