/// @desc

if pl_inside = noone {
	marker = instance_create_layer(x, y, "markers_layer", ob_mark_ok)
	marker.sprite_index = sp_mark_free
} else {
	with marker
		instance_destroy();
}




