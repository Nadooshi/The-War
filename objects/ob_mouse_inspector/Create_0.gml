/// @desc Global vars
global.grid = mp_grid_create(0, 0, room_width div 32, room_height div 32, 32, 32); //сетка для движения
global.current_construct = noone;
global.allbuildings = []
global.select_item = -1;

// economy per player (index = control_player: 0 = human, 1+ = AI)
global.max_players = 8;
global.money = array_create(global.max_players, 0);
global.capasity_money = array_create(global.max_players, 0);
global.capacity_power = array_create(global.max_players, 0);
global.pow_val = array_create(global.max_players, 0);
global.pice_money_tic = array_create(global.max_players, 0);

// simple var
UI_obj = []


