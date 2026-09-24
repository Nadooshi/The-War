function find_free_cell(_cx, _cy){
	// nearest grid cell (cell coords) not occupied by a building
	if instance_position(_cx * 32 + 16, _cy * 32 + 16, ob_base) = noone
		return [_cx, _cy];

	for (var r = 1; r < 16; r++) {
		for (var dx = -r; dx <= r; dx++)
		for (var dy = -r; dy <= r; dy++) {
			if max(abs(dx), abs(dy)) != r
				continue;
			var _nx = _cx + dx;
			var _ny = _cy + dy;
			if _nx < 0 or _ny < 0 or _nx >= (room_width div 32) or _ny >= (room_height div 32)
				continue;
			if instance_position(_nx * 32 + 16, _ny * 32 + 16, ob_base) = noone
				return [_nx, _ny];
		}
	}
	return [_cx, _cy];
}
