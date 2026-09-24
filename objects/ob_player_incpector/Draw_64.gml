/// @desc
draw_set_font(fn_digit)
font_enable_effects(fn_digit, true, {
	outlineEnable: true,
    outlineDistance: 2,
    outlineColour: c_black
})
var _m = round(global.money);
draw_text_ext_transformed_color(50, 50, "$" + string(_m),3, 300, 2, 2, 0, c_orange, c_orange, c_orange, c_orange, 1)

font_enable_effects(fn_digit, false,{})





