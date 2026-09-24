/// @desc
var ok = true;
for (var _p = 0; _p < instance_number(ob_select_place); _p++) {
	var _place = instance_find(ob_select_place, _p)
	if _place.image_index > 1 
		ok = false
}
if ok {
	var _complete_item = instance_create_layer(x, y, "Instances", cur_base)
	_complete_item.control_player = 0;
	_complete_item.b_name = master_base.b_menu[cur_item].b_name
	_complete_item.pow_gen = master_base.b_menu[cur_item].b_pow
	if master_base.b_ready = 1
		instance_destroy(master_base.marker)

	master_base.b_ready = 2
	master_base.UI_progress = 0
	with ob_select_place {
		instance_destroy()
	}
} 








