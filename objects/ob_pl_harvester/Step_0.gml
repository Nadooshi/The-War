/// @desc
if cur_think = think.player_control {
// Inherit the parent event
	event_inherited();
	exit;
}

if alarm_get(0) <= 0 
switch cur_think {
	case think.idle: {
		alarm_set(0, sec_to_step(1))
		image_speed = 0;
	break;	
	}
	case think.move: {
		if not path_exists(move_path)
		if instance_exists(pl_target) {
			mp_grid_add_instances(global.grid, ob_entity, false)
			mp_grid_clear_cell(global.grid, floor(x / 32), floor(y / 32))
			mp_grid_clear_cell(global.grid, floor(pl_target.x / 32), floor(pl_target.y / 32))
			move_path = path_add()
			if (mp_grid_path(global.grid, move_path,x, y, pl_target.x, pl_target.y, true)){
				path_start(move_path, pl_speed, path_action_stop, false)
				image_speed = 1;
			}else{
				path_delete(move_path)
				mp_grid_clear_all(global.grid)
				mp_grid_add_instances(global.grid, ob_entity, false)
				cur_think = think.idle // можно приделать вызов транспортника, если застрял				
			}
		}
		// конeц пути
		if path_exists(move_path)
		if path_position = 1{
			var _p = instance_position(x, y, ob_crate)
			if _p != noone {
				cur_think = think.harvest;
			} else {
				_p = instance_position(x, y, ob_refinery)
				if _p != noone {
					cur_think = think.unload;
				} else {
					cur_think = think.idle
				}
			}
			path_delete(move_path)
			mp_grid_clear_all(global.grid)
			mp_grid_add_instances(global.grid, ob_entity, false)
		}
	break;	
	}
	case think.harvest: {
		var _ob_res = instance_position(x, y, ob_crate);
		if in_cargo = maxval_cargo or _ob_res = noone {
			cur_think = think.idle
			break;
		} else {
			_ob_res.res_value--
			in_cargo = min(in_cargo + 1, maxval_cargo)
		}
	break;	
	}
	case think.evacuate: {
		image_speed = 0;
	break;	
	}
	case think.unload: {
		var _ob_base = instance_position(x, y, ob_refinery);
		if in_cargo = 0 or _ob_base = noone {
			cur_think = think.idle
			if instance_exists(_ob_base)
				_ob_base.qe_unit = noone;
			break;
		} else {
			x = _ob_base.x;
			y = _ob_base.y - 6;
			image_angle = 0;
			if ob_player_incpector.capasity_money > global.money {
				global.money++
				in_cargo = max(in_cargo - 1, 0)
			}
		}
		
	break;	
	}
}
UI_progress = in_cargo / maxval_cargo

