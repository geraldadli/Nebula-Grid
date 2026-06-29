if (team == 1) {
    with (obj_player) {
        if (iframes == 0) { hp -= other.damage; iframes = 45; }
    }
    instance_destroy();
}
