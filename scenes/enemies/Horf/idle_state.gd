extends EnemyState

@export var shake_component: ShakeComponent

func enter() -> void:
	shake_component.tween_shake()
	print(self)

func on_process(delta) -> void:
	shake_component.tween_shake()
	print("shaking")
