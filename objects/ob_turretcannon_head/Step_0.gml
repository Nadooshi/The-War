// control_player задаётся базе уже после Create, поэтому берём его у turret_base
if instance_exists(turret_base)
	control_player = turret_base.control_player;

event_inherited();
