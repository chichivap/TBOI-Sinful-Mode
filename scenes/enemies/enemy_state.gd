class_name EnemyState
extends Node

enum State {LAUNCH,IDLE, MOVING, SHOOTING}

@export var state: State
signal transition_requested(from: EnemyState, to: State)

var enemy: Enemy

func on_process(delta) -> void:
	pass

func enter() -> void:
	pass

func exit() -> void:
	pass
	
