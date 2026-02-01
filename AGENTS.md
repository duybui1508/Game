# AGENTS.md — Godot 4 project rules (Codex/agents)

## Project
- Engine: Godot 4.x
- Language: GDScript 2.0 only (no C#, no external frameworks)
- Keep implementation minimal and clean.

## Repo structure
- All scripts must live under: `res://scripts/`
- Do not rename or move existing files unless explicitly requested.
- If new folders are needed, create only what is necessary (prefer `res://scripts/` only).

## Autoloads
- The project uses an Autoload singleton named `Game` at `res://scripts/Game.gd`.
- If an agent cannot modify editor settings, document the Autoload setup in README.

## Coding rules
- Use clear names matching the spec: STR/DUR/FLEX, runesToNext, rollRecov, rollCost, etc.
- Follow the formulas exactly as described in the spec.
- Debuffs must be non-stacking and refresh duration (replace/refresh, not accumulate).
- Shared defense reduction formula: `reduction = DEF / (100 + DEF)` and `dmgTaken = incoming * (1 - reduction)`.

## Deliverables
When asked to implement systems:
- Create/modify only the requested files.
- Add a short README section describing:
  - How to add Autoload `Game`
  - How to attach `Player.gd` and `Mob.gd` to scenes
  - Any required inspector fields (exports)

## No over-engineering
- Avoid complex architecture, plugins, or big refactors.
- Prefer direct, testable scripts.
