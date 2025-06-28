extends Node2D
@onready var projectile_detector: Area2D = $ProjectileDetector


func _on_player_detector_body_entered(body: Node2D) -> void:
	Events.room_entered.emit(self)


func _on_projectile_detector_area_entered(area: Area2D) -> void:
	if area is HitboxComponent:
		area.hit_hurtbox.emit(projectile_detector)
func _ready() -> void:
	Events.sin_ended.connect(_open_doors)

func _process(delta: float) -> void:
	if Events.remaining_enemies == 0:
		$Barrier/CollisionPolygon2D.disabled = true
	else:
		$Barrier/CollisionPolygon2D.disabled = false

	if Events.remaining_enemies == 0:
		pass
		Events.completed += 1
	else:
		pass
func _open_doors():
	pass
