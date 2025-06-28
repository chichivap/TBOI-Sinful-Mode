class_name GameFinishComponent
extends Node

@export var destroyed_component: DestroyedComponent

func _ready() -> void:
	destroyed_component.destroyed.connect(func():
		get_tree().change_scene_to_file("res://scenes/enemies/Boss/finish.tscn")
		)
