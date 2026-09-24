/// @desc
if global.money + pice_money_tic > 0
	global.money = max(global.money + pice_money_tic, 0)
	
var _n = 0;
if instance_exists(ob_base)
	_n = instance_number(ob_base)
	pow_val = 0;
	for (var i = 0; i < _n; i++){
		var _b = instance_find(ob_base,i)
		pow_val += _b.pow_gen
	}

if global.money > 50
	with ob_mark_ok {
		if sprite_index = sp_mark_nomoney
			instance_destroy()
	}


