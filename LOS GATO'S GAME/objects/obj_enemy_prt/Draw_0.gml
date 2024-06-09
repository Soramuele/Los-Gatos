// In the Draw Event of the enemy object

// Draw the enemy as usual
draw_self();

// Simplified FOV visualization
var _fov = 60; // Field of View in degrees
var _fov_distance = 100; // Distance of FOV lines from the enemy
var _enemy_direction = direction; // Assuming 'direction' is the enemy's current facing direction

// Calculate the angles for the edges of the FOV
var _left_angle = _enemy_direction - _fov / 2;
var _right_angle = _enemy_direction + _fov / 2;

// Calculate the end points of the FOV lines
var _left_x = x + lengthdir_x(_fov_distance, _left_angle);
var _left_y = y + lengthdir_y(_fov_distance, _left_angle);
var _right_x = x + lengthdir_x(_fov_distance, _right_angle);
var _right_y = y + lengthdir_y(_fov_distance, _right_angle);

// Draw lines representing the edges of the FOV
draw_line(x, y, _left_x, _left_y);
draw_line(x, y, _right_x, _right_y);






