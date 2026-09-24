/// @desc

if instance_exists(traced_id)
if variable_instance_exists(traced_id, "arr_unit"){ // если это юнит, то...
	visible = true
	
	var str_pic = traced_id.arr_unit[traced_id.arr_ind].b_pic + "_smpic"
	if asset_get_index(str_pic) = -1
		str_pic = traced_id.unit[traced_id.arr_ind].b_pic
	if asset_get_index(str_pic) <> -1 {
		sprite_index = asset_get_index(str_pic)
		image_xscale = (128 / sprite_get_width(sprite_index)) * 0.5
		image_yscale = image_xscale
		
	} else {
		show_message("UI image not found")
		visible = false
	}
}





