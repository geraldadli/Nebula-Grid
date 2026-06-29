room_cleared = (instance_number(obj_enemy_parent) == 0);

if (room_cleared && !chest_spawned) {
    chest_spawned = true;
    instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_chest);
}
