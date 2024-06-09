// Inside obj_player1's Step Event

reset_variables();
if (global.movement)
	get_imput(); // Make sure this is the correct function name
calc_movement();
attempt_kill_enemy(); // This will call the script you just created
if (image_index == 5)
	object_set_sprite(obj_player1, spr_player);


// Speak with immates
if (place_meeting(x+5, y, obj_toad) || place_meeting(x-5, y, obj_toad) || place_meeting(x, y+5, obj_toad) || place_meeting(x, y-5, obj_toad)) {
	global.speaker = "Toad";
	npc = true;
} else if (place_meeting(x+5, y, obj_robert) || place_meeting(x-5, y, obj_robert) || place_meeting(x, y+5, obj_robert) || place_meeting(x, y-5, obj_robert)) {
	global.speaker = "Robert";
	npc = true;
} else if (place_meeting(x+5, y, obj_gustav) || place_meeting(x-5, y, obj_gustav) || place_meeting(x, y+5, obj_gustav) || place_meeting(x, y-5, obj_gustav)) {
	global.speaker = "Gustav";
	npc = true;
} else {
	global.speaker = "";
	npc = false;
}

if (keyboard_check(ord("E")) && npc && global.movement) {
	global.movement = false;
	instance_create_layer(0, 0, "Instances", DialogManager);
}