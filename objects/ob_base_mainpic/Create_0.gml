/// @desc
var str_pic = sprite_get_name(global.current_picture)
sprite_index = asset_get_index(str_pic + "_bigpic")
str_pic = -1
var _b_menu = global.current_menu

if array_length(_b_menu) > 0 {
	for (var i = 0; i < array_length(_b_menu); i++) {
		var _ok = false
		for (var k = 0; k < array_length(global.allbuildings); k++) {
			var _nm = global.allbuildings[k]
			if _b_menu[i].depend == _nm or _b_menu[i].depend == "" {
				_ok = true;
				break;
			}
		}

		str_pic = _b_menu[i].b_pic + "_smpic"
		var _x = 160 * i
		with instance_create_layer(32 + _x, 1120, "menu_layer", ob_menucheck) {
			if asset_get_index(str_pic) <> -1 {
				sprite_index = asset_get_index(str_pic)
				image_alpha = max(0.5, _ok)
			} else {
				show_message("Asset not found")	
			}
		}
	}
} else {
	show_message("No menu")
}

if instance_exists(ob_menucheck) {
	instance_activate_object(ob_menuframe)
	ob_menuframe.pos_menu = 0

} else {
	ob_menuframe.pos_menu = 0
	instance_deactivate_object(ob_menuframe)
}


