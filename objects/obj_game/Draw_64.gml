draw_set_font(-1);
var _p = instance_exists(obj_player) ? obj_player : noone;

if (_p != noone) {
    // health bar
    var _w = 240, _x = 20, _y = 20;
    draw_set_color(make_color_rgb(20, 24, 32));
    draw_rectangle(_x, _y, _x + _w, _y + 20, false);
    var _f = clamp(_p.hp / _p.hp_max, 0, 1);
    var _hc = merge_colour(make_color_rgb(210, 60, 50), make_color_rgb(70, 220, 110), _f);
    draw_rectangle_color(_x, _y, _x + _w * _f, _y + 20, _hc, _hc, _hc, _hc, false);
    draw_set_color(make_color_rgb(120, 140, 165));
    draw_rectangle(_x, _y, _x + _w, _y + 20, true);
    draw_set_color(c_white);
    draw_text(_x, _y + 26, "WEAPON: " + _p.weapon.name);
}

draw_text(20, 72, "SCORE: " + string(global.score));
var _e = instance_number(obj_enemy_parent);
draw_text(20, 96, _e > 0 ? ("ENEMIES: " + string(_e)) : "ROOM CLEAR - DOOR OPEN");

draw_set_halign(fa_center);
draw_set_color(make_color_rgb(120, 140, 165));
draw_text(room_width / 2, room_height - 28,
    "WASD move   -   MOUSE aim / fire   -   SPACE dash");
draw_set_color(c_white);
draw_set_halign(fa_left);
