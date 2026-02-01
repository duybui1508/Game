extends CharacterBody3D
class_name Player

@export var stats: PlayerStats

var hp := 0.0
var stamina := 0.0
var spell := 0.0

var _roll_timer := 0.0

func _ready() -> void:
	if stats == null:
		stats = PlayerStats.new()
	hp = stats.max_hp
	stamina = stats.max_stamina
	spell = stats.max_spell

func _process(delta: float) -> void:
	_regen_stamina(delta)
	if _roll_timer > 0.0:
		_roll_timer = max(_roll_timer - delta, 0.0)

func _regen_stamina(delta: float) -> void:
	var regen := Formulas.stamRegenPerSec(stats.FLEX)
	stamina = min(stats.max_stamina, stamina + regen * delta)

func try_roll() -> bool:
	var cost := Formulas.rollCost(stats.FLEX)
	if _roll_timer > 0.0 or stamina < cost:
		return false
	stamina -= cost
	_roll_timer = Formulas.rollRecov(stats.FLEX)
	return true

func deal_damage(base_damage: float) -> float:
	return base_damage * Formulas.str_damage_multiplier(stats.STR)

func apply_damage(incoming: float) -> float:
	var def_value := 15.0 + 2.0 * (stats.DUR - 1.0)
	var taken := Formulas.damage_after_def(incoming, def_value)
	hp = max(hp - taken, 0.0)
	return taken

func add_runes(amount: int) -> void:
	stats.runes += amount

func level_up_all() -> void:
	while stats.level_up_once():
		pass
