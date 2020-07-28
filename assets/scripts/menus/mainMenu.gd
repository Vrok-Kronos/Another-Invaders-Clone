extends Node2D

export (String, "menus", "levels") var sceneDir = "menus"
export (String, "mainMenu", "gameOver") var scene = "mainMenu"
# Add more levels by their scene name. I.E. L4, L5, etc.
export (String, "L1", "L2", "L3") var level = "L1"

onready var highScoreLabel = \
"mainMarginContainer/mainVBoxContainer/scoreHBoxContainer/scoreVBoxContainer/highScoreLabel"

func _ready():
	get_node(highScoreLabel).text = str("highscore: ", globals.highScore).pad_zeros(5)


func _process(_delta):
	if Input.is_action_just_pressed("start_btn"):
		if sceneDir == "menus":
			_changeScene(sceneDir, scene)
		elif sceneDir == "levels":
			_changeScene(sceneDir, level)


func _changeScene(_dir, _scn):
	get_tree().change_scene_to(load(str("res://assets/scenes/", _dir, "/", _scn, ".tscn")))
