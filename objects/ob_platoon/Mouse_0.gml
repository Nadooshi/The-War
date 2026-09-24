/// @desc
if control_player != 0
	exit;

cur_think = think.player_control
// Inherit the parent event
event_inherited();

with ob_ui_healthbar {
	visible = true;	
}

with ob_ui_bar {
	if type_bar = 0 {
		if other.object_index = ob_pl_harvester {
			traced_id = other.id;
			visible = true;
		} else {
			traced_id = noone;
			visible = false;
		}
	}
}
