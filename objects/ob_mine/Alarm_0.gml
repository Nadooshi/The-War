/// @desc
var _crate = instance_create_layer(x,y,"Instances", ob_crate,{image_index : 0})
with _crate {
	move_outside_all(irandom(360), 1000);
	move_snap(32, 32)
	x -= 16
	y -= 16
	image_angle = irandom(360)
}
alarm_set(0, _t)





