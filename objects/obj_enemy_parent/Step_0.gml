hitflash = max(hitflash - 1, 0);

if (instance_exists(obj_player) && place_meeting(x, y, obj_player)) {
    with (obj_player) if (iframes == 0) { hp -= other.contact_dmg; iframes = 45; }
}

if (hp <= 0) {
    global.score += score_value;
    instance_destroy();
}
