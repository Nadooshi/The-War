/// @desc
if control_player >= 0 {
	if control_player == 0 {
		if global.money[control_player] <= 50 {
			if not instance_exists(marker)
				marker = instance_create_layer(x, y, "markers_layer", ob_mark_ok, {sprite_index : sp_mark_nomoney})
		} else {
			instance_destroy(marker)
		}
	}

	// создаём бесплатный харвестер если нет ни одного.
	var _ok = false;
	for (var i = 0; i < instance_number(ob_pl_harvester); i++)
		if instance_find(ob_pl_harvester, i).control_player = control_player {
			_ok = true;
			break;
		}
	if not _ok {
		var _h = instance_create_layer(x, y, "units_layer", ob_pl_harvester);
		_h.control_player = control_player
		array_push(_h.units_inplatoon, ob_pl_harvester)
		_h.pl_freeplace -= 3;

		if control_player = 0 {
			// человек: харвестер прилетает транспортом с ближайшей точки границы комнаты
			var _bx = x;
			var _by = y;
			if min(x, room_width - x) < min(y, room_height - y) {
				// ближе левый/правый край
				if x < room_width - x
					_bx = 32;
				else
					_bx = room_width - 32;
			} else {
				// ближе верхний/нижний край
				if y < room_height - y
					_by = 32;
				else
					_by = room_height - 32;
			}
			_h.x = _bx;
			_h.y = _by;

			with instance_create_layer(_bx, _by, "markers_layer", ob_pl_reinforcement) {
				in_cargo = _h;
				pl_target = instance_create_layer(other.x, other.y, "markers_layer", ob_pl_target);
				pl_target.tg_id = other.id;
				pl_target.master_id = id;
				cur_think = think.move;
			}
		} else {
			// ИИ: ставим харвестер на ближайшую свободную клетку
			var _c = find_free_cell(floor(x / 32), floor(y / 32));
			_h.x = _c[0] * 32 + 16;
			_h.y = _c[1] * 32 + 16;
		}
	}
}
//------------------------------------------------------------------------------

if qe_unit != noone {
	if not instance_exists(qe_unit)
		qe_unit = noone;
	else if qe_unit.cur_think == think.player_control
		qe_unit = noone;
}
