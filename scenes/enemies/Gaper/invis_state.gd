extends EnemyState

func enter():
	enemy.visible = false

func _ready() -> void:
	Events.first_sin_entered.connect(_on_one_sin_entered)
	
func _on_one_sin_entered() -> void:
	transition_requested.emit(self,EnemyState.State.LAUNCH)
