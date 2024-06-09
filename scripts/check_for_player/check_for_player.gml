function check_for_player(){
    var _dis = distance_to_object(obj_player1);
    
    // Check if the player is within the field of view
    var _player_direction = point_direction(x, y, obj_player1.x, obj_player1.y);
    
    // Assuming the enemy's sprite is drawn facing upwards and that's the "forward" direction.
    var _forward_direction = 90; // Enemy's forward direction in degrees
    
    var _fov = 240; // Field of View - adjust as needed

    // Check if the player is within the FOV
    if (abs(angle_difference(_forward_direction, _player_direction)) <= _fov / 2) {
        // The player is in front of the enemy

        if ((_dis <= alert_dis || alert) && _dis > attack_dis){
            alert = true;
            if calc_path_timer-- <= 0{
                calc_path_timer = calc_path_delay;

                // can he reach player with the path
                var _found_player = mp_grid_path(global.mp_grid, path, x, y, obj_player1.x, obj_player1.y, choose(0, 1));
                if (_found_player){
                    path_start(path, move_speed, path_action_stop, false);
                }
            }
        } else if (_dis <= attack_dis){
            path_end(); 
        }
    }
}