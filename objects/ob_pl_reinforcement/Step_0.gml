/// @desc

if instance_exists(in_cargo) {
	in_cargo.x = x;
	in_cargo.y = y;
	in_cargo.cur_think = think.evacuate;
	in_cargo.image_angle = direction;
}

switch cur_think {
	case think.idle : {
		if alarm_get(0) < 0
			alarm_set(0, sec_to_step(1))
		
	break;
	}

	case think.move: {
		if not path_exists(move_path)
		if instance_exists(pl_target) 
		if distance_to_point(pl_target.x, pl_target.y) > pl_speed {
			move_towards_point(pl_target.x, pl_target.y, pl_speed)
			} else {
				x = pl_target.x
				y = pl_target.y
				direction = 0;
				speed = 0;
				cur_think = think.idle
				if in_cargo != noone
					cur_think = think.unload;				
			}
		break;
	}

	
	case think.unload : {
		pl_target.tg_id.image_speed = 0
		pl_target.tg_id.image_index = 0
		instance_destroy(pl_target)
		in_cargo.cur_think = think.idle
		in_cargo = noone;
		cur_think = think.idle;
		direction = direction + irandom(360) - 180;
		image_angle = direction;
		speed = pl_speed;
	break;
	}
}
//if x < 0 or x > room_height or y < 0 or y > room_width {
var br_x = camera_get_view_height(view_camera[0]) + camera_get_view_x(view_camera[0])
var br_y = camera_get_view_width(view_camera[0]) + camera_get_view_y(view_camera[0])
if x < 0 or x > br_x or y < 0 or y > br_y {
	if instance_exists(pl_target)
		instance_destroy(pl_target);
	instance_destroy();
}



