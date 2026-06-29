// End Step: smooth follow camera + screen shake
if (view_camera[0] == -1 || !instance_exists(obj_player)) exit;

var _cam = view_camera[0];
var _vw = camera_get_view_width(_cam);
var _vh = camera_get_view_height(_cam);

var _tx = clamp(obj_player.x - _vw / 2, 0, room_width - _vw);
var _ty = clamp(obj_player.y - _vh / 2, 0, room_height - _vh);

var _nx = lerp(camera_get_view_x(_cam), _tx, 0.15);
var _ny = lerp(camera_get_view_y(_cam), _ty, 0.15);

shake = max(shake - 1, 0);
var _sx = (shake > 0) ? random_range(-shake, shake) : 0;
var _sy = (shake > 0) ? random_range(-shake, shake) : 0;

camera_set_view_pos(_cam,
    clamp(_nx + _sx, 0, room_width - _vw),
    clamp(_ny + _sy, 0, room_height - _vh));
