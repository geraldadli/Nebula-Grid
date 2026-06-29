# Nebula Grid

A 2D top-down twin-stick **room crawler** with a Death Star / space-station vibe.
You fight through connected chambers ("cars"), clearing each of enemies to unlock
the door to the next.

Inspired by **Soul Knight** (room-by-room combat, swappable weapons) and
**Adventure Time's Infinite Train** (moving car-to-car through themed rooms).

Built with **GameMaker LTS 2026** (IDE `2026.0.0.16`, runtime `2026.0.0.23`).

---

## Run it

1. Open `Nebula Grid.yyp` in GameMaker.
2. Press **Run** (▶) or `F5`.

The game starts in `Room1`. All art is generated placeholder sprites in the
station palette (dark panel grays, white panel lights, red/green accents) — drop
real art in over them whenever you like.

## Controls

| Input | Action |
|---|---|
| **WASD** | Move |
| **Mouse** | Aim |
| **Left click** | Fire (hold for automatic weapons) |
| **Space** | Dash (brief invulnerability, has a cooldown) |

## Gameplay loop

Each room is a sealed "car". Clear every enemy and the exit door switches from
**red (locked)** to **green (open)** — walk into it to advance. `Room1` and
`Room2` currently link to each other. If your health hits zero, the room restarts.

The HUD shows your health bar, current weapon, score, and the enemies remaining.

---

## Project structure

| Resource | Role |
|---|---|
| `obj_game` | Persistent controller. Owns `global.weapons` and `global.score`, computes `room_cleared`, draws the metallic floor (Draw) and the HUD (Draw GUI). Self-destructs if a duplicate spawns, so it can safely be placed in every room. |
| `obj_player` | WASD movement with axis-separated wall sliding, mouse aim, dash + i-frames, weapon firing. |
| `obj_wall` | Solid collision tile. |
| `obj_door` | Child of `obj_wall`. Stays solid until `room_cleared`, then drops its collision mask and becomes a room-transition trigger. |
| `obj_bullet` | Generic projectile. `team` 0 = player, 1 = enemy. |
| `obj_enemy_bullet` | Enemy projectile (child of `obj_bullet`, inherits its behaviour). |
| `obj_enemy_parent` | Abstract base enemy: HP, contact damage, hit-flash, death/score. Not placed directly. |
| `obj_enemy` | Chaser — beelines toward the player. |
| `obj_enemy_shooter` | Ranged — strafes to a preferred distance and fires. |
| `obj_pickup` | Grants a random weapon on touch. |
| `scr_helpers` | `nb_make_weapon(...)` builds a weapon struct; `nb_fire_weapon(...)` spawns its pellets. |

### Weapons

Defined in `obj_game`'s Create event via
`nb_make_weapon(name, damage, cooldown, pellets, spread, bspeed, auto)`:

- **Ion Pistol** — default, single accurate shot
- **Rapid Blaster** — fast automatic fire
- **Scatter Cannon** — 6-pellet spread

---

## Extending

- **New weapon** — add an entry to `global.weapons` in `obj_game` Create, then grant
  it via a pickup's `weapon_key`.
- **New enemy** — make a child of `obj_enemy_parent`, call `event_inherited()` in its
  Step, and add behaviour.
- **New room / car** — duplicate a room, give it a border and a door, and add it to
  the Room Order. Door targeting is currently hardcoded as
  `room == Room1 ? Room2 : Room1` — generalise this when you add a third room.
- **Real art** — replace the PNGs under `sprites/<name>/`, keeping the same
  dimensions and origins (or re-import in the IDE).

## Notes

- Resource `.yy` files use GameMaker's trailing-comma JSON and must carry the exact
  schema-version tags this IDE expects, or it will refuse to open the project. When
  hand-authoring resources, copy the format from an existing one rather than guessing.
