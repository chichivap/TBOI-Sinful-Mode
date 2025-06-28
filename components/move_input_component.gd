class_name MoveInputComponent
extends Node

@export var stats: Stats
@export var move_component: MoveComponent

var input = Vector2.ZERO

func _physics_process(delta: float) -> void:
	movement(delta)

func get_input() -> Vector2:
	input.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	input.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
	return input.normalized()
	
func movement(delta) -> void:
	input = get_input()
	
	if input == Vector2.ZERO:
		if move_component.velocity.length() > (stats.friction * delta):
			move_component.velocity -= move_component.velocity.normalized() *(stats.friction * delta)
		else:
			move_component.velocity = Vector2.ZERO
	else:
		move_component.velocity += (input * stats.acceleration * delta)
		move_component.velocity = move_component.velocity.limit_length(stats.max_speed)
