// Inherit the parent event
event_inherited();
turret_base = noone;

b_name = "Turret cannon"
max_health = 1500
cur_health = max_health

// оружие базы (переопределяется в конкретных башнях)
arr_weapon = weaponlist();
init_weapon = [];
init_weapon[0] = arr_weapon[array_find_ind_to_name(arr_weapon, "Battle tank cannon")];

dam_upg = 0;
dam_mod = 2;
reload_timer = [];
att_dist_max = 6 * 32;
att_dist_min = 0;


// стартовая перезарядка
for (var i = 0; i < array_length(init_weapon); i++)
	array_push(reload_timer, sec_to_step(init_weapon[i].reload_time));