/// @desc

// Inherit the parent event
event_inherited();

unit_name = "Air fighter"

pl_speed = 1.2;
unit_health = 150
movement = type_move.circuite
base_box = ob_aircraftangar

att_dist_max = 3 * 32 // клетки * пиксели. Дистанция в пикселях.
att_dist_min = 1 * 32
dodge = 0.99 // repcent for dodge max 1

arr_ind = array_find_ind_to_name(arr_unit, unit_name)
arr_weapon = weaponlist();
unit_weapon[0] = arr_weapon[array_find_ind_to_name(arr_weapon, "Mashingun")];
unit_weapon[1] = arr_weapon[array_find_ind_to_name(arr_weapon, "Hellfire rocket")];
unit_type_brone = brone_types.vehicle_light
