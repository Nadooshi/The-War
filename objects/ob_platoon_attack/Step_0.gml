/// @desc
if not init
	exit;

// reloading
var w_ok = can_attack_reload(init_weapon, reload_timer);
for (var t = 0; t < array_length(w_ok); t++)
	if w_ok[t]
		ready_to_attack = true

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
		for (var i = 0; i < array_length(init_weapon); i++) {
			if w_ok[i] {
				reload_timer[i] = sec_to_step(init_weapon[i].reload_time);
				for (var _u = 0; _u < array_length(units_inplatoon); _u++)
				for (var _nf = 0; _nf < init_weapon[i].number_fire; _nf++) {
					if movement != type_move.circuite {
						if array_length(_def_pl.units_inplatoon) = 0 {
							cur_think = think.idle;
							break;
						}
					} else {
						cur_think = think.move
					}
					var target_index = max(irandom_range(0, array_length(_def_pl.units_inplatoon) - 1), 0);
					var _t_br = _def_pl.units_inplatoon[target_index].unit_type_brone;
					var f_dmg = can_attack_damage(init_weapon[i], dam_mod, dam_upg, _t_br, _def_pl.dodge);
					_def_pl.units_inplatoon[target_index].cur_unit_health -= f_dmg;
				}
			}
		}
		with _def_pl
			event_perform(ev_other, ev_user0)// refresh platoon
	}
}
;
