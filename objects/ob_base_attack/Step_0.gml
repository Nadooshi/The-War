/// @desc

// перезарядка
var w_ok = can_attack_reload(init_weapon, reload_timer);

// ищем ближайшего вражеского юнита в радиусе атаки
var _tg = can_attack_find_target(att_dist_max, control_player)

if _tg != noone {
	// поворот
	image_angle = point_direction(x, y, _tg.x, _tg.y)

	// стрельба
	for (var i = 0; i < array_length(init_weapon); i++) {
		if w_ok[i] {
			reload_timer[i] = sec_to_step(init_weapon[i].reload_time);
			for (var _nf = 0; _nf < init_weapon[i].number_fire; _nf++) {
				if array_length(_tg.units_inplatoon) = 0
					break;
				var _idx = max(irandom_range(0, array_length(_tg.units_inplatoon) - 1), 0);
				var _t_unit = _tg.units_inplatoon[_idx];
				if not instance_exists(_t_unit)
					continue;
				var _armor = _t_unit.unit_type_brone;
				var _dmg = can_attack_damage(init_weapon[i], dam_mod, dam_upg, _armor, _tg.dodge);
				_t_unit.cur_unit_health -= _dmg;
			}
			with _tg
				event_perform(ev_other, ev_user0); // refresh platoon
		}
	}
}
