event_inherited();
if (hp <= 0 || !instance_exists(obj_player)) exit;

var _dir = point_direction(x, y, obj_player.x, obj_player.y);
var _mx = lengthdir_x(move_speed, _dir);
var _my = lengthdir_y(move_speed, _dir);
if (!place_meeting(x + _mx, y, obj_wall)) x += _mx;
if (!place_meeting(x, y + _my, obj_wall)) y += _my;
