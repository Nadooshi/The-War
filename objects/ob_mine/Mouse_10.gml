/// @desc

with ob_ui_cursel {
	visible = true;
	sprite_index = sp_mine_smpic
	image_xscale = (128 / sprite_get_width(sprite_index)) * 0.5;
	image_yscale = image_xscale;
}

with ob_ui_bar {
	switch type_bar {
		case 0: // UI bar for any progress
			visible = true;
			traced_id = other.id
		break;
	}
	
}








