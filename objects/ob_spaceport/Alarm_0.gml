/// @desc

b_ready = 1;


var _un = instance_create_layer(0, 0, "units_layer", b_menu[cur_item].obj)
array_push(_un.units_inplatoon, _un);
_un.pl_freeplace -= b_menu[cur_item].take_place;
_un.control_player = control_player;
_un.cur_think = think.evacuate;

var _cr = instance_create_layer(0, 0, "markers_layer", ob_pl_reinforcement);
_cr.in_cargo = _un;
_cr.pl_target = instance_create_layer(x, y, "markers_layer", ob_pl_target);
_cr.pl_target.tg_id = id;
_cr.pl_target.master_id = _cr;
_cr.cur_think = think.move;

image_speed = 1;
