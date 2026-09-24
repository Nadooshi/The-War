/// @desc

if instance_exists(master_id) {
	with master_id {
		if path_exists(move_path) {
			mp_grid_clear_cell(global.grid, x / 32, y / 32);
			path_end();
			path_delete(move_path);
		}
	}
}







