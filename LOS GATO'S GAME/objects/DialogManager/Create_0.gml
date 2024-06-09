/// @desc Initiate the Dialog System

ChatterboxLoadFromFile("Dialog.yarn");
chatterbox = ChatterboxCreate();
ChatterboxJump(chatterbox, global.speaker);
chatterbox_update();

option_index = 0;