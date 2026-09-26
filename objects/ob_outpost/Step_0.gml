/// @desc
if ob_player_incpector.pow_val < 0 {
	if not instance_exists(marker)
		marker = instance_create_layer(x-16, y-16, "markers_layer", ob_mark_ok, {sprite_index : sp_mark_nopower});
	image_speed = 0;
} else {
	instance_destroy(marker)
	image_speed = 1;
}



