extends EnemyState

@export var launch_effect_spawner_component: SpawnerComponent

func enter() -> void:
	launch_effect_spawner_component.spawn(enemy.global_position)
