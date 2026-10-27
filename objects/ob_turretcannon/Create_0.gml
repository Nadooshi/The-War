/// @desc

event_inherited();

b_name = "Turret cannon"
max_health = 2500
cur_health = max_health
marker = noone;

turret_head = instance_create_layer(x, y, "parts_layer", ob_turretcannon_head)
turret_head.control_player = control_player
turret_head.turret_base = id
