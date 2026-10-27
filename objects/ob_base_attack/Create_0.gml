control_player = -1
init = false

b_name = "name"
max_health = 0
cur_health = max_health

// оружие базы (переопределяется в конкретных башнях)
arr_weapon = weaponlist();
init_weapon = [];

dam_upg = 0;
dam_mod = 0;
reload_timer = [];
att_dist_max = 0 * 32;
att_dist_min = 0;


// стартовая перезарядка
for (var i = 0; i < array_length(init_weapon); i++)
	array_push(reload_timer, sec_to_step(init_weapon[i].reload_time));