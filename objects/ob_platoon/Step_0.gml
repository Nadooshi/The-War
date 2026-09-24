/// @desc
// check to death
if array_length(units_inplatoon) = 0 {
	if instance_exists(pl_target)
		endmove(move_path);
	instance_destroy()
	exit;
}
image_speed = 1
if cur_think != think.move {
	endmove(move_path);
	speed = 0;
	image_speed = 0;
}
if cur_think = think.move
switch movement{
	case type_move.pathing: {	
		if not path_exists(move_path)
		if instance_exists(pl_target) {
			if ignore_obstacles {
				if instance_position(pl_target.x, pl_target.y, ob_base) != noone {
					var _c = find_free_cell(floor(pl_target.x / 32), floor(pl_target.y / 32))
					pl_target.x = _c[0] * 32 + 16
					pl_target.y = _c[1] * 32 + 16
					pl_target.tg_id = noone
				}
				mp_grid_clear_all(global.grid)
			} else {
				mp_grid_add_instances(global.grid, ob_entity, false)
				mp_grid_clear_cell(global.grid, floor(x / 32), floor(y / 32))
				mp_grid_clear_cell(global.grid, floor(pl_target.x / 32), floor(pl_target.y / 32))
			}
			move_path = path_add()
			if (mp_grid_path(global.grid, move_path,x, y, pl_target.x, pl_target.y, true)){
				path_start(move_path, pl_speed, path_action_stop, false)
			}else{
				endmove(move_path)
				instance_destroy(pl_target)
			}
		}

		if path_position = 1
			endmove(move_path);
	break;
	}
	case type_move.direct: {
		if instance_exists(pl_target) {
			var _dir = point_direction(x, y, pl_target.x, pl_target.y);
			var _dist = point_distance(x, y, pl_target.x, pl_target.y);
			if (_dist > 1) {
				direction += angle_difference(_dir, direction) * 0.2;
				image_angle = direction;
				speed = min(pl_speed, _dist * 0.2);
			} else {
				cur_think = think.idle;
				speed = 0;
				x = ceil(x / 32) * 32 - 16
				y = ceil(y / 32) * 32 - 16
				
			}
		} else {
			cur_think = think.idle;
		}
	break;
	}
	case type_move.circuite: {			
		if ready_to_attack = false {
			if instance_exists(pl_target) {
				instance_destroy(pl_target)
				pl_target = noone;
			}
			if base_box != noone
			if instance_exists(base_box) {
				pl_target = instance_create_layer(base_box.x, base_box.y, "markers_layer", ob_pl_target)
				init_target(id)
			} else {
				array_resize(units_inplatoon, 0) // destruy platoon in next step
				exit;
			}
		}
	move_smooth(pl_target)
	var _dist = point_distance(x, y, pl_target.x, pl_target.y);
		if _dist < 1 {
			cur_think = think.idle;
			speed = 0;
			x = ceil(x / 32) * 32 - 16
			y = ceil(y / 32) * 32 - 16
		}
	break;
	}

}


