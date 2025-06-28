extends Node2D
@onready var projectile_detector: Area2D = $ProjectileDetector
@onready var door_walls: StaticBody2D = $"../DungeonRoom2/DoorWalls"
@onready var collision_polygon_2d: CollisionPolygon2D = $"../DungeonRoom2/DoorWalls/CollisionPolygon2D"
@onready var player_detector: Area2D = $"../DungeonRoom8/PlayerDetector"

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
