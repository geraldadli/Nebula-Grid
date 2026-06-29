with (obj_player) {
    weapon = variable_clone(global.weapons[$ other.weapon_key]);
    fire_cd = 0;
}
instance_destroy();
