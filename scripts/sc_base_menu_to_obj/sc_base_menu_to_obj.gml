function base_menu_to_obj(_base_menu_enum){
	switch _base_menu_enum {
		case base_menu.aircraft: 
			return ob_aircraft			
		break;
		case base_menu.any: 
			return ob_base;			
		break;
		case base_menu.barrack: 
			return ob_barrack;
		break;
		case base_menu.starport: 
			return ob_spaceport;
		break;
//		case base_menu.vehicle: 
//			return ;
//		break;
	}
}