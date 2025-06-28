class_name Boss
extends CharacterBody2D
@onready var move_side_compononent: BossMoveComponent = $States/MovingState/MoveSideCompononent

@onready var spawner_projectile_component: SpawnerProjectileComponent = $States/ShootingState/SpawnerProjectileComponent
@onready var sprite_2d: Sprite2D = $Sprite2D

@onready var states: Node = $States
@onready var idle_state: TimedStateComponent = $States/IdleState
@onready var moving_state: TimedStateComponent = $States/MovingState
@onready var shooting_state: StateComponent = $States/ShootingState
@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent
@onready var flash_component: FlashComponent = $FlashComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hurtbox_component.hurt.connect(func(hitbox: HitboxComponent):
		flash_component.flash()
		)
	
	for state in states.get_children():
		state = state as StateComponent
		state.disable()
	move_side_compononent.velocity.x = [-1, 1].pick_random()
	idle_state.state_finished.connect(moving_state.enable)
	
	moving_state.state_finished.connect(func():
		shooting_state.enable()
		spawner_projectile_component.spawn(global_position)
		spawner_projectile_component.spawn(global_position)
		spawner_projectile_component.spawn(global_position)
		spawner_projectile_component.spawn(global_position)
		spawner_projectile_component.spawn(global_position)
		spawner_projectile_component.spawn(global_position)
		shooting_state.disable()
		shooting_state.state_finished.emit()
		)
	shooting_state.state_finished.connect(idle_state.enable)
	idle_state.enable()
	Events.remaining_enemies += 1
