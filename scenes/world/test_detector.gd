extends Area2D


func _on_body_entered(body: Node2D) -> void:
	Events.one_sin_entered.emit()
	
