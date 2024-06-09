// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function reset_variables(){
 left = 0;
 right = 0;
 up = 0 ;
 down = 0;
}

function get_imput() {
	if keyboard_check(ord("A"))
		left = 1;
	if keyboard_check(ord("D"))
		right = 1;
	if keyboard_check(ord("W"))
		up = 1;
	if keyboard_check(ord("S"))
		down = 1;
}

function calc_movement(){
	var _hmove = right - left;
	var _vmove = down - up ;
	
	// footsteps sound
		if (!audio_is_playing(snd_footsteps) && (_hmove != 0 || _vmove != 0) && global.movement)
			audio_play_sound(snd_footsteps, 10, false, 0.2, 0, 2);
		else if (_hmove == 0 && _vmove == 0 && !global.movement)
			audio_stop_sound(snd_footsteps);

	if _hmove !=0 or _vmove !=0 {
		var _dir = point_direction(0, 0, _hmove, _vmove)
		// get the distance we are moving
		_hmove = lengthdir_x(walk_speed, _dir);
		_vmove = lengthdir_y(walk_speed, _dir);
		x += _hmove;
		y += _vmove;
	}
}

function collision() {
 var _tx = x;
 var _ty = y;
 
 x = xprevious;
 y = yprevious;
 
 var _disx = abs( _tx - x);
 var _disy = abs( _ty - y);
 
 repeat(_disx){
  if !place_meeting(x + sign( _tx -x), y,  obj_wall) x += sign(_tx - x);
 }
 repeat(_disy){
  if !place_meeting(x,y + sign( _ty -y),  obj_wall) y += sign(_ty - y);
 }
}