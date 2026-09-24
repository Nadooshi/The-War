/// @desc
if control_player != 0
	exit;

global.current_construct = id
global.current_picture = sprite_index
global.current_menu = b_menu


global.allbuildings = array_create(0,0)
for (var i = 0; i < instance_number(ob_base); i++) {
	var _obj = instance_find(ob_base, i)
	if _obj.control_player = 0
		array_push(global.allbuildings, _obj.b_name)
}

room_goto(rm_base_menu)





