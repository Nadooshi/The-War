/// @desc

if pl_inside = noone {
	event_inherited()
} else {
	if control_player = 0 {
		var _id = pl_inside;
		_id.cur_think = think.player_control;
		if _id.selected = false {
			ob_ui.traced_id = _id;
			_id.selected = true;
			if instance_exists(ob_selected)
				with ob_selected
					instance_destroy();
			with instance_create_layer(_id.x, _id.y, "markers_layer", ob_selected){
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
