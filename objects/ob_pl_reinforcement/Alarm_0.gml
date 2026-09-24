/// @desc switch think

switch cur_think {
	case think.idle : {
		if in_cargo != noone
		if pl_target = noone {
			cur_think = think.unload;
		} else {
			cur_think = think.move;
		}
	break;
	}
}



