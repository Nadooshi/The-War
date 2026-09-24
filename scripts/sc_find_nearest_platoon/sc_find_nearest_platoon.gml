function find_nearest_platoon(_object_platoon){
// @desc only in base
var _n = instance_number(_object_platoon)
var _near_platoon = noone;
for (var i = 0; i < _n; i++) {
	var find_pl = instance_find(_object_platoon, i)
	var _d = round(distance_to_object(find_pl) / 32)
	if _d <= 1
	if find_pl.pl_freeplace >= b_menu[cur_item].take_place {
		_near_platoon = find_pl;
		break;
	}
}
 return _near_platoon;
}