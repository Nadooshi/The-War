/// @desc
if control_player != 0
	exit;

with ob_ui_cursel {
	visible = false	
}

with ob_ui_bar {
	if type_bar = 0 {
		visible = false	
		traced_id = noone
	}
}

ob_ui_healthbar.visible = ob_ui_cursel.visible




