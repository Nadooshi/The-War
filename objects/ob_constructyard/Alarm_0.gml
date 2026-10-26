/// @desc build in progress
if b_menu[cur_item].b_obj != noone {
	marker = instance_create_layer(x, y, "markers_layer", ob_mark_ok)
	marker.cur_item = cur_item
	marker.master_obj = id;
	b_ready = 1;
} else {
	// Cancel / апгрейд без размещения на карте
	cur_item = -1;
	b_ready = -1;
}

global.pice_money_tic[control_player] = 0
image_speed = 0
