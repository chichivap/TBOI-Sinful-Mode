class_name MoveComponent
extends Node

@export var stats: Stats
@export var actor: CharacterBody2D
@export var velocity: Vector2
@export var wrath_mode: bool

var wrath_mult: int = 2

func _physics_process(delta: float) -> void:
	if Events.sin == 2:
		wrath_mode = true
	else:
		wrath_mode = false
	
	if wrath_mode:
		actor.velocity = velocity * stats.speed * wrath_mult
		actor.move_and_slide()
	else:
		actor.velocity = velocity * stats.speed
		actor.move_and_slide()
		
