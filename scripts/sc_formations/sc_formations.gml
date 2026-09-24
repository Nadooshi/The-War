function platoon_formation_line(_start_x, _start_y, _spacing, _array_platoon_units){
	if array_length(_array_platoon_units) <= 0
		exit;
var start_x = _start_x;
var start_y = _start_y;
var spacing = _spacing;  // Расстояние между объектами
var pl_obj = _array_platoon_units;
var num_objects = array_length(pl_obj) // Количество объектов

	for (var i = 0; i < num_objects; i++) {
		var obj = instance_create_layer(start_x + i * spacing, start_y, "Instances", pl_obj[i]);
	}
}

function platoon_formation_round(_center_x, _center_y, _radius, _array_platoon_units){
	if array_length(_array_platoon_units) <= 0
		exit;
var center_x = _center_x
var center_y = _center_y
var radius = _radius
var pl_obj = _array_platoon_units;
var num_objects = array_length(pl_obj) // Количество объектов
var angle = 0;
var _ux = 0, _uy = 0;

	for (var i = 0; i < num_objects; i++) {
		angle = i * (360 / num_objects); // Угол для каждого объекта
	    _ux = center_x + lengthdir_x(radius, angle);
	    _uy = center_y + lengthdir_y(radius, angle);
	    var obj = instance_create_layer(_ux, _uy, "Instances", pl_obj[i]);
	}

}

function platoon_formation_chess(_start_x, _start_y, _spacing_x, _spacing_y, _raws, _columns, _array_platoon_units){
	if array_length(_array_platoon_units) <= 0
		exit;
var start_x = _start_x
var start_y = _start_y
var spacing_x = _spacing_x
var spacing_y = _spacing_y
var rows = _raws
var cols = _columns
var pl_obj = _array_platoon_units;
var num_objects = array_length(pl_obj) // Количество объектов
var _n = 0, _ux = 0, _uy = 0, offset_x = 0;

	for (var i = 0; i < rows; i++) {
	    for (var j = 0; j < cols; j++) {
			_n++
			offset_x = (i % 2) * (spacing_x / 2); // Смещение для шахматного порядка
			_ux = start_x + j * spacing_x + offset_x;
			_uy = start_y + i * spacing_y;
	        var obj = instance_create_layer(x, y, "Instances", pl_obj[_n]);
	    }
	}
}

function platoon_formation_triangle(_start_x, _start_y, _spacing, _raws, _array_platoon_units){
	if array_length(_array_platoon_units) <= 0
		exit;
var start_x = _start_x
var start_y = _start_y
var spacing = _spacing
var rows = _raws
var pl_obj = _array_platoon_units;
var num_objects = array_length(pl_obj) // Количество объектов
var _n = 0, _ux = 0, _uy = 0;

	for (var i = 0; i < rows; i++) {
	    for (var j = 0; j <= i; j++) {
			_n++
			_ux = start_x + j * spacing - i * spacing / 2;
			_uy = start_y + i * spacing;
	        var obj = instance_create_layer(x, y, "Instances", pl_obj[_n]);
	    }
}

}