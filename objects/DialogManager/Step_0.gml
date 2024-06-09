/// @desc Dialog System

var _count = ChatterboxGetOptionCount(chatterbox);

// Check for dialog system and continue
if(ChatterboxIsWaiting(chatterbox) && keyboard_check_pressed(vk_space)) {
	ChatterboxContinue(chatterbox);
	chatterbox_update();
} else if (_count) {
	var _key = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
	
	repeat (1 + (ChatterboxGetOptionConditionBool(chatterbox, wrap(option_index + _key, 0, _count - 1)) == false)) {
		option_index = wrap(option_index + _key, 0, _count - 1);
	}
	
	// Continue to next message
	if(keyboard_check_pressed(vk_space)) {
		ChatterboxSelect(chatterbox, option_index);
		option_index = 0;
		
		chatterbox_update();
	}
}

// Clear the screen and reset variables
if (ChatterboxIsStopped(chatterbox) || keyboard_check_pressed(vk_escape)) {
	instance_destroy();
	global.movement = true;
}