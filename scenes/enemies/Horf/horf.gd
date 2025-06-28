class_name Horf
extends Enemy
@onready var shake_component: ShakeComponent = $ShakeComponent
@onready var spawner_projectile_component: SpawnerProjectileComponent = $SpawnerProjectileComponent
@onready var fire_rate: Timer = $FireRate

enum State {IDLE,SHOOTING}

var state: State

var can_shoot: bool = true

var player: Player

var sees: bool = false
func _ready() -> void:
	super()
	fire_rate.timeout.connect(func(): can_shoot = true)

func _process(delta: float) -> void:
	if not can_shoot:
		return
	
	shoot(Vector2.UP)
	shoot(Vector2.LEFT)
	shoot(Vector2.RIGHT)
	shoot(Vector2.DOWN)
	

func shoot(dir: Vector2) -> void:
	state = State.SHOOTING
	spawner_projectile_component.spawn(global_position, dir)
	can_shoot = false
	fire_rate.start()


func _on_player_detector_body_entered(body: Node2D) -> void:
	if body is Player:
		sees = true
		player = body


func _on_player_detector_body_exited(body: Node2D) -> void:
	if body is Player:
		sees = false
		player = null
