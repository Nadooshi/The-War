/// @desc

if deploy {
	if (d_t_pic_alfa div 10) mod 2 == 0 {
		image_alpha = 1;
	} else {
		image_alpha = 0.5;
	}
}

// Inherit the parent event
event_inherited();