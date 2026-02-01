extends CharacterBody3D
class_name Mob

@export var mob_type := "goblin"
@export var region_key := "grassland"
@export var fixed_level := 0
@export var attack_cooldown := 1.5

var level := 1
var max_hp := 0.0
var hp := 0.0
var damage := 0.0
var def_value := 0.0
var move_speed := 0.0

var _attack_timer := 0.0

const BASE_STATS := {
	"goblin": {"hp": 60.0, "dmg": 8.0, "def": 5.0, "speed": 18.0},
	"zombie": {"hp": 90.0, "dmg": 10.0, "def": 8.0, "speed": 12.0},
	"skeleton_archer": {"hp": 70.0, "dmg": 12.0, "def": 6.0, "speed": 16.0},
	"spider": {"hp": 55.0, "dmg": 9.0, "def": 4.0, "speed": 20.0},
	"witch": {"hp": 80.0, "dmg": 14.0, "def": 7.0, "speed": 14.0},
	"magma_imp": {"hp": 85.0, "dmg": 16.0, "def": 10.0, "speed": 18.0},
	"magma_golem": {"hp": 150.0, "dmg": 20.0, "def": 18.0, "speed": 10.0},
}

func _ready() -> void:
	var game := get_node_or_null("/root/Game") as Game
	if game != null:
		level = game.roll_mob_level(region_key, fixed_level)
	else:
		level = fixed_level if fixed_level > 0 else 1
	_apply_scaling(game)

func _process(delta: float) -> void:
	if _attack_timer > 0.0:
		_attack_timer = max(_attack_timer - delta, 0.0)

func _apply_scaling(game: Game) -> void:
	var base := BASE_STATS.get(mob_type, BASE_STATS["goblin"])
	max_hp = Formulas.mob_hp(base["hp"], level)
	damage = Formulas.mob_dmg(base["dmg"], level)
	def_value = Formulas.mob_def(base["def"], level)
	move_speed = Formulas.mob_speed(base["speed"], level)

	if game != null:
		max_hp *= game.mob_stat_multiplier()
		damage *= game.mob_stat_multiplier()
		def_value *= game.mob_stat_multiplier()
		move_speed *= game.mob_speed_multiplier()

	hp = max_hp

func attack_player(player: Player) -> bool:
	if _attack_timer > 0.0 or player == null:
		return false
	player.apply_damage(damage)
	_attack_timer = attack_cooldown
	return true
