/// @desc


// Inherit the parent event
event_inherited();
unit_name = "Trike"

pl_speed = 1.75;
movement = type_move.pathing

unit_health = 50
dodge = 0.6 // repcent for dodge

att_dist_max = 2 * 32 // клетки * пиксели. Дистанция в пикселях.
att_dist_min = 0

arr_ind = array_find_ind_to_name(arr_unit, unit_name)
unit_weapon[0] = arr_weapon[array_find_ind_to_name(arr_weapon, "Rifle")];
unit_type_brone = brone_types.vehicle_light;


