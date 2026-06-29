var _yo = sin(bob) * 3;
draw_sprite_ext(sprite_index, 0, x, y + _yo, 1, 1, 0, c_white, 1);
draw_set_halign(fa_center);
draw_set_color(make_color_rgb(235, 205, 130));
draw_text(x, y - 20 + _yo, global.weapons[$ weapon_key].name);
draw_set_color(c_white);
draw_set_halign(fa_left);
