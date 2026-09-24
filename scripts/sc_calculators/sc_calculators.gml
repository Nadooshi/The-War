function calculate_accuracy(_attack_accuracy, _defence_dodge){
	var _res = _attack_accuracy * (1 - _defence_dodge);
	var _rnd = random(1);
	return _rnd <= _res
	
}

function calculate_damage(damage, damage_type, armor_type) {
	var damage_reduction = armor_type[damage_type];
	var final_damage = damage * (1 - damage_reduction);
		
	return final_damage;
}

