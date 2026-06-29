if (open_done) {
    var _g = make_color_rgb(70, 230, 120);
    draw_set_alpha(0.25);
    draw_rectangle_color(foot_x1, foot_y1, foot_x2 - 1, foot_y2 - 1, _g, _g, _g, _g, false);
    draw_set_alpha(1);
    draw_rectangle_color(foot_x1, foot_y1, foot_x2 - 1, foot_y2 - 1, _g, _g, _g, _g, true);
} else {
    draw_sprite_ext(spr_door, 0, x, y, 1, 1, 0, make_color_rgb(210, 80, 70), 1);
}
