extends EnemySpawner

@onready var fly_1_mark: Marker2D = $Fly1Mark
@onready var fly_2_mark: Marker2D = $Fly2Mark

@onready var gaper_1_mark: Marker2D = $Gaper1Mark
@onready var gaper_2_mark: Marker2D = $Gaper2Mark


@export var player: Player
func _ready() -> void:
	Events.sixth_sin_entered.connect(_launch_enemies)

func handle_spawn(enemy_scene: PackedScene,enemy_pos: Vector2) -> void:
	enemy_spawner_component.scene = enemy_scene
	enemy_spawner_component.spawn(enemy_pos,player)
	launch_effect_spawner_component.spawn(enemy_pos)

func _launch_enemies() -> void:
	handle_spawn(FlyScene, fly_1_mark.global_position)
	handle_spawn(FlyScene, fly_2_mark.global_position)
	handle_spawn(GaperScene, gaper_1_mark.global_position)
	handle_spawn(GaperScene, gaper_2_mark.global_position)
	
