var _tint = opened ? make_color_rgb(120, 200, 140) : c_white;
draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, _tint, 1);
if (!opened && near) {
    draw_set_halign(fa_center);
    draw_set_color(make_color_rgb(245, 215, 120));
    draw_text(x, y - 28, "[E] OPEN");
    draw_set_color(c_white);
    draw_set_halign(fa_left);
}
