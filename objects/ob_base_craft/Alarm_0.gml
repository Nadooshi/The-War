/// @desc
var _box = noone;
if b_menu[cur_item].needbox != noone {
	var n_box = instance_number(b_menu[cur_item].needbox)
	if n_box > 0
		for (var i = 0; i < n_box; i++) {
			_box = instance_find(b_menu[cur_item].needbox, i)
			if _box.pl_inside = noone {
				_box.pl_inside = create_unit(_box.x, _box.y, b_menu[cur_item], false)
				_box.pl_inside.visible = false
				exit;
			}
		}
	if _box = noone {
		global.money += b_menu[cur_item].cost
		b_ready = 1
	}
}
var _near_platoon = find_nearest_platoon(b_menu[cur_item].obj)
if _near_platoon = noone 
for (var i = 0; i < array_length(b_menu); i++){
	_near_platoon = find_nearest_platoon(b_menu[i].obj)
	if _near_platoon != noone
		break;
}


if _near_platoon != noone {
	array_push(_near_platoon.units_inplatoon, b_menu[cur_item].obj)
	_near_platoon.pl_freeplace -= b_menu[cur_item].take_place;
} else {
	create_unit(x, y, b_menu[cur_item], true)
}

