extends KinematicBody2D

export (int) var health = 0 setget set_health, get_health


#func _ready():
#	set_health(0)


func set_health(value):
	health = value


func get_health():
	return health
