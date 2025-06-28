class_name Gaper
extends Enemy

@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D

@export var player: Player 
@onready var navigation_timer: Timer = $NavigationTimer
@onready var flash_component_2: FlashComponent = $FlashComponent2
@onready var animation_player: AnimationPlayer = $StateMachine/WalkingState/AnimationPlayer

var on_nav_link = false
var nav_link_end_pos = Vector2.ZERO

var invis: bool = true

var target_died: bool = false
func _ready() -> void:
	Events.player_died.connect(func():
		target_died = true
		)
	super()
	hurtbox_component.hurt.connect(func(hitbox: HitboxComponent):
		
		flash_component_2.flash()
		)
	navigation_agent_2d.link_reached.connect(_on_nav_link_reached)
	navigation_agent_2d.waypoint_reached.connect(_on_waypoint_reached)
	navigation_timer.timeout.connect(_on_nav_time_timeout)
	call_deferred("actor_setup")
	
func _physics_process(delta: float) -> void:

	if navigation_agent_2d.is_navigation_finished():
		return
	var current_agent_pos = global_position
	var next_path_pos = navigation_agent_2d.get_next_path_position()
	var input = current_agent_pos.direction_to(next_path_pos)	
	
	if input == Vector2.ZERO:
		if move_component.velocity.length() > (move_component.stats.friction * delta):
			move_component.velocity -= move_component.velocity.normalized() *(move_component.stats.friction * delta)
		else:
			move_component.velocity = Vector2.ZERO
	else:
		move_component.velocity += (input * move_component.stats.acceleration * delta)
		move_component.velocity = move_component.velocity.limit_length(move_component.stats.max_speed)
	if soft_collision.is_colliding():
		move_component.velocity += soft_collision.get_push_vector() * 50
	update_body_animation()
func actor_setup() -> void:
	await get_tree().physics_frame
	set_target_position(player.position)
	 
func set_target_position(target_position: Vector2) -> void:
	navigation_agent_2d.target_position = target_position
	

func _on_nav_time_timeout() -> void:
	if not on_nav_link:
		if player.position:
			set_target_position(player.position)

	
func _on_nav_link_reached(details: Dictionary) -> void:
	on_nav_link = true
	nav_link_end_pos = details.link_exit_position

func _on_waypoint_reached(details: Dictionary) -> void:
	if details.position.distance_to(nav_link_end_pos) < 5:
		on_nav_link = false

func update_body_animation() -> void:
	if move_component.velocity == Vector2.ZERO:
		return
	else:
		if abs(move_component.velocity.x) > abs(move_component.velocity.y):
			if move_component.velocity.x > 0:
				animation_player.play("body_right")
			else:
				animation_player.play("body_left")
		else:
			if move_component.velocity.y > 0:
				animation_player.play("body_down")
			else:
				animation_player.play("body_down")
