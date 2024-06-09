// Define the attempt_kill_enemy function
function attempt_kill_enemy() {
    var KILL_DISTANCE = 50; // Distance within which the player can kill the enemy
    var KILL_ANGLE = 90; // The angle within which the player must be behind the enemy to kill it

    // Check for nearby enemies
    var nearest_enemy = instance_nearest(x, y, obj_enemy);

    if (instance_exists(nearest_enemy)) {
        var dis_to_enemy = point_distance(x, y, nearest_enemy.x, nearest_enemy.y);

        if (dis_to_enemy <= KILL_DISTANCE) {
            var player_dir = point_direction(x, y, nearest_enemy.x, nearest_enemy.y);

            // Calculate the direction to the back of the enemy
            // Assuming the back of the enemy is at the lower part of the sprite (downwards)
            var enemy_back_dir = point_direction(nearest_enemy.x, nearest_enemy.y,
                                                 nearest_enemy.x + (93 - 97), nearest_enemy.y + (224 - 48));

            var angle_diff = abs(angle_difference(player_dir, enemy_back_dir));

            // Check if the player is within the kill angle behind the enemy
            if ((angle_diff > (180 - KILL_ANGLE / 2)) && (angle_diff < (180 + KILL_ANGLE / 2))) {
                if (keyboard_check_pressed(ord("F"))) {
                    // If all conditions are met, "kill" the enemy
                    with (nearest_enemy) {
                        visible = false;
                        instance_deactivate_object(id);
                    }
                }
            }
        }
    }
}