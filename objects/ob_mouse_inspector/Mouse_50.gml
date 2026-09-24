/// @desc

var _obj = instance_position(mouse_x, mouse_y, ob_entity)

if _obj = noone
if instance_exists(ob_selected) {
	ob_entity.selected = false;
	ob_ui.traced_id = noone;
	instance_destroy(ob_selected.id);
	with ob_ui_healthbar {
		visible = false;
	}
}