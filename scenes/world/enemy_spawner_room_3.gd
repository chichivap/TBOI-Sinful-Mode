extends EnemySpawner

@onready var fly_marker: Marker2D = $FlyMarker
@onready var fly_marker_2: Marker2D = $FlyMarker2
@onready var gaper_marker_2: Marker2D = $GaperMarker2
@onready var gaper_marker_3: Marker2D = $GaperMarker3
@onready var gaper_marker_4: Marker2D = $GaperMarker4
@onready var horf_marker: Marker2D = $HorfMarker
@onready var horf_marker_2: Marker2D = $HorfMarker2


@export var player: Player
func _ready() -> void:
	Events.third_sin_entered.connect(_launch_enemies)

func handle_spawn(enemy_scene: PackedScene,enemy_pos: Vector2) -> void:
	enemy_spawner_component.scene = enemy_scene
	enemy_spawner_component.spawn(enemy_pos,player)
	launch_effect_spawner_component.spawn(enemy_pos)

func _launch_enemies() -> void:
	handle_spawn(FlyScene, fly_marker.global_position)
	handle_spawn(FlyScene, fly_marker_2.global_position)
	handle_spawn(GaperScene, gaper_marker_2.global_position)
	handle_spawn(GaperScene, gaper_marker_3.global_position)
	handle_spawn(GaperScene, gaper_marker_4.global_position)
	handle_spawn(HorfScene, horf_marker.global_position)
	handle_spawn(HorfScene, horf_marker_2.global_position)
	
