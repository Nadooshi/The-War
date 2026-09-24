/// @desc

// Inherit the parent event
event_inherited();

unit_name = "Helicopter"

pl_speed = 0.8;
unit_health = 150
movement = type_move.direct

att_dist_max = 5 * 32 // клетки * пиксели. Дистанция в пикселях.
att_dist_min = 1 * 32
dodge = 0.95 // repcent for dodge max 1

arr_ind = array_find_ind_to_name(arr_unit, unit_name)
arr_weapon = weaponlist();
unit_weapon[0] = arr_weapon[array_find_ind_to_name(arr_weapon, "Mashingun")];
unit_weapon[1] = arr_weapon[array_find_ind_to_name(arr_weapon, "Guided rocket")];
unit_type_brone = brone_types.vehicle_medium

