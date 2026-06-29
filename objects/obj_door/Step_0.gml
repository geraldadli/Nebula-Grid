var _cleared = false;
if (instance_exists(obj_game)) _cleared = obj_game.room_cleared;

if (_cleared && !open_done) {
    open_done = true;
    sprite_index = -1; // drop collision so the player can walk through
}

if (open_done && instance_exists(obj_player)) {
    if (point_in_rectangle(obj_player.x, obj_player.y, foot_x1, foot_y1, foot_x2, foot_y2)) {
        room_goto(room == Room1 ? Room2 : Room1);
    }
}
