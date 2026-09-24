/// @desc

if res_value <= 0
	instance_destroy()

if coll_able
switch cr_type {
	case type_crate.crate_money : {
		if place_meeting(x,y, ob_entity){
			var _e = instance_nearest(x, y, ob_entity)
			if _e != ob_pl_reinforcement
			if _e.control_player = 0 {
				global.money += res_value
				res_value = 0;
			}
		}
	break;
	}
}





