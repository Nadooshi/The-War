function base_menu_to_obj(_base_menu_enum){
	switch _base_menu_enum {
		case base_menu.aircraft: 
			return ob_aircraft			
		case base_menu.any: 
			return ob_base;			
		case base_menu.barrack: 
			return ob_barrack;
		case base_menu.starport: 
			return ob_spaceport;
//		case base_menu.vehicle: 
//			return ;
	}
}