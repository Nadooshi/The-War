/// @desc
draw_set_font(fn_digit)
font_enable_effects(fn_digit, true, {
	outlineEnable: true,
    outlineDistance: 2,
    outlineColour: c_black
})
var _m = round(global.money);
draw_text_ext_transformed_color(50, 50, "$" + string(_m),3, 300, 2, 2, 0, c_orange, c_orange, c_orange, c_orange, 1)

var _c0 = view_camera[0];
var _c1 = view_camera[1];
draw_set_color(c_white)
draw_text(50, 110, "Cam 0 (id " + string(_c0) + "): " + string(camera_get_view_x(_c0)) + ", " + string(camera_get_view_y(_c0)))
draw_text(50, 140, "Cam 1 (id " + string(_c1) + "): " + string(camera_get_view_x(_c1)) + ", " + string(camera_get_view_y(_c1)))

font_enable_effects(fn_digit, false,{})





