hitflash = max(hitflash - 1, 0);
if (hp <= 0) {
    repeat (irandom_range(2, 4))
        instance_create_layer(x + 16 + random_range(-10, 10), y + 16 + random_range(-10, 10), "Instances", obj_casing);
    nb_shake(3);
    instance_destroy();
}
