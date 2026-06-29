near = (instance_exists(obj_player) && distance_to_object(obj_player) < 40);
if (!opened && near && keyboard_check_pressed(ord("E"))) {
    opened = true;
    var _loot = ["blaster", "shotgun", "minigun", "railgun"];
    loot_key = _loot[irandom(array_length(_loot) - 1)];
    with (obj_player) {
        weapon = variable_clone(global.weapons[$ other.loot_key]);
        ammo = weapon.mag_size;
        reloading = false;
        fire_cd = 0;
    }
    global.casings += irandom_range(8, 15);
    nb_shake(8);
}
