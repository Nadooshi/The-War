function b_item(_name, _cost, _power, _b_time, _b_pic, _b_obj, _b_size, _depend) constructor {

 b_name = _name;
 cost = _cost;
 b_pow = _power;
 b_time = _b_time;
 b_pic = _b_pic;
 b_obj = _b_obj // instance
 b_size = _b_size // 1 - 1x1, 2 - 2x2, 3 - 3x3
 depend = _depend
}


function baselist(_array) {
base = _array

var _item = new b_item("Concrete", 50, 0, 1.5, "sp_concrete", ob_concrete, 1, "Construction yard")
array_push(base, _item)

_item = new b_item("Power plant", 300, 30, 3, "sp_powerplant", ob_powerplant, 2, "Construction yard")
array_push(base, _item)

_item = new b_item("Refinery", 600, -10, 5, "sp_refinery", ob_refinery, 2, "Power plant")
array_push(base, _item)

_item = new b_item("Silo", 200, -5, 5, "sp_silo", ob_silo, 1, "Refinery")
array_push(base, _item)

_item = new b_item("Barracks", 300, -10, 10, "sp_barrack", ob_barrack, 2, "Power plant")
array_push(base, _item)

_item = new b_item("Comm. center", 500, -20, 5, "sp_command", ob_command, 3, "Barracks")
array_push(base, _item)

_item = new b_item("Outpost", 500, -20, 5, "sp_outpost", ob_outpost, 1, "Power plant")
array_push(base, _item)

_item = new b_item("Spaceport", 700, -25, 8, "sp_spaceport", ob_spaceport, 2, "Outpost")
array_push(base, _item)

_item = new b_item("Aircraft", 900, -20, 8, "sp_aircraft", ob_aircraft, 3, "Outpost")
array_push(base, _item)

_item = new b_item("Hangar", 100, -5, 3, "sp_aircraftangar", ob_aircraftangar, 1, "Aircraft")
array_push(base, _item)



delete _item;
return base;
}