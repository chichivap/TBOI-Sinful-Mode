class_name Projectile
extends Node2D

@export var sender_stats: Stats
@onready var move_component: ParticleMoveComponent = $MoveComponent

var direction: Vector2
@onready var hitbox_component: HitboxComponent = $HitboxComponent

func _ready() -> void:
	hitbox_component.hit_hurtbox.connect(queue_free.unbind(1))
	hitbox_component.damage = sender_stats.strength
	move_component.projectile_mult = sender_stats.projectile_speed
	
