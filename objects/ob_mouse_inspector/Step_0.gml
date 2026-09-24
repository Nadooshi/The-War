/// @desc
camera_set_view_pos(view_camera[0], min(camera_get_view_x(view_camera[0]), 2880), min(camera_get_view_y(view_camera[0]), 540));

UI_obj = layer_get_all_elements("UI_layer")
for (var i = 0; i < array_length(UI_obj); i++) {
	if (layer_get_element_type(UI_obj[i]) == layerelementtype_instance) {
		var l_obj = UI_obj[i];
		var _obj = layer_instance_get_instance(l_obj);
		_obj.x = _obj.Ox + camera_get_view_x(view_camera[0])
		_obj.y = _obj.Oy + camera_get_view_y(view_camera[0])
		
	}
}

