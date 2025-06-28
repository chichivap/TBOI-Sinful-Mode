class_name BossState
extends Node

enum State {IDLE, MOVING, SHOOTING}

@export var state: State
signal transition_requested(from: BossState, to: State)


var boss: Boss

func on_process(delta) -> void:
	pass

func enter() -> void:
	pass

func exit() -> void:
	pass
	
