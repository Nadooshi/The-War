/// @desc init

// Inherit the parent event
event_inherited();
var i = 0;
repeat (array_length(init_weapon)) {
	array_push(reload_timer, sec_to_step(init_weapon[i].reload_time));
	i++
}

init = true