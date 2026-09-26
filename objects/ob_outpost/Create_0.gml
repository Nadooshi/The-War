/// @desc


// Inherit the parent event
event_inherited();

b_name = "Outpost"
max_health = 1000
cur_health = max_health
marker = noone;

// dedicated camera for the radar (view 1) — otherwise it shares view 0's camera
view_enabled[1] = true;
radar_cam = camera_create_view(0, 0, 3840, 1080);
view_set_camera(1, radar_cam);

alarm_set(0, 5)
