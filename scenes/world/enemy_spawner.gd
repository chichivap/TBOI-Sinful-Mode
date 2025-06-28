class_name EnemySpawner
extends Node2D

@export var launch_effect: PackedScene
@export var FlyScene: PackedScene
@export var HorfScene: PackedScene
@export var GaperScene: PackedScene

@onready var enemy_spawner_component: EnemySpawnerComponent = $EnemySpawnerComponent
@onready var launch_effect_spawner_component: SpawnerComponent = $LaunchEffectSpawnerComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
