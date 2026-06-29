/// Shared helpers for Nebula Grid

function nb_make_weapon(_name, _damage, _cooldown, _pellets, _spread, _bspeed, _auto = false, _mag = 999, _reload = 30, _pierce = 0) {
    return {
        name:        _name,
        damage:      _damage,
        cooldown:    _cooldown,    // frames between shots
        pellets:     _pellets,     // bullets per shot
        spread:      _spread,      // +/- degrees of inaccuracy
        bspeed:      _bspeed,      // bullet speed
        auto:        _auto,        // hold-to-fire?
        mag_size:    _mag,         // shots before reload
        reload_time: _reload,      // reload frames
        pierce:      _pierce,      // enemies a bullet passes through
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
        _b.pierce      = _weapon.pierce;
    }
}

/// Fan / ring of bullets. _arc >= 360 makes a full ring.
function nb_fire_pattern(_x, _y, _count, _base, _arc, _weapon, _bullet_object, _team) {
    if (_count <= 0) return;
    var _full  = (_arc >= 360);
    var _step  = _full ? (_arc / _count) : (_count > 1 ? _arc / (_count - 1) : 0);
    var _start = _full ? _base : _base - _arc / 2;
    for (var i = 0; i < _count; i++) {
        var _b = instance_create_layer(_x, _y, "Instances", _bullet_object);
        _b.direction   = _start + _step * i;
        _b.image_angle = _b.direction;
        _b.speed       = _weapon.bspeed;
        _b.damage      = _weapon.damage;
        _b.team        = _team;
        _b.pierce      = _weapon.pierce;
    }
}

/// Request a screen shake of at least _amt pixels.
function nb_shake(_amt) {
    if (instance_exists(obj_game)) obj_game.shake = max(obj_game.shake, _amt);
}
