extends Resource
class_name Debuff

@export var duration := 0.0
var remaining := 0.0

func _init(new_duration := 0.0) -> void:
	duration = new_duration
	remaining = new_duration

func refresh(new_duration: float) -> void:
	duration = new_duration
	remaining = new_duration

func tick(delta: float) -> bool:
	remaining = max(remaining - delta, 0.0)
	return remaining <= 0.0

class PoisonDebuff:
	extends Debuff
	@export var dps := 0.0

	func _init(new_dps := 0.0, new_duration := 0.0) -> void:
		dps = new_dps
		refresh(new_duration)

	func refresh_from(other: PoisonDebuff) -> void:
		dps = other.dps
		refresh(other.duration)

class BurnDebuff:
	extends Debuff
	@export var dps := 0.0

	func _init(new_dps := 0.0, new_duration := 0.0) -> void:
		dps = new_dps
		refresh(new_duration)

	func refresh_from(other: BurnDebuff) -> void:
		dps = other.dps
		refresh(other.duration)

class SlowDebuff:
	extends Debuff
	@export var pct := 0.0

	func _init(new_pct := 0.0, new_duration := 0.0) -> void:
		pct = new_pct
		refresh(new_duration)

	func refresh_from(other: SlowDebuff) -> void:
		pct = other.pct
		refresh(other.duration)
