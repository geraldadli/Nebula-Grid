// metallic Death Star floor
var _gs = 64;
for (var _xx = 0; _xx < room_width; _xx += _gs) {
    for (var _yy = 0; _yy < room_height; _yy += _gs) {
        var _alt = ((_xx div _gs) + (_yy div _gs)) & 1;
        var _c = _alt ? make_color_rgb(28, 33, 43) : make_color_rgb(22, 26, 34);
        draw_rectangle_color(_xx, _yy, _xx + _gs, _yy + _gs, _c, _c, _c, _c, false);
    }
}
draw_set_alpha(0.4);
draw_set_color(make_color_rgb(48, 56, 70));
for (var _xx = 0; _xx <= room_width;  _xx += _gs) draw_line(_xx, 0, _xx, room_height);
for (var _yy = 0; _yy <= room_height; _yy += _gs) draw_line(0, _yy, room_width, _yy);
draw_set_alpha(1);
draw_set_color(c_white);
