extends EnemySpawner

@onready var horf_1_launch: Marker2D = $Horf1Launch
@onready var horf_2_launch: Marker2D = $Horf2Launch
@onready var horf_3_launch: Marker2D = $Horf3Launch
@onready var gaper_1_launch: Marker2D = $Gaper1Launch
@onready var gaper_2_launch: Marker2D = $Gaper2Launch
@onready var gaper_3_launch: Marker2D = $Gaper3Launch

@export var player: Player

var flag = true
func _ready() -> void:
	if flag:
		Events.seventh_sin_entered.connect(_launch_enemies)
		flag = false

func handle_spawn(enemy_scene: PackedScene,enemy_pos: Vector2) -> void:
	enemy_spawner_component.scene = enemy_scene
	enemy_spawner_component.spawn(enemy_pos,player)
	launch_effect_spawner_component.spawn(enemy_pos)

func _launch_enemies() -> void:
	handle_spawn(HorfScene, horf_1_launch.global_position)
	handle_spawn(HorfScene, horf_2_launch.global_position)
	handle_spawn(HorfScene, horf_3_launch.global_position)
	handle_spawn(GaperScene, gaper_1_launch.global_position)
	handle_spawn(GaperScene, gaper_2_launch.global_position)
	handle_spawn(GaperScene, gaper_3_launch.global_position)
	
