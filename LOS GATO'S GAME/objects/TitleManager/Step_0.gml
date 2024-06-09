/// @desc Menu

if ((keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) && check == 0) {
	check = 1;
} else if ((keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) && check == 1) {
	check = 0;
}
if ((keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) && check == 0) {
	check = 1;
} else if ((keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) && check == 1) {
	check = 0;
}

if (keyboard_check_pressed(vk_enter)) {
	if (check = 0)
		room_goto_next();
	else
		game_end();
}