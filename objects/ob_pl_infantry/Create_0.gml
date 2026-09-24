/// @desc

// Inherit the parent event
event_inherited();

unit_name = "Infantry"

pl_speed = 0.2;
unit_health = 150
movement = type_move.pathing

att_dist_max = 3 * 32 // клетки * пиксели. Дистанция в пикселях.
att_dist_min = 0
dodge = 0.75 // repcent for dodge

arr_ind = array_find_ind_to_name(arr_unit, unit_name)
arr_weapon = weaponlist();
unit_weapon[0] = arr_weapon[array_find_ind_to_name(arr_weapon, "Rifle")];
unit_weapon[1] = arr_weapon[array_find_ind_to_name(arr_weapon, "Grenade")];
unit_type_brone = brone_types.infantry_light

