# Nebula Grid

A 2D top-down twin-stick **room crawler** with a Death Star / space-station vibe.
You fight through connected chambers ("cars"), clearing each of enemies to unlock
the door to the next.

Inspired by **Soul Knight** (room-by-room combat, swappable weapons),
**Adventure Time's Infinite Train** (moving car-to-car through themed rooms), and
**Enter the Gungeon** (ammo + reloading, blanks, dodge rolls, currency, reward
chests, and bullet-hell bosses).

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
| **Space** | Dodge roll (brief invulnerability, has a cooldown) |
| **R** | Reload |
| **Q** | Blank — wipes all enemy bullets on screen (limited uses) |
| **E** | Open a reward chest |

## Gameplay loop

Each room is a sealed "car". Clear every hostile and the exit door switches from
**red (locked)** to **green (open)**; a **reward chest** also drops in the centre —
press **E** to claim a new weapon and some casings. Walk into the door to advance.
`Room1` is a combat sector; `Room2` is a **boss arena** (the Station Warden, a
bullet-hell boss with a ring/burst/spiral pattern cycle and an enrage phase at half
health). If your health hits zero, the room restarts.

The camera follows the player with smooth scrolling and screen-shake on impacts.
The HUD shows health, current weapon + ammo (with reload state), blanks, casings
(currency), score, and hostiles remaining (plus the boss health bar when present).

**Casings** are dropped by enemies and smashed crates and are auto-collected — the
in-game currency, ready to hook up to a shop later. **Crates** are destructible cover.

---

## Project structure

| Resource | Role |
|---|---|
| `obj_game` | Persistent controller. Owns `global.weapons` and `global.score`, computes `room_cleared`, draws the metallic floor (Draw) and the HUD (Draw GUI). Self-destructs if a duplicate spawns, so it can safely be placed in every room. |
| `obj_player` | WASD movement with axis-separated wall sliding, mouse aim, dash + i-frames, weapon firing. |
| `obj_wall` | Solid collision tile. |
| `obj_crate` | Destructible cover (child of `obj_wall`). Takes bullet damage, drops casings when broken. |
| `obj_door` | Child of `obj_wall`. Stays solid until `room_cleared`, then drops its collision mask and becomes a room-transition trigger. |
| `obj_bullet` | Generic projectile. `team` 0 = player, 1 = enemy; supports `pierce`. |
| `obj_enemy_bullet` | Enemy projectile (child of `obj_bullet`, inherits its behaviour). |
| `obj_enemy_parent` | Abstract base enemy: HP, contact damage, hit-flash, casing drops, death/score. Not placed directly. |
| `obj_enemy` | Chaser — beelines toward the player. |
| `obj_enemy_shooter` | Ranged — strafes to a preferred distance and fires a spread. |
| `obj_boss` | Bullet-hell boss (child of `obj_enemy_parent`) with a pattern cycle and enrage phase. |
| `obj_casing` | Currency drop; magnetises to the player and is auto-collected. |
| `obj_chest` | Spawns on room clear; press **E** nearby to claim a weapon + casings. |
| `obj_pickup` | Floor weapon pickup (alternative to chests). |
| `scr_helpers` | `nb_make_weapon(...)` builds a weapon struct; `nb_fire_weapon(...)` fires it; `nb_fire_pattern(...)` fires fans/rings; `nb_shake(...)` requests screen shake. |

### Weapons

Defined in `obj_game`'s Create event via
`nb_make_weapon(name, damage, cooldown, pellets, spread, bspeed, auto, mag_size, reload_time, pierce)`:

- **Ion Pistol** — default, accurate single shot
- **Rapid Blaster** — fast automatic fire
- **Scatter Cannon** — 6-pellet spread
- **Vulcan Minigun** — very fast, large magazine
- **Rail Lance** — high damage, pierces 3 enemies

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
