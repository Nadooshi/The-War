function init_target (_parent_obj){
	with _parent_obj.pl_target {
		mp_grid_add_instances(global.grid, id, false);
		master_id = _parent_obj
		var _obj = instance_place(mouse_x, mouse_y, ob_entity);
		if _obj != noone
			tg_id = _obj
	}
	
}
