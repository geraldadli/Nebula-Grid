var _a = (iframes > 0 && (iframes div 3) mod 2 == 0) ? 0.35 : 1;
// gun barrel toward the cursor
var _gx = x + lengthdir_x(22, facing);
var _gy = y + lengthdir_y(22, facing);
draw_line_width_color(x, y, _gx, _gy, 5, make_color_rgb(90, 215, 255), make_color_rgb(200, 245, 255));
draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, c_white, _a);
