event_inherited();
if (hp <= 0 || !instance_exists(obj_player)) exit;

var _p2  = (hp < hp_max * 0.5);          // enrage phase
var _spd = _p2 ? 1.7 : 1.0;
var _d   = point_direction(x, y, obj_player.x, obj_player.y);
if (point_distance(x, y, obj_player.x, obj_player.y) < 220) _d += 180; // keep distance
var _mx = lengthdir_x(_spd, _d);
var _my = lengthdir_y(_spd, _d);
if (!place_meeting(x + _mx, y, obj_wall)) x += _mx;
if (!place_meeting(x, y + _my, obj_wall)) y += _my;

aim += 7;
pat_timer = max(pat_timer - 1, 0);
if (pat_timer == 0) {
    var _w = nb_make_weapon("boss", 1, 0, 1, 0, 5);
    switch (pattern) {
        case 0: // expanding ring
            nb_fire_pattern(x, y, _p2 ? 22 : 14, aim, 360, _w, obj_enemy_bullet, 1);
            pat_timer = 48; break;
        case 1: // aimed shotgun burst
            nb_fire_pattern(x, y, _p2 ? 9 : 5, point_direction(x, y, obj_player.x, obj_player.y), 50, _w, obj_enemy_bullet, 1);
            pat_timer = 22; break;
        case 2: // rotating spiral arms
            nb_fire_pattern(x, y, 3, aim, 360, _w, obj_enemy_bullet, 1);
            pat_timer = _p2 ? 5 : 9; break;
    }
    pat_count += 1;
    var _after = 1;
    if (pattern == 1) _after = 6;
    else if (pattern == 2) _after = _p2 ? 36 : 22;
    if (pat_count >= _after) { pat_count = 0; pattern = (pattern + 1) mod 3; }
}
