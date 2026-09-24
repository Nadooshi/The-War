function weapon(_name, _type_damage, _damage, _reload_time_sec, _accuracy_percent, _num_fire_per_unit, _fx_fire, _fx_explosion) constructor{
	name = _name;
	w_type_damage = _type_damage;
	damage = _damage;
	reload_time = _reload_time_sec;
	accuracy = _accuracy_percent; // 1 = 100%
	number_fire = _num_fire_per_unit;
	fx_fire = _fx_fire;
	fx_explosion = _fx_explosion;
}

enum type_damage {
	bullet,
	high_caliber_bullet,
	bt_cannon,
	at_cannon,
	ex_cannon,
	prt_damage,
	explosion,
	repair,
	heal
}



function weaponlist() {

var _weapon = undefined;
var arr_weapon = [];

_weapon = new weapon("Rifle", type_damage.bullet, 20, 5, 0.5, 2, noone, noone);
array_push(arr_weapon, _weapon)

_weapon = new weapon("Grenade", type_damage.prt_damage,150, 15, 0.75, 1, noone, noone);
array_push(arr_weapon, _weapon)

_weapon = new weapon("Mashingun", type_damage.high_caliber_bullet, 50, 10, 0.35, 15, noone, noone);
array_push(arr_weapon, _weapon)

_weapon = new weapon("Battle tank cannon", type_damage.bt_cannon, 300, 10, 0.3, 1, noone, noone);
array_push(arr_weapon, _weapon)

_weapon = new weapon("Artillery cannon", type_damage.at_cannon, 500, 30, 0.5, 1, noone, noone);
array_push(arr_weapon, _weapon)

_weapon = new weapon("Medical cure", type_damage.heal, -50, 10, 1, 1, noone, noone);
array_push(arr_weapon, _weapon)

_weapon = new weapon("Guided rocket", type_damage.explosion, 200, 10, 1, 2, noone, noone);
array_push(arr_weapon, _weapon)

_weapon = new weapon("Hellfire rocket", type_damage.explosion, 100, 30, 15, 8, noone, noone);
array_push(arr_weapon, _weapon)


delete _weapon
return arr_weapon

}

