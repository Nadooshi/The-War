/// @desc
draw_self()
/*
// draw path
if path_exists(move_path)
draw_path(move_path, x, y, false)
*/


if path_exists(move_path)
if (path_position + 0.1 < 1) {
	var _cx = path_get_x(move_path, path_position + 0.1)
	var _cy = path_get_y(move_path, path_position + 0.1)
	image_angle = round(point_direction(x, y, _cx, _cy) / 45) * 45
}

draw_text_ext_transformed_color(x+16, y-16, string(array_length(units_inplatoon)),1, 36, 0.5, 0.5, 0, c_white, c_white, c_white, c_white, 1)

