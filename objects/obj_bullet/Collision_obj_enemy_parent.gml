if (team == 0) {
    other.hp -= damage;
    other.hitflash = 6;
    nb_shake(2);
    if (pierce > 0) pierce -= 1; else instance_destroy();
}
