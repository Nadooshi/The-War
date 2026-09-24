/// @desc

if instance_exists(ob_id){
	if sprite_index = sp_corsor {
		x = ob_id.x + sprite_get_xoffset(ob_id.sprite_index);
		y = ob_id.y + sprite_get_yoffset(ob_id.sprite_index);
	}
	if sprite_index = sp_selected {
		x = ob_id.x
		y = ob_id.y
	}
} else {
	instance_destroy();
}
