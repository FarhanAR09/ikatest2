extends Node

@export var playTimer : PlayTimer

func _ready():
	if playTimer != null:
		playTimer.playTimeout.connect(_EndGame)
	else : prints("WARNING: No play timer set on ", name)

func _exit_tree():
	if playTimer != null:
		playTimer.playTimeout.disconnect(_EndGame)
	else : prints("WARNING: No play timer set on ", name)

func _EndGame():
	get_tree().change_scene_to_file("res://Scenes/mainmenu_scene.tscn")
