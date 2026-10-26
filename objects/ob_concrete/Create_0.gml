/// @desc

event_inherited();
b_name = "Concrete"
max_health = 100
cur_health = max_health

// paint road tile (visual + "road" indicator in ob_select_place)
var _l = layer_get_id("road");
var _t = layer_tilemap_get_id(_l);
tilemap_set_at_pixel(_t, 1, x - 16, y - 16);
