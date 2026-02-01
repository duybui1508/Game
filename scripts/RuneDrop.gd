extends Node
class_name RuneDrop

static func roll_normal(player_level: int) -> int:
	var r := float(Formulas.runesToNext(player_level))
	return int(round(randf_range(0.03, 0.08) * r))

static func roll_elite(player_level: int) -> int:
	var normal := roll_normal(player_level)
	return int(round(normal * randf_range(3.0, 6.0)))

static func roll_boss(player_level: int) -> int:
	var r := float(Formulas.runesToNext(player_level))
	return int(round(randf_range(1.0, 3.0) * r))
