extends Node2D

@export var player_stats: Stats
@export var player: Player
var result:float
func _ready() -> void:
	Events.remaining_enemy_changed.connect(_on_remaining_enemy_changed)
	var rng = RandomNumberGenerator.new()
	
	result = rng.randf()
	
	

func _on_remaining_enemy_changed(value: int) -> void:
	if value == 0 and Events.sin == 1 and result > 0.5:
		player.add_soul_health()
	elif value == 0 and Events.sin == 1 and result <= 0.5:
		player.decrease_soul_health()
