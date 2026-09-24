/// @desc


// Inherit the parent event
event_inherited();
unit_name = "Battle tank"

pl_speed = 0.5;
movement = type_move.pathing

unit_health = 400
dodge = 0.1 // repcent for dodge

att_dist_max = 4 * 32 // клетки * пиксели. Дистанция в пикселях.
att_dist_min = 0

arr_ind = array_find_ind_to_name(arr_unit, unit_name)
unit_weapon[0] = arr_weapon[array_find_ind_to_name(arr_weapon, "Battle tank cannon")];
unit_weapon[1] = arr_weapon[array_find_ind_to_name(arr_weapon, "Mashingun")];
unit_type_brone = brone_types.tank_heavy;


