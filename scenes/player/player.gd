class_name Player
extends CharacterBody2D

enum State {IDLE, SHOOTING}

var state: State
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var move_component: MoveComponent = $MoveComponent
@onready var move_input_component: MoveInputComponent = $MoveInputComponent
@onready var spawner_projectile_component: SpawnerProjectileComponent = $SpawnerProjectileComponent
@onready var fire_rate: Timer = $FireRate
@onready var animation_player_2: AnimationPlayer = $AnimationPlayer2
@onready var shake_component: ShakeComponent = $ShakeComponent
@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent
@onready var flash_component: FlashComponent = $FlashComponent
@onready var flash_component_2: FlashComponent = $FlashComponent2
@onready var stats_component: StatsComponent = $StatsComponent
@onready var variable_pitch_audio_stream_player: VariablePitchAudioStreamPlayer = $VariablePitchAudioStreamPlayer

var can_shoot: bool = true

var flag: bool = true
func _ready() -> void:
	fire_rate.timeout.connect(func(): can_shoot = true)
	hurtbox_component.hurt.connect(func(hitbox: HitboxComponent):
		shake_component.tween_shake()
		flash_component.flash()
		flash_component_2.flash()
		)

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_left"):
		if not can_shoot:
			return
		shoot(Vector2.LEFT)
	if Input.is_action_pressed("ui_right"):
		if not can_shoot:
			return
		shoot(Vector2.RIGHT)
	if Input.is_action_pressed("ui_up"):
		if not can_shoot:
			return
		shoot(Vector2.UP)
	if Input.is_action_pressed("ui_down"):
		if not can_shoot:
			return
		shoot(Vector2.DOWN)
	update_head_animation()
	update_body_animation()

func shoot(dir: Vector2) -> void:
	state = State.SHOOTING
	spawner_projectile_component.spawn(global_position + Vector2(0,-10), dir)
	can_shoot = false
	fire_rate.start()
	animate_head(dir)
	variable_pitch_audio_stream_player.play_with_variance()

func animate_head(dir: Vector2) -> void:
	match dir:
		Vector2.UP:
			animation_player.play("head_up")
			await get_tree().create_timer(0.5).timeout
			state = State.IDLE
		Vector2.DOWN:
			animation_player.play("head_down")
			await get_tree().create_timer(0.5).timeout
			state = State.IDLE
		Vector2.RIGHT:
			animation_player.play("head_right")
			await get_tree().create_timer(0.5).timeout	
			state = State.IDLE	
		Vector2.LEFT:
			animation_player.play("head_left")
			await get_tree().create_timer(0.5).timeout
			state = State.IDLE

func update_head_animation() -> void:
	if state == State.SHOOTING:
		return
	if move_input_component.input == Vector2.ZERO:
		animation_player.play("head_down")
		return
	else:
		if abs(move_input_component.input.x) > abs(move_input_component.input.y):
			if move_input_component.input.x > 0:
				animation_player.play("head_right")
			else:
				animation_player.play("head_left")
		else:
			if move_input_component.input.y > 0:
				animation_player.play("head_down")
			else:
				animation_player.play("head_up")
func update_body_animation() -> void:
	if move_input_component.input == Vector2.ZERO:
		animation_player_2.play("idle")
		return
	else:
		if abs(move_input_component.input.x) > abs(move_input_component.input.y):
			if move_input_component.input.x > 0:
				animation_player_2.play("body_right")
			else:
				animation_player_2.play("body_left")
		else:
			if move_input_component.input.y > 0:
				animation_player_2.play("body_up")
			else:
				animation_player_2.play("body_up")

func add_soul_health():
	stats_component.soul_health += 1

func decrease_soul_health():
	stats_component.soul_health -= 1
	
