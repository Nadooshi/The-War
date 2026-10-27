/// @desc


// Inherit the parent event
event_inherited();
unit_name = "Sand buggy"

pl_speed = 1.5;
movement = type_move.pathing

unit_health = 100
dodge = 0.3 // repcent for dodge

att_dist_max = 2 * 32 // клетки * пиксели. Дистанция в пикселях.
att_dist_min = 0

arr_ind = array_find_ind_to_name(arr_unit, unit_name)
init_weapon[0] = arr_weapon[array_find_ind_to_name(arr_weapon, "Mashingun")];
unit_type_brone = brone_types.vehicle_light;


