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
			mp_grid_add_instances(global.grid, ob_entity, false)
			mp_grid_clear_cell(global.grid, floor(x / 32), floor(y / 32))
			mp_grid_clear_cell(global.grid, floor(pl_target.x / 32), floor(pl_target.y / 32))
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
			var _dist = point_distance(x, y, pl_target.x, pl_target.y);
			if (_dist > 1) {
				//mp_potential_step(ob_pl_target.x, ob_pl_target.y, pl_speed, true);
				var _dir = point_direction(x, y, ob_pl_target.x, ob_pl_target.y);
				speed = pl_speed
				direction = lerp(direction, _dir, 0.03)
				image_angle = lerp(image_angle, _dir, 0.03);
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


