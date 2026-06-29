draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, c_white, 1);
if (hitflash > 0) {
    gpu_set_blendmode(bm_add);
    draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, c_white, 0.6);
    gpu_set_blendmode(bm_normal);
}
