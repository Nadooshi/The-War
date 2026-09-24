/// @desc
// Inherit the parent event
event_inherited();
if instance_exists(ob_selected) {
	var _sx = sprite_get_width(sprite_index) / 32
	var _sy = sprite_get_height(sprite_index) / 32

	with ob_selected {
		x = other.x
		y = other.y
		sprite_index = sp_corsor;
		image_xscale = _sx;
		image_yscale = _sy;
	}
}

