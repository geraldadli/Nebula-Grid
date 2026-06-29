hitflash = max(hitflash - 1, 0);

if (instance_exists(obj_player) && place_meeting(x, y, obj_player)) {
    with (obj_player) if (iframes == 0) { hp -= other.contact_dmg; iframes = 45; nb_shake(8); }
}

if (hp <= 0) {
    global.score += score_value;
    repeat (casing_drop)
        instance_create_layer(x + random_range(-8, 8), y + random_range(-8, 8), "Instances", obj_casing);
    nb_shake(3);
    instance_destroy();
}
