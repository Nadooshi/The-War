/// @desc

// Inherit the parent event
event_inherited();

b_name = "Wall"
max_health = 2500
cur_health = max_health
marker = noone;
image_speed = 0;

// подбор кадра по соседям (без диагоналей)
// bitmask: right=1, bottom=2, left=4, top=8
function wall_update() {
	var _m = 0;
	if instance_position(x + 32, y, ob_wall) != noone _m += 1; // справа
	if instance_position(x, y + 32, ob_wall) != noone _m += 2; // снизу
	if instance_position(x - 32, y, ob_wall) != noone _m += 4; // слева
	if instance_position(x, y - 32, ob_wall) != noone _m += 8; // сверху
switch _m {
		case 0: image_index = 0; break;  // нет состыковки
		case 1: image_index = 1; break;  // справа
		case 3: image_index = 2; break;  // справа+снизу
		case 7: image_index = 3; break;  // справа+снизу+слева
		case 2: image_index = 4; break;  // снизу
		case 6: image_index = 5; break; // снизу+слева
		case 14: image_index = 6; break;  // снизу+слева+сверху
		case 4: image_index = 7; break;  // слева
		case 12: image_index = 8; break;  // слева+сверху
		case 13: image_index = 9; break; // слева+сверху+справа
		case 8: image_index = 10; break; // сверху
		case 9: image_index = 11; break; // сверху+справа
		case 11: image_index = 12; break; // сверху+справа+снизу
		case 5: image_index = 13; break; // слева+справа
		case 10: image_index = 14; break; // сверху+снизу
		case 15: image_index = 15; break; // со всех сторон
	}
}

// обновить себя и соседей (нужно при появлении новой стенки)
function wall_refresh() {
	wall_update();
	var _n = noone;
	_n = instance_position(x + 32, y, ob_wall); if _n != noone _n.wall_update();
	_n = instance_position(x - 32, y, ob_wall); if _n != noone _n.wall_update();
	_n = instance_position(x, y + 32, ob_wall); if _n != noone _n.wall_update();
	_n = instance_position(x, y - 32, ob_wall); if _n != noone _n.wall_update();
}

wall_refresh();
