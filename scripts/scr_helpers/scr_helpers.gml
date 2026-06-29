/// Shared helpers for Nebula Grid

function nb_make_weapon(_name, _damage, _cooldown, _pellets, _spread, _bspeed, _auto) {
    return {
        name:     _name,
        damage:   _damage,
        cooldown: _cooldown,   // frames between shots
        pellets:  _pellets,    // bullets per shot
        spread:   _spread,     // +/- degrees of inaccuracy
        bspeed:   _bspeed,     // bullet speed
        auto:     _auto,       // hold-to-fire?
    };
}

function nb_fire_weapon(_x, _y, _dir, _weapon, _bullet_object, _team) {
    for (var i = 0; i < _weapon.pellets; i++) {
        var _off = (_weapon.spread > 0) ? random_range(-_weapon.spread, _weapon.spread) : 0;
        var _b = instance_create_layer(_x, _y, "Instances", _bullet_object);
        _b.direction   = _dir + _off;
        _b.image_angle = _b.direction;
        _b.speed       = _weapon.bspeed;
        _b.damage      = _weapon.damage;
        _b.team        = _team;
    }
}
