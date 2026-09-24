/// @desc
if instance_number(ob_powerplant) > 0 {
	visible = true;
} else {
	alarm_set(0, sec_to_step(1))
}


