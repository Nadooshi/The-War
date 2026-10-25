/// @desc

if pl_inside = noone {
	if not instance_exists(marker)
		marker = instance_create_layer(x, y, "markers_layer", ob_mark_ok, {sprite_index : sp_mark_free})
} else {
	instance_destroy(marker)
	if place_meeting(x,y,pl_inside)
	pl_inside.visible = false;
	if pl_inside.cur_think != think.idle
		pl_inside.visible = true
}




