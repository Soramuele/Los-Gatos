/// @desc Movement & Interaction

if (global.movement) {
	if (keyboard_check(vk_up) or keyboard_check(ord("W"))) {
		y -= walkSpeed;
	}
	if (keyboard_check(vk_down) or keyboard_check(ord("S"))) {
		y += walkSpeed;
	}
	if (keyboard_check(vk_left) or keyboard_check(ord("A"))) {
		x -= walkSpeed;
	}
	if (keyboard_check(vk_right) or keyboard_check(ord("D"))) {
		x += walkSpeed;
	}
}

if (place_meeting(x+5, y, obj_toad) || place_meeting(x-5, y, obj_toad) || place_meeting(x, y+5, obj_toad) || place_meeting(x, y-5, obj_toad)) {
	global.speaker = "Toad";
	global.npc = true;
} else if (place_meeting(x+5, y, obj_robert) || place_meeting(x-5, y, obj_robert) || place_meeting(x, y+5, obj_robert) || place_meeting(x, y-5, obj_robert)) {
	global.speaker = "Robert";
	global.npc = true;
} else if (place_meeting(x+5, y, obj_gustav) || place_meeting(x-5, y, obj_gustav) || place_meeting(x, y+5, obj_gustav) || place_meeting(x, y-5, obj_gustav)) {
	global.speaker = "Gustav";
	global.npc = true;
} else {
	global.speaker = "";
	global.npc = false;
}

if (keyboard_check(ord("E")) && global.npc && global.movement) {
	global.movement = false;
	instance_create_layer(0, 0, "Instances", DialogManager);
}