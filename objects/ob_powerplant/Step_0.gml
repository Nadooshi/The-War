/// @desc
if ob_player_incpector.pow_val < 0 {
	if not instance_exists(marker)
		marker = instance_create_layer(x, y, "markers_layer", ob_mark_ok, {sprite_index : sp_mark_nopower})
} else {
	instance_destroy(marker)
}







