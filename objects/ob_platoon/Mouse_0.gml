/// @desc
if control_player != 0
	exit;

cur_think = think.player_control
// Inherit the parent event
event_inherited();

with ob_ui_healthbar {
	visible = true;	
}
