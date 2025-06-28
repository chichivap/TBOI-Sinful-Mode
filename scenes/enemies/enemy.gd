class_name Enemy
extends CharacterBody2D

@onready var marker_2d: Marker2D = $Marker2D

@onready var stats_component: StatsComponent = $StatsComponent
@onready var move_component: MoveComponent = $MoveComponent
@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent
@onready var hitbox_component: HitboxComponent = $HitboxComponent
@onready var destroyed_component: DestroyedComponent = $DestroyedComponent

@onready var state_machine: StateMachine = $StateMachine
@onready var flash_component: FlashComponent = $FlashComponent
@onready var soft_collision: SoftCollision = $SoftCollision
@onready var launch_effect_spawner_component: SpawnerComponent = $LaunchEffectSpawnerComponent

func _ready() -> void:
	stats_component.no_health.connect(_on_no_health)
	#hitbox_component.hit_hurtbox.connect(destroyed_component.destroy.unbind(1))
	state_machine.init(self)
	hurtbox_component.hurt.connect(func(hitbox: HitboxComponent):
		flash_component.flash()
		)
	Events.remaining_enemies += 1
func _on_no_health() -> void:
	print("After enemy died: ", Events.remaining_enemies)
	queue_free()
