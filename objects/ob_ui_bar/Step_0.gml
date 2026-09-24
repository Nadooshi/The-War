/// @desc
visible = false;
switch type_bar {
	case 0: {
		if instance_exists(traced_id) {
			var _prog = traced_id.UI_progress;
			if traced_id.object_index = ob_pl_harvester {
				_prog = traced_id.in_cargo / traced_id.maxval_cargo;
				visible = true;
			} else {
				visible = _prog > 0;
			}
			image_xscale = clamp(4 * _prog, 0.5, 4)
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






