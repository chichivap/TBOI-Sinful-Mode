extends Node2D

@export var FlyScene: PackedScene
@export var HorfScene: PackedScene
@export var GaperScene: PackedScene

@onready var bat_launch_pos_1: Marker2D = $BatLaunchPos1
@onready var bat_launch_pos_2: Marker2D = $BatLaunchPos2

func _ready() -> void:
	Events.one_sin_entered.connect(_launch_enemies)


func _launch_enemies() -> void:
	pass
