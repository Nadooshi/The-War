function unit (_base_menu, _name, _pic, _depend, _cost, _build_time, _object, _takePlace_in_platoon, _needboxbase_obj) constructor {
	base_is = _base_menu;
	name = _name;
	b_pic = _pic;
	depend = _depend;
	cost = _cost;
	b_time = _build_time;
	obj = _object;
	take_place = _takePlace_in_platoon
	needbox = _needboxbase_obj
}
enum base_menu {
	any,
	barrack,
	starport,
	vehicle,
	aircraft
}

function unitlist(_base_menu, _array){
var b_is = _base_menu
var arr_unit = _array;
var _unit = undefined;

_unit = new unit(base_menu.barrack, "Infantry", "sp_unitinfantry", "", 50, 5, ob_pl_infantry, 1, noone);
if _unit.base_is == b_is or b_is = base_menu.any
	array_push(arr_unit, _unit);

_unit = new unit(base_menu.barrack, "Medic truck", "sp_unitmedic", "Comm. center", 150, 15, ob_pl_medic, 3, noone);
if _unit.base_is == b_is or b_is = base_menu.any
	array_push(arr_unit, _unit);





_unit = new unit(base_menu.starport, "Medic truck", "sp_unitmedic", "Comm. center", 250, 5, ob_pl_medic, 3, noone);
if _unit.base_is == b_is or b_is = base_menu.any
	array_push(arr_unit, _unit);

_unit = new unit(base_menu.starport, "Battle tank", "sp_unittank", "", 450, 5, ob_pl_tank, 3, noone);
if _unit.base_is == b_is or b_is = base_menu.any
	array_push(arr_unit, _unit);

_unit = new unit(base_menu.starport, "Harvester", "sp_unitharvester", "", 400, 3, ob_pl_harvester, 3, noone);
if _unit.base_is == b_is or b_is = base_menu.any
	array_push(arr_unit, _unit);

_unit = new unit(base_menu.starport, "MCV", "sp_unitMCV", "", 999, 15, ob_pl_MCV, 10, noone);
if _unit.base_is == b_is or b_is = base_menu.any
	array_push(arr_unit, _unit);

_unit = new unit(base_menu.aircraft, "Helicopter", "sp_unithelicopter", "Comm. center", 650, 25, ob_pl_helicopter, 3, noone);
if _unit.base_is == b_is or b_is = base_menu.any
	array_push(arr_unit, _unit);

_unit = new unit(base_menu.aircraft, "Air fighter", "sp_unitfighter", "Hangar", 650, 15, ob_pl_fighter, 2, ob_aircraftangar);
if _unit.base_is == b_is or b_is = base_menu.any
	array_push(arr_unit, _unit);







delete _unit;
return arr_unit;
}