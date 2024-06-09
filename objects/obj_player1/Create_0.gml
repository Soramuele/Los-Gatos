// Inside obj_player1's Step Event

walk_speed = 4;

//Samuele Stuff
npc = false;
global.movement = true;
//global.freeInteract = false;
global.speaker = "";

if (!audio_is_playing(snd_ambient)) {
	audio_play_sound(snd_ambient, 1, false);
}