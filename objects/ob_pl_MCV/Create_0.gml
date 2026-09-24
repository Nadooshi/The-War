/// @desc

unit_name = "MCV"
// Inherit the parent event
event_inherited();

pl_speed = 0.3
movement = type_move.pathing

arr_ind = array_find_ind_to_name(arr_unit, unit_name)
deploy_time = sec_to_step(10)

max_health = 300
cur_health = 300

deploy = false;
d_t_pic_alfa = 0;

image_speed = 0;