/// @desc
enum think {
	idle,
	move,
	harvest,
	unload,
	attack,
	fire,
	evacuate,
	runaway,
	player_control
}
enum type_move {
	none,
	pathing,
	direct,
	circuite,
	pointer,
	teleport
}
event_inherited()

platoon_health = 0
pl_speed = 0
pl_target = noone;
move_path = noone;
mark_attack = noone;
att_dist_max = 0;
att_dist_min = 0;
ready_to_attack = false;
is_dead = false;
max_health = 0;
cur_health = 0;
movement = type_move.pathing
ignore_obstacles = false;
base_box = noone;
direction_idle = -1;

cur_think = think.idle; // текущие мысли

// Процент снижения урона
brone_types = {
	no_brone: [0, 0, 0, 0, 0, 0, 0, 1, 1],
	infantry_light: [0.5, 0.1, 0, 0, 0, 0.75, 0, 1, 0],
	infantry_heavy: [0.75, 0.3, 0, 0, 0, 0.95, 0.3, 1, 0],
	vehicle_light: [0.5, 0.1, 0, 0, 0, 0.75, 0.3, 0, 1],
	vehicle_medium: [0.75, 0.3, 0.1, 0.1, 0.3, 1, 0.5, 0, 1],
	vehicle_heavy: [1, 0.5, 0.2, 0.1, 0.3, 1, 0.75, 0, 1],
	tank_light: [1, 0.75, 0.3, 0.2, 0.5, 1, 0.75, 0.1, 1],
	tank_heavy: [1, 1, 0.5, 0.3, 0.5, 1, 0.80, 0.3, 1]
};


units_inplatoon = [];
pl_form = platoon_formation_triangle
pl_freeplace = 10;
arr_unit = [];
arr_unit = unitlist(base_menu.any , arr_unit);
unit_type_brone = brone_types.no_brone
reload_timer = []

dodge = 0;
cur_unit_health = 0

function endmove (_path) {
	
	if path_exists(_path){
		instance_destroy(pl_target)
		mp_grid_clear_all(global.grid)
		mp_grid_add_instances(global.grid, ob_entity,false)
		cur_think = think.idle;
	}
}
function move_smooth(_pl_target){
		if instance_exists(_pl_target) {
			cur_think = think.move
			image_speed = 1;
			var _dir = point_direction(x, y, _pl_target.x, _pl_target.y);
			var _dist = point_distance(x, y, _pl_target.x, _pl_target.y);
			direction += angle_difference(_dir, direction) * 0.2;
			image_angle = direction;
			speed = min(pl_speed, _dist * 0.2);
		}
}
//=================================================================================
