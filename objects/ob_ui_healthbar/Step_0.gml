/// @desc
if not instance_exists(traced_id)
	exit;
if traced_id.max_health > 0 { 
	var _cof = traced_id.cur_health / traced_id.max_health;
	image_xscale = clamp(4 * _cof, 0, 4)
}

var _sz = round(image_xscale);

switch _sz {
	case 0:
	case 1:
		image_index = 2;
		break;
	case 2:
		image_index = 1;
		break;
	case 3:
		image_index = 0;
		break;	
	default:
		image_index = 0;	
}
	





