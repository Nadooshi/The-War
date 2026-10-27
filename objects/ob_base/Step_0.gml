// Взрыв и разрушение базы

if cur_health <= 0 {
	var _expl = instance_create_layer(x, y, "markers_layer", ob_explode_big)
	_expl.sz = sprite_get_height(sprite_index)
	instance_destroy()
}
