/// @desc CPU base-building AI

control_player = team;

// ---- economy ----
global.money[control_player] = 1000;
//money_income = 15

// ---- build state ----
build_timer = -1;  // -1 idle, >0 countdown to placement
build_item = noone; // b_item being built
build_cx = -1;
build_cy = -1;

// ---- thinking ----
think_interval = sec_to_step(0.5);
think_timer = sec_to_step(0.5);

// ---- available buildings ----
build_menu = baselist([]);

// ===== helpers =====

// count my buildings of a given object type
function cpu_count(_obj) {
	var _n = 0;
	var _c = instance_number(_obj);
	for (var i = 0; i < _c; i++)
		if instance_find(_obj, i).control_player == control_player
			_n++;
	return _n;
}

// first of my bases (used as the anchor to build near)
function cpu_anchor() {
	var _c = instance_number(ob_base);
	for (var i = 0; i < _c; i++) {
		var _b = instance_find(ob_base, i);
		if _b.control_player == control_player
			return _b;
	}
	return noone;
}

// find b_item by name
function cpu_item(_name) {
	for (var i = 0; i < array_length(build_menu); i++)
		if build_menu[i].b_name == _name
			return build_menu[i];
	return noone;
}

// is the size x size footprint at cell (_cx,_cy) buildable?
function cpu_cell_ok(_cx, _cy, _size) {
	var _tiles = layer_tilemap_get_id("ground");

	// 1-cell corridor around 2x2 production buildings for unit passage
	var _margin = 0;
	if _size == 2
		_margin = 1;

	// footprint: valid ground + no entity
	for (var i = 0; i < _size; i++)
	for (var j = 0; j < _size; j++) {
		var _x = _cx + i;
		var _y = _cy + j;
		if _x < 0 or _y < 0 or _x >= (room_width div 32) or _y >= (room_height div 32)
			return false;
		var _px = _x * 32 + 16;
		var _py = _y * 32 + 16;
		if tilemap_get(_tiles, tilemap_get_cell_x_at_pixel(_tiles, _px, _py), tilemap_get_cell_y_at_pixel(_tiles, _px, _py)) != 23
			return false;
		if instance_position(_px, _py, ob_entity) != noone
			return false;
	}

	// margin: keep a corridor clear of buildings so units can pass
	if _margin > 0 {
		for (var i = -_margin; i < _size + _margin; i++)
		for (var j = -_margin; j < _size + _margin; j++) {
			if i >= 0 and j >= 0 and i < _size and j < _size
				continue; // footprint already checked above
			var _x = _cx + i;
			var _y = _cy + j;
			if _x < 0 or _y < 0 or _x >= (room_width div 32) or _y >= (room_height div 32)
				return false;
			if instance_position(_x * 32 + 16, _y * 32 + 16, ob_base) != noone
				return false;
		}
	}

	return true;
}

// nearest buildable cell to (_cx,_cy)
function cpu_find_place(_cx, _cy, _size) {
	for (var r = 0; r < 24; r++) {
		for (var dx = -r; dx <= r; dx++)
		for (var dy = -r; dy <= r; dy++) {
			if max(abs(dx), abs(dy)) != r
				continue;
			var _nx = _cx + dx;
			var _ny = _cy + dy;
			if cpu_cell_ok(_nx, _ny, _size)
				return [_nx, _ny];
		}
	}
	return noone;
}

// do I have the dependency building?
function cpu_has_dep(_depend) {
	if _depend == "" return true;
	var _c = instance_number(ob_base);
	for (var i = 0; i < _c; i++) {
		var _b = instance_find(ob_base, i);
		if _b.control_player == control_player and _b.b_name == _depend
			return true;
	}
	return false;
}

// decide what to build next
function cpu_choose() {
	var _pp = cpu_count(ob_powerplant);
	var _ref = cpu_count(ob_refinery);
	var _bar = cpu_count(ob_barrack);
	var _sil = cpu_count(ob_silo);
	var _veh = cpu_count(ob_vehicle);
	var _com = cpu_count(ob_command);

	if _pp == 0 or global.pow_val[control_player] <= 10
		return cpu_item("Power plant");
	if _ref == 0
		return cpu_item("Refinery");
	if _bar == 0
		return cpu_item("Barracks");
	if _sil == 0
		return cpu_item("Silo");
	if _veh == 0
		return cpu_item("Veh. factory");
	if _com == 0
		return cpu_item("Comm. center");
	if _ref < 2
		return cpu_item("Refinery");
	if _pp < 4
		return cpu_item("Power plant");
	return noone;
}

// main decision step
function cpu_think() {
	var _anchor = cpu_anchor();
	if _anchor == noone
		return;

	var _item = cpu_choose();
	if _item == noone
		return;
	if not cpu_has_dep(_item.depend)
		return;
	if global.money[control_player] < _item.cost
		return;

	var _place = cpu_find_place(floor(_anchor.x / 32), floor(_anchor.y / 32), _item.b_size);
	if _place == noone
		return;

	// start building
	build_item = _item;
	build_cx = _place[0];
	build_cy = _place[1];
	build_timer = sec_to_step(_item.b_time);
	global.money[control_player] -= _item.cost;
}

// place the finished building
function cpu_finish() {
	var _b = instance_create_layer(build_cx * 32 + 16, build_cy * 32 + 16, "Instances", build_item.b_obj);
	_b.control_player = control_player;
	_b.b_name = build_item.b_name;
	_b.pow_gen = build_item.b_pow;

	build_item = noone;
	build_timer = -1;
	build_cx = -1;
	build_cy = -1;
	think_timer = 0;
}
