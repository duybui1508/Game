# Game
Testing a new project about a game

## Godot setup notes

- Autoload: add `res://scripts/Game.gd` as a singleton named `Game` in **Project Settings → Autoload**.
- Player: attach `res://scripts/Player.gd` to a `CharacterBody3D` and assign a `PlayerStats` resource in the inspector (or let it auto-create one). Required exports: `stats` (PlayerStats).
- Mob: attach `res://scripts/Mob.gd` to a `CharacterBody3D` and set inspector exports: `mob_type`, `region_key`, and optionally `fixed_level`.
- Optional Site of Grace: attach `res://scripts/SiteOfGrace.gd` to an `Area3D`. It will auto-rest players on enter when `auto_rest_on_enter` is true.

### TODO
- Confirm magma mob types and adjust the `Mob.gd` base stat table if needed.
