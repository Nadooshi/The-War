/// @desc
if control_player != 0
	exit;

var _pic = sprite_get_name(sprite_index) + "_smpic"

with ob_ui_cursel {
	visible = true;
	sprite_index = asset_get_index(_pic)
	image_xscale = (128 / sprite_get_width(sprite_index)) * 0.5;
	image_yscale = image_xscale;
}

with ob_ui_healthbar {
	visible = true
	traced_id = other.id	
}


with ob_ui_bar {
	switch type_bar {
		case 0: // UI bar for any progress
			visible = true;
			traced_id = other.id
		break;
	}
	
}



