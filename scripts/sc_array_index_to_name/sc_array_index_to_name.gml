function array_find_ind_to_name (_array, srt_name) {
	var _s = array_length(_array)
	for (var i = 0; i < _s; i++) {
		if _array[i].name = srt_name {
			return i;
		}
	}
}
