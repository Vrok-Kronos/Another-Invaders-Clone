extends KinematicBody2D

const SHOOT_DELAY = 4

export var speed = 200

var velocity

onready var laserPlayer = \
		preload("res://assets/scenes/instances/lasers/laserPlayer.tscn")
onready var shootCoolDown = SHOOT_DELAY


func _physics_process(delta):
	velocity = Vector2()
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
	velocity = move_and_collide(velocity * delta)
	
	if shootCoolDown > 0:
		shootCoolDown -= 0.1
	else:
		if Input.is_action_pressed("shoot_btn"):
			var newLaserPlayer = laserPlayer.instance()
			get_node("../laserContainer").add_child(newLaserPlayer)
			newLaserPlayer.position = Vector2(position.x, position.y - 10)
			shootCoolDown = SHOOT_DELAY
		
