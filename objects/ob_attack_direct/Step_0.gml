/// @desc
if def_side = noone or att_side = noone {
	instance_destroy();
	exit;
}

if instance_exists(def_side) and instance_exists(att_side) {
	image_angle = point_direction(att_side.x, att_side.y, def_side.x, def_side.y)
} else {
	instance_destroy();	
}




