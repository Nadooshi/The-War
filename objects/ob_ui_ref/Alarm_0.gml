/// @desc
var _found = false;
for (var i = 0; i < instance_number(ob_refinery); i++) {
	if instance_find(ob_refinery, i).control_player == 0 {
		_found = true;
		break;
	}
}
if _found {
	visible = true;
} else {
	alarm_set(0, sec_to_step(1))
}
