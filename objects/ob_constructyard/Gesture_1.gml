/// @desc
if control_player != 0
	exit;

// отмена текущей стройки с возвратом денег
if b_ready = 0 {
	global.money[control_player] += -b_pice * time_build// * (1 - UI_progress);
	alarm_set(0, -1);
	global.pice_money_tic[control_player] = 0;
}
if instance_exists(marker)
	instance_destroy(marker);

b_ready = -1
event_inherited()




