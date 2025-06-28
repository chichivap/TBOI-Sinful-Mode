extends EnemySpawner

@export var Judge: PackedScene

@export var player: Player
func _ready() -> void:
	Events.eight_sin_entered.connect(_launch_enemies)


func handle_spawn(enemy_scene: PackedScene,enemy_pos: Vector2) -> void:
	enemy_spawner_component.scene = enemy_scene
	enemy_spawner_component.spawn(enemy_pos,player)
	launch_effect_spawner_component.spawn(enemy_pos)

func _launch_enemies() -> void:
	handle_spawn(Judge, $Marker2D.global_position)
	
