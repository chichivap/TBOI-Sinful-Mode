extends Node2D
@onready var projectile_detector: Area2D = $ProjectileDetector
@onready var door_walls: StaticBody2D = $"../DungeonRoom8/DoorWalls"
@onready var collision_polygon_2d: CollisionPolygon2D = $"../DungeonRoom8/DoorWalls/CollisionPolygon2D"
@onready var player_detector: Area2D = $"../DungeonRoom8/PlayerDetector"

func _on_player_detector_body_entered(body: Node2D) -> void:
	if body is Player:
		Events.room_entered.emit(self)
		Events.eight_sin_entered.emit()
		$StaticBody2D/CollisionShape2D.disabled = false
		$DoorDown.monitoring = false
	
func _on_projectile_detector_area_entered(area: Area2D) -> void:
	if area is HitboxComponent:
		area.hit_hurtbox.emit(projectile_detector)
	
func _process(delta: float) -> void:
	if Events.remaining_enemies == 0:
		$Barrier/CollisionPolygon2D.disabled = true
	else:
		$Barrier/CollisionPolygon2D.disabled = false


	
