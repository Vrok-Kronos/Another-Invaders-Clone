extends KinematicBody2D

enum {
	MOVE_RIGHT,
	MOVE_LEFT,
	MOVE_DOWN
}

const COLLISION_DELAY = 1

var collided
var collision_delay = COLLISION_DELAY
# v_down_timer must be 0.2 less than COLLISION_DELAY or game breaks.
var v_down_timer = 0.8

export (int) var health = 0
export (int) var score = 1


func _physics_process(_delta):
	collided = move_and_collide(Vector2(0, 0))
	
	if collision_delay > 0:
		collision_delay -= 0.1

	elif collided and get_parent().state == MOVE_RIGHT \
			and collision_delay <= 0:
		get_parent()._set_state(MOVE_DOWN)
		get_parent().direction = "LEFT"
		get_parent().down_timer = v_down_timer
		collision_delay = COLLISION_DELAY

	elif collided and get_parent().state == MOVE_LEFT \
			and collision_delay <= 0:
		get_parent()._set_state(MOVE_DOWN)
		get_parent().direction = "RIGHT"
		get_parent().down_timer = v_down_timer
		collision_delay = COLLISION_DELAY
		
	elif collided and collided.get_collider().is_in_group("bottom") \
			or collided and collided.get_collider().is_in_group("player"):
# warning-ignore:return_value_discarded
		get_tree().change_scene_to(load(str("res://assets/scenes/menus/gameOver.tscn")))
