/// @desc

// Inherit the parent event
event_inherited();

unit_name = "Medic truck"

pl_speed = 1;
unit_health = 100
movement = type_move.pathing

att_dist_max = 1 * 32 // клетки * пиксели. Дистанция в пикселях.
att_dist_min = 0
dodge = 0.2 // repcent for dodge

arr_ind = array_find_ind_to_name(arr_unit, unit_name)
arr_weapon = weaponlist();
unit_weapon[0] = arr_weapon[array_find_ind_to_name(arr_weapon, "Medical cure")];
unit_type_brone = brone_types.no_brone


