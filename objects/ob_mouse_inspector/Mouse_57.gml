/// @desc
var _rx = floor(mouse_x / 32) * 32 + 16
var _ry = floor(mouse_y / 32) * 32 + 16

if instance_exists(ob_selected){
	for (var i = 0; i < instance_number(ob_pl_target); ++i;){
		var c_tg = instance_find(ob_pl_target, i)
		if c_tg.master_id = ob_selected.ob_id
			instance_destroy(c_tg);
	}
	for (var i = 0; i < instance_number(ob_platoon); ++i)
		if ob_selected.ob_id = instance_find(ob_platoon, i){
			ob_selected.ob_id.cur_think = think.move
			ob_selected.ob_id.pl_target = instance_create_layer(_rx, _ry, "markers_layer", ob_pl_target)
			init_target(ob_selected.ob_id)
		break;
		}
}


