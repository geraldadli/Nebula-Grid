if (instance_exists(obj_player)) {
    var _dist = point_distance(x, y, obj_player.x, obj_player.y);
    if (_dist < 90) {
        var _d = point_direction(x, y, obj_player.x, obj_player.y);
        hsp += lengthdir_x(0.7, _d);
        vsp += lengthdir_y(0.7, _d);
    }
    if (place_meeting(x, y, obj_player)) {
        global.casings += 1;
        instance_destroy();
        exit;
    }
}
hsp *= 0.9; vsp *= 0.9;
x += hsp; y += vsp;
