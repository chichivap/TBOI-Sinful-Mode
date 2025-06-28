class_name BossMoveComponent
extends Node

@export var stats: Stats
@export var actor: CharacterBody2D
@export var velocity: Vector2


func _physics_process(delta: float) -> void:
	actor.velocity = velocity * stats.speed 
	actor.move_and_slide()

		
