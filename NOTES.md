# Nebula Grid

A 2D top-down twin-stick room crawler with a Death Star / space-station vibe.
Inspired by **Soul Knight** (room-by-room combat, weapons) and **Adventure Time's
Infinite Train** (move car-to-car through connected chambers).

> Open `Nebula Grid.yyp` in GameMaker (IDE 2026.0.0.16) and press **Run**.
> All art is generated placeholder PNGs in the station palette — swap them anytime.

## Controls
- **WASD** — move
- **Mouse** — aim
- **Left click** — fire (hold for auto weapons)
- **Space** — dash (short i-frames, has a cooldown)

## Loop
Each room is a "car". Clear every enemy and the exit door unlocks (red → green);
walk into it to advance. `Room1 ⇄ Room2` for now. Die and the room restarts.

## Architecture
| Resource | Role |
|---|---|
| `obj_game` | Persistent controller. Holds `global.weapons`, `global.score`, computes `room_cleared`, draws the metallic floor (Draw) and HUD (Draw GUI). Self-destructs if a second copy spawns, so it can be placed in every room safely. |
| `obj_player` | WASD movement w/ axis-separated wall sliding, mouse aim, dash, i-frames, weapon firing. |
| `obj_wall` | Solid collision tile. |
| `obj_door` | Child of `obj_wall`. Blocks until `room_cleared`, then drops its mask (`sprite_index = -1`) and becomes a room-transition trigger. |
| `obj_bullet` | Generic projectile. `team` 0 = player, 1 = enemy. Inherited by `obj_enemy_bullet`. |
| `obj_enemy_parent` | Base enemy: HP, contact damage, hit-flash, death/score. Abstract (not placed). |
| `obj_enemy` | Chaser. Calls `event_inherited()` then beelines the player. |
| `obj_enemy_shooter` | Ranged. Strafes to a preferred distance and fires `obj_enemy_bullet`. |
| `obj_pickup` | Grants a random weapon on touch. |
| `scr_helpers` | `nb_make_weapon(...)` builds a weapon struct; `nb_fire_weapon(...)` spawns its pellets. |

## Weapons (`obj_game` Create)
`nb_make_weapon(name, damage, cooldown, pellets, spread, bspeed, auto)`
- **Ion Pistol** (default), **Rapid Blaster** (auto), **Scatter Cannon** (6-pellet spread).

## Extending
- **New weapon:** add an entry to `global.weapons` in `obj_game` Create; grant via a pickup's `weapon_key`.
- **New enemy:** make a child of `obj_enemy_parent`, `event_inherited()` in its Step, add behaviour.
- **New room/car:** duplicate a room, set border + a door, add it to the Room Order. (Door targeting is currently `room == Room1 ? Room2 : Room1` — generalise this when you add a 3rd room.)
- **Real art:** replace the PNGs under `sprites/<name>/`; keep the same dimensions/origins or re-import in the IDE.
