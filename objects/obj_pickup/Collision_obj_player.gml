with (obj_player) {
    weapon = variable_clone(global.weapons[$ other.weapon_key]);
    ammo = weapon.mag_size;
    reloading = false;
    fire_cd = 0;
}
instance_destroy();
