extends Node
enum Modificators{NULL ,GLUTTONY, ENVY, WRATH}
signal room_entered(room)

var remaining_enemies: int  = 0:
	set(value):
		remaining_enemies = value
		remaining_enemy_changed.emit(remaining_enemies)
		
var active_sin: Modificators = Modificators.NULL:
	set(value):
		active_sin = value
		sin_started.emit(value)

var player_alive: bool = true

signal first_sin_entered()
signal second_sin_entered()
signal third_sin_entered()
signal fourth_sin_entered()
signal fifth_sin_entered()
signal sixth_sin_entered()
signal seventh_sin_entered()
signal eight_sin_entered()

signal remaining_enemy_changed(value: int)

var sin = 0 :
	set(value):
		sin = value
		sin_started.emit(value)
signal sin_started(value)
signal sin_ended()

signal player_died()

var completed: int = 0
