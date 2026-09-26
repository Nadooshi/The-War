/// @desc
var _ang = irandom(360);
var _rad = irandom_range(48, 96);
var _crate = instance_create_layer(x + 16 + lengthdir_x(_rad, _ang), y + 16 + lengthdir_y(_rad, _ang), "Instances", ob_crate, {image_index : 0})
with _crate {
	move_snap(32, 32)
	x -= 16
	y -= 16
	image_angle = irandom(360)
}
alarm_set(0, _t)





