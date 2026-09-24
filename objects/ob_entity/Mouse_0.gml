/// @desc

var _id = id;

if selected = false {
	ob_ui.traced_id = id;
	selected = true;
	if instance_exists(ob_selected)
		with ob_selected
			instance_destroy();
	with instance_create_layer(x, y, "markers_layer", ob_selected){
		ob_id = _id;
		image_xscale = 1;
		image_yscale = 1;
	}
}

