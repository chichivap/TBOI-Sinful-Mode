class_name ParticleMoveComponent
extends Node

@export var actor: Node2D
@export var direction: Vector2
@export var speed: int
@onready var projectile: Projectile = $".."
@export var max_distance = 175
var distance_travelled: float
var projectile_mult: int


func _process(delta: float) -> void:
	var move = speed * projectile.direction * delta
	actor.translate(projectile.direction * speed * delta)
	distance_travelled += move.length()
	
	if distance_travelled >= max_distance:
		actor.queue_free()
	
	print(projectile.direction)
