# Give the component a class name so it can be instanced as a custom node
class_name StatsComponent
extends Node

# Create the health variable and connect a setter 
@export var soul_health:int = 1:
	set(value):
		if soul_health <= 0:
			black_health -= 1
			return
		soul_health = value
		
		soul_health_changed.emit(value)

@export var black_health: int = 1:
	set(value):
		black_health = value
		
		# Signal out that the health has changed
		black_health_changed.emit(value)
		
		# Signal out when health is at 0
		if black_health <= 0 and soul_health <= 0: no_health.emit()

# Create our signals for health
signal soul_health_changed(value)
signal black_health_changed(value) # Emit when the health value has changed
signal no_health() # Emit when there is no health left
