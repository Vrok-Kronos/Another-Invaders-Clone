extends KinematicBody2D


export var speed = 80
var velocity


func _physics_process(delta):
	velocity = Vector2()
	velocity.y -= speed
	velocity = move_and_collide(velocity * delta)
	
	if global_position.y < -8:
		queue_free()
		
# var 'velocity' is equal to move_and_collide wich returns a
# kinematic collision 2D, hence velocity == collision data
	if velocity:
		if velocity.get_collider().health >= 1:
			velocity.get_collider().health -= 1
		else:
			if velocity.get_collider().health < 1:
				velocity.get_collider().queue_free()
			
		queue_free()
