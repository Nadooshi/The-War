/// @desc
visible = false;
switch type_bar {
	case 0: {
		if instance_exists(traced_id) {
			visible = traced_id.UI_progress > 0;
			image_xscale = clamp(4 * traced_id.UI_progress, 0.5, 4)
		} else {
			visible = false;
		}
	break;
	}
	case 1: {
		var _cof = 0
		if ob_player_incpector.capasity_money > 0 {
			_cof = global.money / ob_player_incpector.capasity_money
			visible = true;
		}
		image_xscale = clamp(4 * _cof, 0.5, 4)
		break;
	}
	case 2: {
		var _cof = 0;
		if ob_player_incpector.capacity_power > 0 {
			_cof =	ob_player_incpector.pow_val / ob_player_incpector.capacity_power
			visible = true;
		}
		image_xscale = clamp(4 * _cof, 0.5, 4)
	break;
	}
		
}






