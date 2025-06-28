class_name StateMachine
extends Node

@export var initial_state: EnemyState

var current_state: EnemyState
var states := {}

func init(enemy: Enemy) -> void:
	for child in get_children():
		if child is EnemyState:
			states[child.state] = child
			child.transition_requested.connect(_on_transition_requested)
			child.enemy = enemy

func _process(delta: float) -> void:
	if current_state:
		current_state.on_process(delta)

func on_input(event: InputEvent) -> void:
	if current_state:
		current_state.on_input(event)

func _on_transition_requested(from: EnemyState, to: EnemyState.State) -> void:
	if from != current_state:
		return
	var new_state: EnemyState = states[to]
	if not new_state:
		return
	if current_state:
		current_state.exit()
	new_state.enter()
	current_state = new_state
