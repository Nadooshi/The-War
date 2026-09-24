/// @desc
init = false;
// Inherit the parent event
event_inherited();

arr_weapon = weaponlist();
dam_upg = 0 // add value
dam_mod = 1 // upg in percent
reload_timer = [];
ready_to_attack = false;
unit_weapon = [];

att_dist_max = 0 * 32 // клетки * пиксели. Дистанция в пикселях.
att_dist_min = 0


alarm_set(0, 2)// init