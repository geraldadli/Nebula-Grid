// single persistent controller
if (instance_number(obj_game) > 1) { instance_destroy(); exit; }

randomize();
depth = 10000;          // draw the floor behind everything
room_cleared = false;

global.score = 0;
global.weapons = {
    pistol:  nb_make_weapon("Ion Pistol",      2, 16, 1,  2, 12, false),
    blaster: nb_make_weapon("Rapid Blaster",   1,  6, 1,  7, 15, true),
    shotgun: nb_make_weapon("Scatter Cannon",  1, 34, 6, 26, 11, false),
};
