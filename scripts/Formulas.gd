extends Node
class_name Formulas

static func runesToNext(level: int) -> int:
	return 50 + 20 * level * level

static func str_damage_multiplier(str_value: float) -> float:
	var str := max(str_value, 1.0)
	var tier1 := max(min(str, 40.0) - 1.0, 0.0)
	var tier2 := max(min(str, 60.0) - 40.0, 0.0)
	var tier3 := max(str - 60.0, 0.0)
	var bonus := tier1 * 0.03 + tier2 * 0.015 + tier3 * 0.007
	return 1.0 + bonus

static func defense_reduction(def_value: float) -> float:
	return def_value / (100.0 + def_value)

static func damage_after_def(incoming: float, def_value: float) -> float:
	var reduction := defense_reduction(def_value)
	return incoming * (1.0 - reduction)

static func rollRecov(flex: float) -> float:
	return clamp(0.45 - 0.0035 * (flex - 0.1) * 100.0, 0.25, 0.45)

static func rollCost(flex: float) -> float:
	return clamp(20.0 - 6.0 * (flex - 0.1) / 0.9, 14.0, 20.0)

static func stamRegenPerSec(flex: float) -> float:
	return 18.0 + 6.0 * (flex - 0.1) / 0.9

static func moveSpeed(flex: float) -> float:
	return 20.0 * (1.0 + 0.12 * (flex - 0.1) / 0.9)

static func mob_hp(base_hp: float, level: int) -> float:
	return round(base_hp * (1.0 + 0.065 * (level - 1)))

static func mob_dmg(base_dmg: float, level: int) -> float:
	return round(base_dmg * (1.0 + 0.045 * (level - 1)))

static func mob_def(base_def: float, level: int) -> float:
	return base_def + 0.90 * (level - 1)

static func mob_speed(base_speed: float, level: int) -> float:
	return base_speed * (1.0 + 0.010 * (level - 1))
