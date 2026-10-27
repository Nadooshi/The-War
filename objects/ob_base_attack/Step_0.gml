/// @desc

// перезарядка
var w_ok = can_attack_reload(init_weapon, reload_timer);

// ищем ближайшего вражеского юнита в радиусе атаки
var _tg = noone;
var _best = att_dist_max;
for (var i = 0; i < instance_number(ob_platoon); i++) {
	var _p = instance_find(ob_platoon, i);
	if _p.control_player != control_player and _p.control_player >= 0 {
		var _d = distance_to_object(_p);
		if _d < _best {
			_best = _d;
			_tg = _p;
		}
	}
}

// стрельба
if _tg != noone {
	for (var i = 0; i < array_length(init_weapon); i++) {
		if w_ok[i] {
			reload_timer[i] = sec_to_step(init_weapon[i].reload_time);
			for (var _nf = 0; _nf < init_weapon[i].number_fire; _nf++) {
				if array_length(_tg.units_inplatoon) = 0
					break;
				var _idx = max(irandom_range(0, array_length(_tg.units_inplatoon) - 1), 0);
				var _armor = _tg.units_inplatoon[_idx].unit_type_brone;
				var _dmg = can_attack_damage(init_weapon[i], dam_mod, dam_upg, _armor, _tg.dodge);
				_tg.units_inplatoon[_idx].cur_unit_health -= _dmg;
			}
			with _tg
				event_perform(ev_other, ev_user0); // refresh platoon
		}
	}
}
