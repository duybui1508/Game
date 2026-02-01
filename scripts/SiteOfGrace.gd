extends Area3D
class_name SiteOfGrace

@export var auto_rest_on_enter := true

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if not auto_rest_on_enter:
		return
	if body is Player:
		rest(body)

func rest(player: Player) -> void:
	player.hp = player.stats.max_hp
	player.stamina = player.stats.max_stamina
	player.spell = player.stats.max_spell
	player.level_up_all()
