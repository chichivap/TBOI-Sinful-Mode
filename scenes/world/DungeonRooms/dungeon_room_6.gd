extends Node2D
@onready var projectile_detector: Area2D = $ProjectileDetector

func _on_player_detector_body_entered(body: Node2D) -> void:
	Events.room_entered.emit(self)


func _on_projectile_detector_area_entered(area: Area2D) -> void:
	if area is HitboxComponent:
		area.hit_hurtbox.emit(projectile_detector)
	

func _process(delta: float) -> void:
	if Events.remaining_enemies == 0:
		$Barrier/CollisionPolygon2D.disabled = true
	else:
		$Barrier/CollisionPolygon2D.disabled = false

	if Events.remaining_enemies == 0:
		Events.sin_ended.emit()
		Events.completed += 1
	else:
		pass
	
