/// @desc
if control_player != 0
 exit;

var ok = true
// check for valid ground
var mp_tiles = layer_tilemap_get_id("ground")
for (var i = 0; i < 2; ++i){
	for (var l = 0; l < 2; ++l){
		var tl_x = tilemap_get_cell_x_at_pixel(mp_tiles, x + (32 * i), y + (32 * l))
		var tl_y = tilemap_get_cell_y_at_pixel(mp_tiles, x + (32 * i), y + (32 * l))
		var cur_tile = tilemap_get(mp_tiles, tl_x, tl_y)
		if cur_tile <> 23{
			ok = false;
			break;
		}
		if place_meeting(x + 32 * i, y + 32 * l, ob_entity){
			ok = false;
			break;
		}
	}
}

if not ok {
	//show_message("Can't build here")
} else {
	alarm_set(0, deploy_time)
	deploy = true;
}


