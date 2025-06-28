class_name SpawnerBossProjectileComponent
extends SpawnerProjectileComponent

func spawn(global_spawn_position: Vector2 = global_position, direction: Vector2 = Vector2.ZERO,parent: Node = get_tree().current_scene) -> Node:
	assert(scene is PackedScene, "Error: The scene export was never set on this spawner component.")
	# Instance the scene
	var instance = scene.instantiate()
	# Add it as a child of the parent
	parent.add_child(instance)
	# Update the global position of the instance.
	# (This must be done after adding it as a child)
	
	instance.global_position = global_spawn_position
	var angle = randf_range(0.0, TAU)  # 0 to 2π radians
	direction = Vector2.RIGHT.rotated(angle)  # Unit vector in random direction
	instance.direction = direction
	
	# Return the instance in case we want to perform any other operations
	# on it after instancing it.
	return instance
