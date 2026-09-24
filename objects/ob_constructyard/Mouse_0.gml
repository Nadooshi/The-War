/// @desc select_place

if control_player != 0
	exit;


if b_ready = 1{
	var _sz = b_menu[cur_item].b_size;
	for (var i = 0; i < _sz; i++)
	for (var l = 0; l < _sz; l++){
		with instance_create_layer(0 + 32 * i, 0 + 32 * l,"markers_layer", ob_select_place) {
			cur_base = other.b_menu[other.cur_item].b_obj;
			master_base = other.id;
			cur_item = other.cur_item;
			cur_size = _sz;
		}
	}
}
