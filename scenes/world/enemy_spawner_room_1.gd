extends EnemySpawner

@onready var gaper_1_launch: Marker2D = $Gaper1Launch

@export var player: Player
func _ready() -> void:
	Events.first_sin_entered.connect(_launch_enemies)

func handle_spawn(enemy_scene: PackedScene,enemy_pos: Vector2) -> void:
	enemy_spawner_component.scene = enemy_scene
	enemy_spawner_component.spawn(enemy_pos,player)
	launch_effect_spawner_component.spawn(enemy_pos)
func handle_effect(enemy_pos: Vector2):
	pass
	


func _launch_enemies() -> void:
	handle_spawn(GaperScene, gaper_1_launch.global_position)
	
