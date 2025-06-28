extends Node2D

@onready var wrath_detector: Area2D = $WrathStatue/ButtonWrath/WrathDetector
@onready var gluttony_detector: Area2D = $GluttonyStatue/GluttonyDetector

var closed_button: Texture = preload("res://art/tilemap/Button/ClosedButton.png")


func _on_wrath_detector_body_entered(body: Node2D) -> void:
	close_all_buttons(Events.Modificators.WRATH)
	Events.sin = 2


func _on_gluttony_detector_body_entered(body: Node2D) -> void:
	close_all_buttons(Events.Modificators.GLUTTONY)
	Events.sin = 1

func close_all_buttons(sin: Events.Modificators) -> void:
	$WrathStatue/ButtonWrath/Sprite2D.texture = closed_button
	$GluttonyStatue/ButtonGluttony/Sprite2D.texture = closed_button
	Events.sin_started.emit(sin)
	Events.third_sin_entered.emit()
	gluttony_detector.queue_free()
	wrath_detector.queue_free()
	
