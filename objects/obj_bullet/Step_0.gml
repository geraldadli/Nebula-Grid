var _w = instance_place(x, y, obj_wall);
if (_w != noone) {
    if (team == 0 && _w.object_index == obj_crate) {
        _w.hp -= damage;
        _w.hitflash = 4;
    }
    instance_destroy();
}
