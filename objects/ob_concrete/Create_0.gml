/// @desc
l_id = layer_get_id("road")
tl_map = layer_tilemap_get_id(l_id)
datatile = tilemap_get_at_pixel(tl_map,x,y)

alarm_set(0, game_get_speed(gamespeed_fps))







