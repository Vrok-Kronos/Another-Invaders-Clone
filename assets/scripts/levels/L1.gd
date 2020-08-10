extends Node2D

export (String, "menus", "levels") var sceneDir = "menus"
export (String, "mainMenu", "gameOver") var scene = "mainMenu"
# Add more levels by their scene name. I.E. L4, L5, etc.
export (String, "L1", "L2", "L3") var level = "L1"


func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if sceneDir == "menus":
			_changeScene(sceneDir, scene)
		elif sceneDir == "levels":
			_changeScene(sceneDir, level)


func _changeScene(_dir, _scn):
# warning-ignore:return_value_discarded
	get_tree().change_scene_to(load(str("res://assets/scenes/", _dir, "/", _scn, ".tscn")))
