// Room Start: reset per-room state and snap the camera to the player.
room_cleared  = false;
chest_spawned = false;
shake = 0;
if (view_camera[0] != -1 && instance_exists(obj_player)) {
    var _vw = camera_get_view_width(view_camera[0]);
    var _vh = camera_get_view_height(view_camera[0]);
    var _cx = clamp(obj_player.x - _vw / 2, 0, room_width - _vw);
    var _cy = clamp(obj_player.y - _vh / 2, 0, room_height - _vh);
    camera_set_view_pos(view_camera[0], _cx, _cy);
}
