extends Node
class_name Game

const DAY_NIGHT_SECONDS := 15.0 * 60.0

@export var full_moon_chance := 0.1

var is_night := false
var is_full_moon := false
var _cycle_timer := 0.0

const REGION_LEVEL_CAPS := {
	"grassland": Vector2i(15, 20),
	"ruins": Vector2i(26, 44),
	"magma": Vector2i(45, 55),
}

signal time_period_changed(is_night: bool, is_full_moon: bool)

func _ready() -> void:
	randomize()

func _process(delta: float) -> void:
	_cycle_timer += delta
	if _cycle_timer >= DAY_NIGHT_SECONDS:
		_cycle_timer -= DAY_NIGHT_SECONDS
		_toggle_day_night()

func _toggle_day_night() -> void:
	is_night = not is_night
	if is_night:
		is_full_moon = randf() < full_moon_chance
	else:
		is_full_moon = false
	time_period_changed.emit(is_night, is_full_moon)

func mob_stat_multiplier() -> float:
	return 1.5 if is_full_moon else 1.0

func mob_speed_multiplier() -> float:
	return 1.2 if is_full_moon else 1.0

func roll_mob_level(region_key: String, fixed_level: int = 0) -> int:
	if fixed_level > 0:
		return fixed_level
	var caps := REGION_LEVEL_CAPS.get(region_key, Vector2i(1, 1))
	return randi_range(caps.x, caps.y)
