/// @desc refresh platoon
cur_unit_health = min(unit_health, cur_unit_health)

for (var i = 0; i < array_length(units_inplatoon); i++) { // нельзя заменить array_length(units_inplatoon) на _len. Тут массив изменяется.
	if units_inplatoon[i].cur_unit_health <= 0 
		array_delete(units_inplatoon, i, 1)
}

var _len = array_length(units_inplatoon)
pl_freeplace = 10;
platoon_health = 0;
for (var i = 0; i < _len; i++) {
	platoon_health += units_inplatoon[i].cur_unit_health;
	pl_freeplace -= arr_unit[units_inplatoon[i].arr_ind].take_place;
}
// for UI
max_health = 0
for (var i = 0; i < _len; i++) {
	max_health += units_inplatoon[i].unit_health;
}	
cur_health = platoon_health;

