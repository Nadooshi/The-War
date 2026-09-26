/// @desc
if ob_player_incpector.pow_val < 0 {
	var _f = (current_time div 100) mod sprite_get_number(sp_wnoise);
	draw_sprite_stretched(sp_wnoise, _f, view_get_xport(1), view_get_yport(1), view_get_wport(1), view_get_hport(1));
}
