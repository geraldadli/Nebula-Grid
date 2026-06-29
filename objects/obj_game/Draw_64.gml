draw_set_font(-1);
var _gw = display_get_gui_width();
var _gh = display_get_gui_height();

// boss bar
if (instance_exists(obj_boss)) {
    var _b = obj_boss;
    var _bw = _gw * 0.6, _bx = (_gw - _bw) / 2, _by = 24;
    draw_set_color(make_color_rgb(20, 24, 32));
    draw_rectangle(_bx - 2, _by - 2, _bx + _bw + 2, _by + 18, false);
    var _bf = clamp(_b.hp / _b.hp_max, 0, 1);
    draw_set_color(make_color_rgb(200, 55, 48));
    draw_rectangle(_bx, _by, _bx + _bw * _bf, _by + 16, false);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(_gw / 2, _by - 18, "STATION WARDEN");
    draw_set_halign(fa_left);
}

// player panel
var _p = instance_exists(obj_player) ? obj_player : noone;
if (_p != noone) {
    var _w = 240, _x = 20, _y = 20;
    draw_set_color(make_color_rgb(20, 24, 32));
    draw_rectangle(_x, _y, _x + _w, _y + 20, false);
    var _f = clamp(_p.hp / _p.hp_max, 0, 1);
    var _hc = merge_colour(make_color_rgb(210, 60, 50), make_color_rgb(70, 220, 110), _f);
    draw_rectangle_color(_x, _y, _x + _w * _f, _y + 20, _hc, _hc, _hc, _hc, false);
    draw_set_color(make_color_rgb(120, 140, 165));
    draw_rectangle(_x, _y, _x + _w, _y + 20, true);
    draw_set_color(c_white);

    draw_text(_x, _y + 26, _p.weapon.name);
    var _ammo = _p.reloading ? "RELOADING..." : (string(_p.ammo) + " / " + string(_p.weapon.mag_size));
    draw_text(_x, _y + 48, "AMMO: " + _ammo);
    draw_text(_x, _y + 70, "BLANKS: " + string(global.blanks) + "   [Q]");
}

draw_set_color(make_color_rgb(235, 205, 130));
draw_text(20, 116, "CASINGS: " + string(global.casings));
draw_set_color(c_white);
draw_text(20, 138, "SCORE: " + string(global.score));
var _e = instance_number(obj_enemy_parent);
draw_text(20, 160, _e > 0 ? ("HOSTILES: " + string(_e)) : "SECTOR CLEAR - DOOR OPEN");

draw_set_halign(fa_center);
draw_set_color(make_color_rgb(120, 140, 165));
draw_text(_gw / 2, _gh - 26, "WASD move   MOUSE aim/fire   SPACE roll   R reload   Q blank   E open");
draw_set_color(c_white);
draw_set_halign(fa_left);
