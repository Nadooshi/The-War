/// @desc

unit_name = "Reinforcement"
// Inherit the parent event
event_inherited();

pl_speed = 1.5
movement = type_move.none //у него уникальное перемещение, игрок на него не влияет

max_health = 100
cur_health = 100
unit_health = 100
cur_unit_health = unit_health

in_cargo = noone // ob_platoon
cur_think = think.idle;

