extends Resource
class_name PlayerStats

@export var level := 1
@export var runes := 0
@export var max_hp := 100.0
@export var max_stamina := 100.0
@export var max_spell := 50.0
@export var STR := 1.0
@export var DUR := 1.0
@export var FLEX := 0.1
@export var unspent_points := 0.0

const MAX_LEVEL := 99

func runesToNext() -> int:
	return Formulas.runesToNext(level)

func can_level_up() -> bool:
	return level < MAX_LEVEL and runes >= runesToNext()

func level_up_once() -> bool:
	if not can_level_up():
		return false
	runes -= runesToNext()
	level += 1
	unspent_points += 1.5
	return true
