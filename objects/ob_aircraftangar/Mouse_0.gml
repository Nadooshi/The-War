/// @desc

if pl_inside = noone {
	if instance_exists(ob_selected) {
		var _sx = sprite_get_width(sprite_index) / 32
		var _sy = sprite_get_height(sprite_index) / 32

		with ob_selected {
			x = other.x - 16;
			y = other.y - 16;
			sprite_index = sp_corsor;
			image_xscale = _sx;
			image_yscale = _sy;
		}
	}
} else {
	if control_player = 0 {
		var _id = pl_inside;
		_id.cur_think = think.player_control;
		if selected = false {
			ob_ui.traced_id = pl_inside;
			selected = true;
			if instance_exists(ob_selected)
				with ob_selected
					instance_destroy();
			with instance_create_layer(x, y, "markers_layer", ob_selected){
				ob_id = _id;
				image_xscale = 1;
				image_yscale = 1;
			}
		}
		with ob_ui_healthbar {
			visible = true;	
		}
	}

}
