extends Node2D

var closed_button: Texture = preload("res://art/tilemap/Button/ClosedButton.png")

func _on_envy_detector_body_entered(body: Node2D) -> void:
	close_all_buttons()


func _on_wrath_detector_body_entered(body: Node2D) -> void:
	close_all_buttons()


func _on_gluttony_detector_body_entered(body: Node2D) -> void:
	close_all_buttons()

func close_all_buttons() -> void:
	$EnvyStatue/ButtonEnvy/Sprite2D.texture = closed_button
	$WrathStatue/ButtonWrath/Sprite2D.texture = closed_button
	$GluttonyStatue/ButtonGluttony/Sprite2D.texture = closed_button
