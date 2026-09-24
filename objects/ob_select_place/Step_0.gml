/// @desc
// move with ob_cursor


x =ob_cursor.x + form_x
y =ob_cursor.y + form_y

image_index = 0

// check distance from base
var _b = instance_nearest(x,y, ob_base)

if distance_to_object(_b) > 32 * cur_size {
	image_index = 2
	exit;	
}
	

// check for valid ground
var mp_tiles = layer_tilemap_get_id("ground")

var tl_x = tilemap_get_cell_x_at_pixel(mp_tiles, x, y)
var tl_y = tilemap_get_cell_y_at_pixel(mp_tiles, x, y)
var cur_tile = tilemap_get(mp_tiles, tl_x, tl_y)
if cur_tile <> 23 or place_meeting(x, y, ob_entity){
	image_index = 2
	exit;	
}

mp_tiles = layer_tilemap_get_id("road")

tl_x = tilemap_get_cell_x_at_pixel(mp_tiles, x, y)
tl_y = tilemap_get_cell_y_at_pixel(mp_tiles, x, y)
cur_tile = tilemap_get(mp_tiles, tl_x, tl_y)

if cur_tile != 0
	image_index = 1






