if (instance_number(obj_game) > 1) { instance_destroy(); exit; }

randomize();
depth = 10000;
room_cleared = false;
chest_spawned = false;
shake = 0;

global.score   = 0;
global.casings = 0;
global.blanks  = 2;

global.weapons = {
    pistol:  nb_make_weapon("Ion Pistol",     2, 16, 1,  2, 12, false, 12, 50, 0),
    blaster: nb_make_weapon("Rapid Blaster",  1,  6, 1,  7, 15, true,  30, 60, 0),
    shotgun: nb_make_weapon("Scatter Cannon", 1, 34, 6, 26, 11, false, 6,  70, 0),
    minigun: nb_make_weapon("Vulcan Minigun", 1,  3, 1, 10, 16, true,  80, 90, 0),
    railgun: nb_make_weapon("Rail Lance",     6, 40, 1,  0, 22, false, 4,  80, 3),
};
