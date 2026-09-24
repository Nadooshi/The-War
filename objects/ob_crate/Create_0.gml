/// @desc
enum type_crate {
	resouses_money,
	crate_money
}

coll_able = true;

switch cr_type {
	case type_crate.resouses_money : {
		res_value = irandom_range(valmin_res, valmax_res);
		sprite_index = sp_oilpool;
		image_index = choose(0, 1, 2, 3, 4, 5);
	break;
	}
	case type_crate.crate_money : {
		res_value = 350;
		sprite_index = sp_crate;
		image_index = 0;
	break;
	}
}




