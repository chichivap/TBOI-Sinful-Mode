extends Node2D

@onready var projectile_detector: Area2D = $ProjectileDetector

func _on_projectile_detector_area_entered(area: Area2D) -> void:
	if area is HitboxComponent:
		area.hit_hurtbox.emit(projectile_detector)
