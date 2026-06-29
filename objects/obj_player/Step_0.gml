// ---- movement (WASD) ----
var _hx = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _vy = keyboard_check(ord("S")) - keyboard_check(ord("W"));
var _len = point_distance(0, 0, _hx, _vy);
if (_len > 0) { _hx /= _len; _vy /= _len; }

var _spd = move_speed;
dash_cd = max(dash_cd - 1, 0);
if (keyboard_check_pressed(vk_space) && dash_cd == 0 && _len > 0) {
    _spd = move_speed * 4;
    dash_cd = 40;
    iframes = max(iframes, 12);
}

var _mx = _hx * _spd;
var _my = _vy * _spd;
if (place_meeting(x + _mx, y, obj_wall)) {
    while (_mx != 0 && !place_meeting(x + sign(_mx), y, obj_wall)) x += sign(_mx);
    _mx = 0;
}
x += _mx;
if (place_meeting(x, y + _my, obj_wall)) {
    while (_my != 0 && !place_meeting(x, y + sign(_my), obj_wall)) y += sign(_my);
    _my = 0;
}
y += _my;

// ---- aim & fire (mouse) ----
facing = point_direction(x, y, mouse_x, mouse_y);
fire_cd = max(fire_cd - 1, 0);
var _shoot = weapon.auto ? mouse_check_button(mb_left) : mouse_check_button_pressed(mb_left);
if (_shoot && fire_cd == 0) {
    var _bx = x + lengthdir_x(18, facing);
    var _by = y + lengthdir_y(18, facing);
    nb_fire_weapon(_bx, _by, facing, weapon, obj_bullet, 0);
    fire_cd = weapon.cooldown;
}

iframes = max(iframes - 1, 0);

if (hp <= 0) {
    global.score = 0;
    room_restart();
}
