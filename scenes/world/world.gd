extends Node2D

@export var player: Player
@onready var black_health_label: Label = $CanvasLayer/UI/HBoxContainer/BlackHealthLabel
@onready var soul_label: Label = $CanvasLayer/UI/HBoxContainer/SoulLabel


func _ready() -> void:
	player.stats_component.black_health_changed.connect(_on_black_health_changed)
	player.stats_component.soul_health_changed.connect(_on_soul_health_changed)
	
	black_health_label.text = "Black Hearth: 1" 
	soul_label.text = "Soul_Hearth: 1"
	
	Events.sin = 0
	Events.remaining_enemies = 0
func _on_black_health_changed(value) -> void:
	black_health_label.text = "Black Hearth: "+ str(value)


func _on_soul_health_changed(value) -> void:
	soul_label.text = "Soul Hearth: "+ str(value)
