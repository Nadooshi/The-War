/// @desc
if control_player == 0 and global.pow_val[control_player] < 0 {
	if not instance_exists(marker)
		marker = instance_create_layer(x, y, "markers_layer", ob_mark_ok, {sprite_index : sp_mark_nopower})
} else {
	instance_destroy(marker)
}







