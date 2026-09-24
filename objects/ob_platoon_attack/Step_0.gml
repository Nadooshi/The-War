/// @desc
if not init
	exit;

// reloading
var w_ok = array_create(array_length(unit_weapon), false);
for (var t = 0; t < array_length(unit_weapon); t++) {
	reload_timer[t] -= 1
	if reload_timer[t] <= 0 {
		w_ok[t] = true;
		ready_to_attack = true
	}
}
// Inherit the parent event
event_inherited()

if not instance_exists(pl_target)
	exit;

var _tg = pl_target.tg_id;
if _tg = noone or _tg = id or not instance_exists(_tg)
	exit;

if ready_to_attack
if att_dist_max > 0 // если может атаковать...
if _tg != noone {
	var _d = distance_to_object(_tg)
	if (_d < att_dist_max) and (_d > att_dist_min) {
		ready_to_attack = false;
		var av_x = (x + pl_target.x) / 2
		var av_y = (y + pl_target.y) / 2
		mark_attack = instance_create_layer(av_x, av_y, "markers_layer", ob_attack_direct)
		mark_attack.def_side = _tg
		mark_attack.att_side = id
	
		endmove(move_path)
		cur_think = think.attack
	}


	// shooting
	if instance_exists(_tg)
	if object_is_ancestor(_tg.object_index, ob_platoon)
	if cur_think == think.attack {
		var _def_pl = mark_attack.def_side;
		for (var i = 0; i < array_length(unit_weapon); i++) {
			if w_ok[i] {
				reload_timer[i] = sec_to_step(unit_weapon[i].reload_time);
				var _dmg = unit_weapon[i].damage * dam_mod + dam_upg;
				for (var _u = 0; _u < array_length(units_inplatoon); _u++)
				for (var _nf = 0; _nf < unit_weapon[i].number_fire; _nf++) {
					if array_length(_def_pl.units_inplatoon) = 0 {
						cur_think = think.idle;
						break;
					}
					var target_index = max(irandom_range(0, array_length(_def_pl.units_inplatoon) - 1), 0);
					var _t_br = _def_pl.units_inplatoon[target_index].unit_type_brone;
					var f_dmg = calculate_damage(_dmg, unit_weapon[i].w_type_damage, _t_br);
					if (calculate_accuracy(unit_weapon[i].accuracy, _def_pl.dodge)) {
						_def_pl.units_inplatoon[target_index].cur_unit_health -= f_dmg;
					}
				}
			}
		}
		with _def_pl
			event_perform(ev_other, ev_user0)// refresh platoon
	}
}
;
