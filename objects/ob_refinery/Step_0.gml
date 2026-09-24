/// @desc
if control_player = 0 {
	if global.money <= 50 {
		if not instance_exists(marker)
			marker = instance_create_layer(x, y, "markers_layer", ob_mark_ok, {sprite_index : sp_mark_nomoney})
	} else {
		instance_destroy(marker)
	}

	// создаём бесплатный харвестер если нет ни одного.
	var _ok = false;
	for (var i = 0; i < instance_number(ob_pl_harvester); i++)
		if instance_find(ob_pl_harvester, i).control_player = control_player {
			_ok = true;
			break;
		}
	if not _ok {
		var _h = noone;
		_h = instance_create_layer(0, 0, "units_layer", ob_pl_harvester) 
		_h.control_player = control_player
		array_push(_h.units_inplatoon, ob_pl_harvester)
		_h.pl_freeplace -= 3;
		
		with instance_create_layer(0, 0, "markers_layer", ob_pl_reinforcement) {
			in_cargo = _h;
			pl_target = instance_create_layer(other.x, other.y, "markers_layer", ob_pl_target);
			pl_target.tg_id = other.id;
			pl_target.master_id = id;
			cur_think = think.move;
		}
	}
//------------------------------------------------------------------------------
}

if qe_unit != noone
if qe_unit.cur_think == think.player_control
	qe_unit = noone;
