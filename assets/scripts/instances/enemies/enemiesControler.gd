extends Node2D

enum {
	MOVE_RIGHT,
	MOVE_LEFT,
	MOVE_DOWN
}

var h_speed = 18
var v_speed = 14
var v_distance = 4
var direction = "RIGHT"
var down_timer = 0

onready var next_pos = (global_position.y + v_distance)
onready var state = MOVE_RIGHT


func _process(delta):
	match state:
		
		MOVE_RIGHT:
			global_position.x += h_speed * delta
		
		MOVE_LEFT:
			global_position.x -= h_speed * delta
		
		MOVE_DOWN:
			if down_timer > 0 and global_position.y < next_pos:
				state = MOVE_DOWN
				global_position.y += v_speed * delta
				down_timer -= 0.1
				
			else:
				next_pos = (global_position.y + v_distance)
				_move_down()


func _move_down():
	if direction == "LEFT":
		state = MOVE_LEFT
		
	elif direction == "RIGHT":
		state = MOVE_RIGHT


func _set_state(_state):
	state = _state

