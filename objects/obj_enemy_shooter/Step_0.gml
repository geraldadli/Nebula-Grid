event_inherited();
if (hp <= 0 || !instance_exists(obj_player)) exit;

var _dist = point_distance(x, y, obj_player.x, obj_player.y);
var _dir  = point_direction(x, y, obj_player.x, obj_player.y);

var _move = _dir;
if (_dist < preferred_dist - 20)       _move = _dir + 180;
else if (_dist <= preferred_dist + 20)  _move = _dir + 90;

var _mx = lengthdir_x(move_speed, _move);
var _my = lengthdir_y(move_speed, _move);
if (!place_meeting(x + _mx, y, obj_wall)) x += _mx;
if (!place_meeting(x, y + _my, obj_wall)) y += _my;

shoot_cd = max(shoot_cd - 1, 0);
if (shoot_cd == 0 && _dist < 470) {
    var _w = nb_make_weapon("enemy", 1, 0, 1, 0, 6);
    nb_fire_pattern(x, y, 3, _dir, 24, _w, obj_enemy_bullet, 1);
    shoot_cd = 64;
}
