extends EnemyState

@export var launch_effect_spawner_component: SpawnerComponent

func enter() -> void:
	transition_requested.emit(self, EnemyState.State.IDLE)
