/// @desc Print all text messages

if(IsChatterbox(chatterbox) && text != undefined) {
	// Draw the dialog box on screen
	draw_sprite_ext(spr_DialogBox, 0, display_get_gui_width()/2, display_get_gui_height() - 200, 1.2, 1, 0, c_white, 1);

	// Write text on screen
	draw_set_color(c_dkgray);
	var _xx = display_get_gui_width() /2 - 200;
	var _yy = display_get_gui_height() - 300;
	draw_text_ext(_xx, _yy, text, 30, 700);
	
	// Draw portrait on screen
	switch (ChatterboxGetContentSpeaker(chatterbox, 0))
	{
		case "Pierre":
			draw_sprite_ext(portraits, 1, 550, display_get_gui_height() - 200, 0.3, 0.3, 0, c_white, 1);
		break;
	    case "Toad":
	        draw_sprite_ext(portraits, 2, 550, display_get_gui_height() - 200, 0.3, 0.3, 0, c_white, 1);
	    break;
		case "Robert":
			draw_sprite_ext(portraits, 3, 550, display_get_gui_height() - 200, 0.3, 0.3, 0, c_white, 1);
		break;
		case "Gustav":
			draw_sprite_ext(portraits, 4, 550, display_get_gui_height() - 200, 0.3, 0.3, 0, c_white, 1);
		break;
		default:
			draw_sprite_ext(portraits, 0, 550, display_get_gui_height() - 200, 0.3, 0.3, 0, c_white, 1);
	}
	
	//	Multiple answers for the dialogue
	if (ChatterboxGetOptionCount(chatterbox)) {
		for (var i = 0; i < ChatterboxGetOptionCount(chatterbox); i++) {
			if (ChatterboxGetOptionConditionBool(chatterbox, i)) {
				var _icon = "  ";
				
				// Indicator for the selected answer
				if(option_index == i){
					_icon = "> ";
				}
				
				// Write answers
				var _option = ChatterboxGetOption(chatterbox, i);
				draw_text_ext(_xx, _yy + 60 + (i * 20), _icon + _option, 30, 700);
			}
		}
	}
}