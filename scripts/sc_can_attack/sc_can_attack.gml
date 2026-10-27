// Универсальные функции атаки.
// Используются и юнитами (ob_platoon_attack), и базами (ob_base_attack).
//поиск цели
function can_attack_find_target(_att_dist_max, _control_player){
	var _tg = noone;
	var _best = _att_dist_max;
	for (var i = 0; i < instance_number(ob_platoon); i++) {
		var _p = instance_find(ob_platoon, i);
		if _p.control_player != _control_player and _p.control_player >= 0 {
			var _d = distance_to_object(_p);
			if _d < _best {
				_best = _d;
				_tg = _p;
			}
		}
	}
	return _tg;
}
// Обновляет таймеры перезарядки и возвращает массив готовности оружия.
// _reload_timer изменяется (массив по ссылке).
function can_attack_reload(_weapons, _reload_timer) {
	var _w_ok = array_create(array_length(_weapons), false);
	for (var t = 0; t < array_length(_weapons); t++) {
		_reload_timer[t] -= 1;
		if _reload_timer[t] <= 0
			_w_ok[t] = true;
	}
	return _w_ok;
}

// Урон одного выстрела по цели с учётом брони и уклонения.
// Возвращает 0, если выстрел промахнулся.
function can_attack_damage(_weapon, _dam_mod, _dam_upg, _armor, _dodge) {
	var _dmg = _weapon.damage * _dam_mod + _dam_upg;
	if calculate_accuracy(_weapon.accuracy, _dodge)
		return calculate_damage(_dmg, _weapon.w_type_damage, _armor);
	return 0;
}
